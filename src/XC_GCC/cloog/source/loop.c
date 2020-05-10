
   /**-------------------------------------------------------------------**
    **                              CLooG                                **
    **-------------------------------------------------------------------**
    **                             loop.c                                **
    **-------------------------------------------------------------------**
    **                  First version: october 26th 2001                 **
    **-------------------------------------------------------------------**/


/******************************************************************************
 *               CLooG : the Chunky Loop Generator (experimental)             *
 ******************************************************************************
 *                                                                            *
 * Copyright (C) 2001-2005 Cedric Bastoul                                     *
 *                                                                            *
 * This is free software; you can redistribute it and/or modify it under the  *
 * terms of the GNU General Public License as published by the Free Software  *
 * Foundation; either version 2 of the License, or (at your option) any later *
 * version.                                                                   *
 *                                                                            *
 * This software is distributed in the hope that it will be useful, but       *
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY *
 * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License   *
 * for more details.                                                          *
 *                                                                            *
 * You should have received a copy of the GNU General Public License along    *
 * with software; if not, write to the Free Software Foundation, Inc.,        *
 * 59 Temple Place, Suite 330, Boston, MA  02111-1307 USA                     *
 *                                                                            *
 * CLooG, the Chunky Loop Generator                                           *
 * Written by Cedric Bastoul, Cedric.Bastoul@inria.fr                         *
 *                                                                            *
 ******************************************************************************/
/* CAUTION: the english used for comments is probably the worst you ever read,
 *          please feel free to correct and improve it !
 */

# include <stdlib.h>
# include <stdio.h>
# include "../include/cloog/cloog.h"


/******************************************************************************
 *                             Memory leaks hunting                           *
 ******************************************************************************/


/**
 * These functions and global variables are devoted to memory leaks hunting: we
 * want to know at each moment how many CloogLoop structures had been allocated
 * (cloog_loop_allocated) and how many had been freed (cloog_loop_freed).
 * Each time a CloogLoog structure is allocated, a call to the function
 * cloog_loop_leak_up() must be carried out, and respectively
 * cloog_loop_leak_down() when a CloogLoop structure is freed. The special
 * variable cloog_loop_max gives the maximal number of CloogLoop structures
 * simultaneously alive (i.e. allocated and non-freed) in memory.
 * - July 3rd->11th 2003: first version (memory leaks hunt and correction).
 */
 
 
extern int cloog_value_allocated ;
extern int cloog_value_freed ;
extern int cloog_value_max ;


int cloog_loop_allocated = 0 ;
int cloog_loop_freed = 0 ;
int cloog_loop_max = 0 ;


static void cloog_loop_leak_up (void)
{
  cloog_loop_allocated ++ ;
  if ((cloog_loop_allocated-cloog_loop_freed) > cloog_loop_max)
  cloog_loop_max = cloog_loop_allocated - cloog_loop_freed ;
}


static void cloog_loop_leak_down (void)
{ cloog_loop_freed ++ ;
}


/******************************************************************************
 *                          Structure display function                        *
 ******************************************************************************/


/**
 * cloog_loop_print_structure function:
 * Displays a loop structure in a way that trends to be understandable without
 * falling in a deep depression or, for the lucky ones, getting a headache... 
 * Written by Olivier Chorier, Luc Marchaud, Pierre Martin and Romain Tartiere.
 * - April 24th 2005: Initial version.
 * - May   21rd 2005: - New parameter `F' for destination file (ie stdout),
 *                    - Minor tweaks.
 * - May   26th 2005: Memory leak hunt.
 * - June   2nd 2005: (Ced) Integration and minor fixes.
 * -June  22nd 2005: (Ced) Adaptation for GMP.
 */
void cloog_loop_print_structure(FILE * file, CloogLoop * loop, int level)
{ int i, j, first=1 ;

  if (loop)
  { /* Go to the right level. */
    for (i=0; i<level; i++)
    fprintf(file,"|\t") ;
    
    fprintf(file,"+-- CloogLoop\n") ;
  }
  
  /* For each loop. */
  while (loop)
  { if (!first)
    { /* Go to the right level. */
      for (i=0; i<level; i++)
      fprintf(file,"|\t") ;
    
      fprintf(file,"|   CloogLoop\n") ;
    }
    else
    first = 0 ;
    
    /* A blank line. */
    for(j=0; j<=level+1; j++)
    fprintf(file,"|\t") ;
    fprintf(file,"\n") ;

    /* Print the domain. */
    cloog_domain_print_structure(file,cloog_loop_domain (loop),level+1) ;
    
    /* Print the stride. */
    for(j=0; j<=level; j++)
    fprintf(file,"|\t") ;
    fprintf(file, "Stride: ") ;
    value_print(file,VALUE_FMT,loop->stride) ;
    fprintf(file, "\n") ;
        
    /* A blank line. */
    for(j=0; j<=level+1; j++)
    fprintf(file,"|\t") ;
    fprintf(file,"\n") ;
    
    /* Print the block. */
    cloog_block_print_structure(file,cloog_loop_block (loop),level+1) ;
    
    /* A blank line. */
    for (i=0; i<=level+1; i++)
    fprintf(file,"|\t") ;  
    fprintf(file,"\n") ;
    
    /* Print inner if any. */
    if (cloog_loop_inner (loop))
      cloog_loop_print_structure (file,cloog_loop_inner (loop), level + 1);
    
    /* And let's go for the next one. */
    loop = cloog_loop_next (loop) ;

    /* One more time something that is here only for a better look. */
    if (!loop)
    { /* Two blank lines if this is the end of the linked list. */
      for (j=0; j<2; j++)
      { for (i=0; i<=level; i++)
        fprintf(file,"|\t") ;
      
        fprintf(file,"\n") ;
      }
    }
    else
    { /* A special blank line if the is a next loop. */
      for (i=0; i<=level; i++)
      fprintf(file,"|\t") ;  
      fprintf(file,"V\n") ;
    }
  }
}


/**
 * cloog_loop_print function:
 * This function prints the content of a CloogLoop structure (start) into a
 * file (file, possibly stdout).
 * - June 2nd 2005: Now this very old function (probably as old as CLooG) is
 *                  only a frontend to cloog_loop_print_structure, with a quite
 *                  better human-readable representation.
 */
void cloog_loop_print(FILE * file, CloogLoop * loop)
{ cloog_loop_print_structure(file,loop,0) ;
}


/******************************************************************************
 *                         Memory deallocation function                       *
 ******************************************************************************/


/**
 * cloog_loop_free function:
 * This function frees the allocated memory for a CloogLoop structure (loop),
 * and frees its inner loops and its next loops.
 * - June 22nd 2005: Adaptation for GMP.
 */
void cloog_loop_free(CloogLoop * loop)
{ CloogLoop * next ;
  
  while (loop != NULL)
  { cloog_loop_leak_down() ;
    
    next = cloog_loop_next (loop) ;
    cloog_domain_free(cloog_loop_domain (loop)) ;
    cloog_block_free(cloog_loop_block (loop)) ;
    if (cloog_loop_inner (loop))
      cloog_loop_free (cloog_loop_inner (loop));
    
    value_clear_c (loop->stride);
    free(loop) ;
    loop = next ;
  }
}


/**
 * cloog_loop_free_parts function:
 * This function frees the allocated memory for some parts of a CloogLoop
 * structure (loop), each other argument is a boolean having to be set to 1 if
 * we want to free the corresponding part, 0 otherwise. This function applies
 * the same freeing policy to its inner ans next loops recursively.
 * - July  3rd 2003: first version.
 * - June 22nd 2005: Adaptation for GMP.
 */
static void
cloog_loop_free_parts (CloogLoop *loop, int domain, int block,
		       int inner, int next)
{
  CloogLoop * follow ;

  while (loop != NULL)
  { cloog_loop_leak_down() ;
    follow = cloog_loop_next (loop) ;
    
    if (domain)
      cloog_domain_free(cloog_loop_domain (loop)) ;
       
    if (block)
      cloog_block_free(cloog_loop_block (loop)) ;
     
    if (inner && cloog_loop_inner (loop))
      cloog_loop_free_parts (cloog_loop_inner (loop), domain, block, inner, 1);
    
    value_clear_c (loop->stride);
    free(loop) ;
    if (next)
    loop = follow ;
    else
    loop = NULL ;
  }
}


/******************************************************************************
 *                              Reading functions                             *
 ******************************************************************************/


/**
 * cloog_loop_read function:
 * This function reads loop data into a file (foo, possibly stdin) and
 * returns a pointer to a CloogLoop structure containing the read information.
 * This function can be used only for input file reading, when one loop is
 * associated with one statement.
 * - number is the statement block number carried by the loop (-1 if none).
 * - nb_parameters is the number of parameters.
 **
 * - September 9th 2002: first version.
 * - April    16th 2005: adaptation to new CloogStatement struct (with number).
 * - June     11th 2005: adaptation to new CloogBlock structure. 
 * - June     22nd 2005: Adaptation for GMP.
 */
CloogLoop * cloog_loop_read(FILE * foo, int number, int nb_parameters)
{ int nb_iterators, op1, op2, op3 ;
  char s[MAX_STRING] ;
  CloogLoop * loop ;
  CloogStatement * statement ;

  cloog_loop_leak_up() ;
  
  /* Memory allocation and information reading for the first domain: */
  loop = (CloogLoop *)malloc(sizeof(CloogLoop)) ;
  if (loop == NULL) 
  { fprintf(stderr, "Memory Overflow.\n") ;
    exit(1) ;
  }
  /* domain. */
  cloog_loop_set_domain (loop, cloog_domain_union_read (foo));
  if (cloog_loop_domain (loop))
    nb_iterators = cloog_domain_dim (cloog_loop_domain (loop)) - nb_parameters ;
  else
    nb_iterators = 0 ;
  /* stride is initialized to 1. */
  value_init_c (loop->stride);
  value_set_si (loop->stride, 1);
  /* included statement block. */
  statement = cloog_statement_alloc(number+1);
  cloog_loop_set_block (loop, cloog_block_alloc (statement, 0, NULL, nb_iterators));
  cloog_loop_set_usr (loop, NULL);
  /* inner is NULL at beginning. */
  cloog_loop_set_inner (loop, NULL);
  /* next element. */
  cloog_loop_set_next (loop, NULL);  
    
  /* To read that stupid "0 0 0" line. */
  while (fgets(s,MAX_STRING,foo) == 0) ;
  while ((*s=='#' || *s=='\n') || (sscanf(s," %d %d %d",&op1,&op2,&op3)<3))
  fgets(s,MAX_STRING,foo) ;

  return loop ;
}


/******************************************************************************
 *                            Processing functions                            *
 ******************************************************************************/


/**
 * cloog_loop_malloc function:
 * This function allocates the memory space for a CloogLoop structure and
 * sets its fields with default values. Then it returns a pointer to the
 * allocated space.
 * - November 21th 2005: first version.
 */
CloogLoop * cloog_loop_malloc (void)
{
  CloogLoop * loop ;
  
  /* Memory allocation for the CloogLoop structure. */
  loop = (CloogLoop *)malloc(sizeof(CloogLoop)) ;
  if (loop == NULL) 
  { fprintf(stderr, "[CLooG]ERROR: memory overflow.\n") ;
    exit(1) ;
  }
  cloog_loop_leak_up() ;
 
  
  /* We set the various fields with default values. */
  cloog_loop_set_domain (loop, NULL);
  cloog_loop_set_block (loop, NULL);
  cloog_loop_set_usr (loop, NULL);
  cloog_loop_set_inner (loop, NULL);
  cloog_loop_set_next (loop, NULL);
  value_init_c (loop->stride);
  value_set_si (loop->stride, 1);
  
  return loop ;
}  


/**
 * cloog_loop_alloc function:
 * This function allocates the memory space for a CloogLoop structure and
 * sets its fields with those given as input. Then it returns a pointer to the
 * allocated space.
 * - October  27th 2001: first version. 
 * - June     22nd 2005: Adaptation for GMP.
 * - November 21th 2005: use of cloog_loop_malloc.
 */ 
static CloogLoop *
cloog_loop_alloc (CloogDomain *domain, Value stride, CloogBlock * block,
		  CloogLoop *inner, CloogLoop *next)
{
  CloogLoop * loop ;
    
  loop = cloog_loop_malloc() ;
  
  cloog_loop_set_domain (loop, domain);
  cloog_loop_set_block (loop, block);
  cloog_loop_set_inner (loop, inner);
  cloog_loop_set_next (loop, next);
  value_assign (loop->stride, stride);
  
  return(loop) ;
}


/**
 * cloog_loop_add function:
 * This function adds a CloogLoop structure (loop) at a given place (now) of a
 * NULL terminated list of CloogLoop structures. The beginning of this list
 * is (start). This function updates (now) to (loop), and updates (start) if the
 * added element is the first one -that is when (start) is NULL-.
 * - October 28th 2001: first version. 
 */ 
static void
cloog_loop_add (CloogLoop ** start, CloogLoop ** now, CloogLoop * loop)
{ 
  if (*start == NULL)
    {
      *start = loop ;
      *now = *start ;
    }
  else
    { 
      cloog_loop_set_next (*now, loop);
      *now = cloog_loop_next (*now);
    }
}


/**
 * cloog_loop_add function:
 * This function adds a CloogLoop structure (loop) at a given place (now) of a
 * NULL terminated list of CloogLoop structures. The beginning of this list
 * is (start). This function updates (now) to the end of the loop list (loop),
 * and updates (start) if the added element is the first one -that is when
 * (start) is NULL-.
 * - September 9th 2005: first version.
 */ 
static void
cloog_loop_add_list (CloogLoop ** start, CloogLoop ** now, CloogLoop * loop)
{ 
  cloog_loop_add (start, now, loop);

  while (cloog_loop_next (*now))
    *now = cloog_loop_next (*now);
}


/**
 * cloog_loop_copy function:
 * This function returns a copy of the CloogLoop structure given as input. In
 * fact, there is just new allocations for the CloogLoop structures, but their
 * contents are the same.
 * - October 28th 2001: first version. 
 * - July 3rd->11th 2003: memory leaks hunt and correction.
 */ 
static CloogLoop *
cloog_loop_copy (CloogLoop * source)
{ CloogLoop * loop ;
  CloogBlock * block ;
  CloogDomain * domain ;

  loop = NULL ;
  if (source != NULL)
    {
      domain = cloog_domain_copy (cloog_loop_domain (source));
      block  = cloog_block_copy (cloog_loop_block (source));
      loop   = cloog_loop_alloc(domain,source->stride,block,NULL,NULL) ;
      cloog_loop_set_usr (loop, cloog_loop_usr (source));
      cloog_loop_set_inner (loop, cloog_loop_copy (cloog_loop_inner (source)));
      cloog_loop_set_next (loop, cloog_loop_copy (cloog_loop_next (source)));
    }
  return(loop) ;
}


/**
 * cloog_loop_add_disjoint function:
 * This function adds some CloogLoop structures at a given place (now) of a
 * NULL terminated list of CloogLoop structures. The beginning of this list
 * is (start). (loop) can be an union of polyhedra, this function separates the
 * union into a list of *disjoint* polyhedra then adds the list. This function
 * updates (now) to the end of the list and updates (start) if first added
 * element is the first of the principal list -that is when (start) is NULL-.
 * (loop) can be freed by this function, basically when its domain is actually
 * a union of polyhedra, but don't worry, all the useful data are now stored
 * inside the list (start). We do not use PolyLib's Domain_Disjoint function,
 * since the number of union components is often higher (thus code size too).
 * - October   28th 2001: first version. 
 * - November  14th 2001: bug correction (this one was hard to find !).
 * - July 3rd->11th 2003: memory leaks hunt and correction.
 * - June      22nd 2005: Adaptation for GMP.
 * - October   27th 2005: (debug) included blocks were not copied for new loops.
 */ 
static void
cloog_loop_add_disjoint (CloogLoop **start, CloogLoop **now, CloogLoop *loop)
{ Value one ;
  CloogLoop * sep, * inner ;
  CloogDomain * domain, * convex, * seen, * seen_before, * temp, * rest ;
  CloogBlock * block ;
  
  value_init_c(one) ;
  value_set_si(one,1) ;
  
  if (cloog_domain_isconvex (cloog_loop_domain (loop)))
    cloog_loop_add(start,now,loop) ;
  else
  { /* Seems useless but may simplify the union expression (PolyLib pb). */
    convex = cloog_domain_convex(cloog_loop_domain (loop)) ;
    temp   = cloog_domain_difference(convex,cloog_loop_domain (loop)) ;
    cloog_domain_free(cloog_loop_domain (loop)) ;
    cloog_loop_set_domain (loop, NULL);
    domain = cloog_domain_difference(convex,temp) ;
    cloog_domain_free(convex) ;
    cloog_domain_free(temp) ;
    
    /* We separate the first element of the rest of the union. */
    rest = cloog_domain_cut_first(domain) ;
            
    /* This first element is the first of the list of disjoint polyhedra. */
    sep = cloog_loop_alloc (domain, one, cloog_loop_block (loop),
			    cloog_loop_inner (loop), NULL);
    cloog_loop_add(start,now,sep) ;
  
    /* If there are other elements, add a loop for each of them. */
    if (rest != NULL)
    { /* domain is used by the first element, and we will free 'seen', so... */
      seen = cloog_domain_copy(domain) ;
       
      while ((domain = rest) != NULL)
      { rest = cloog_domain_cut_first(domain) ;
        temp = cloog_domain_difference(domain,seen) ;
	
        /* Each new loop will have its own life, for instance we can free its
         * inner loop and included block. Then each one must have its own copy
	 * of both 'inner' and 'block'.
         */
        inner = cloog_loop_copy (cloog_loop_inner (loop)) ;
        block = cloog_block_copy (cloog_loop_block (loop)) ;
	
	sep = cloog_loop_alloc(temp,one,block,inner,NULL) ;
        /* temp can be an union too. If so: recursion. */
        if (cloog_domain_isconvex(temp))
        cloog_loop_add(start,now,sep) ;
        else
        cloog_loop_add_disjoint(start,now,sep) ;
       
        seen_before = seen ;
        if (rest != NULL)
        seen = cloog_domain_union(seen_before,domain) ;

        cloog_domain_free(seen_before) ;     
	cloog_domain_free(domain) ;
      }
    }
    cloog_loop_free_parts(loop,0,0,0,0) ;  
  }
  value_clear_c(one) ;
}


/**
 * cloog_loop_disjoint function:
 * This function returns a list of loops such that each loop with non-convex
 * domain in the input list (loop) is separated into several loops where the
 * domains are the components of the union of *disjoint* polyhedra equivalent
 * to the original non-convex domain. See cloog_loop_add_disjoint comments
 * for more details.
 * - September 16th 2005: first version.
 */
static CloogLoop *
cloog_loop_disjoint (CloogLoop * loop)
{ CloogLoop *res=NULL, * now=NULL, * next ;
  
  /* Because this is often the case, don't waste time ! */
  if ((loop != NULL) && cloog_domain_isconvex(cloog_loop_domain (loop)))
  return loop ;

  while (loop != NULL)
    {
      next = cloog_loop_next (loop);
      cloog_loop_set_next (loop, NULL);
      cloog_loop_add_disjoint(&res,&now,loop) ;
      loop = next ;
    }
  
  return res ;
}


/**
 * cloog_loop_restrict function:
 * This function returns the (loop) in the context of (context): it makes the
 * intersection between the (loop) domain and the (context), then it returns
 * a pointer to a new loop, with this intersection as domain.
 * - nb_par is the number of parameters.
 **
 * - October 27th 2001: first version. 
 * - June    15th 2005: a memory leak fixed (domain was not freed when empty).
 * - June    22nd 2005: Adaptation for GMP.
 */ 
static CloogLoop *
cloog_loop_restrict(CloogLoop *loop, CloogDomain *context, int nb_par)
{ int new_dimension ;
  Value one ;
  CloogDomain * domain, * extended_context, * new_domain ;
  CloogLoop * new_loop ;
      
  domain = cloog_loop_domain (loop) ;
  if (cloog_domain_dim(domain) > cloog_domain_dim(context))
  { new_dimension = cloog_domain_dim(domain) - nb_par ;
    extended_context = cloog_domain_extend(context,new_dimension,nb_par) ;
    new_domain = cloog_domain_intersection(extended_context,cloog_loop_domain (loop)) ;
    cloog_domain_free(extended_context) ;
  }
  else
    new_domain = cloog_domain_intersection(context,cloog_loop_domain (loop)) ;
  
  if (cloog_domain_isempty(new_domain))
  { cloog_domain_free(new_domain) ;
    return(NULL) ;
  }
  else
  { value_init_c(one) ;
    value_set_si(one,1) ;
    new_loop = cloog_loop_alloc (new_domain, one, cloog_loop_block (loop),
				 cloog_loop_inner (loop), NULL);
    value_clear_c(one) ;
    return(new_loop) ;
  }
}


/**
 * cloog_loop_project function:
 * This function returns the projection of (loop) on the (level) first
 * dimensions (outer loops). It makes the projection of the (loop) domain,
 * then it returns a pointer to a new loop, with this projection as domain.
 * - nb_par is the number of parameters.
 **
 * - October   27th 2001: first version. 
 * - July 3rd->11th 2003: memory leaks hunt and correction.
 * - June      22nd 2005: Adaptation for GMP.
 */ 
static CloogLoop *
cloog_loop_project(CloogLoop * loop, int level, int nb_par)
{ Value one ;
  CloogDomain * new_domain ;
  CloogLoop * new_loop, * copy ;

  value_init_c(one) ;
  value_set_si(one,1) ;
  
  copy = cloog_loop_alloc(cloog_loop_domain (loop),loop->stride,cloog_loop_block (loop),
                          cloog_loop_inner (loop),NULL) ;

  new_domain = cloog_domain_project(cloog_loop_domain (loop),level,nb_par) ;

  new_loop = cloog_loop_alloc(new_domain,one,NULL,copy,NULL) ;
  value_clear_c(one) ;
  
  return(new_loop) ;
}


/**
 * cloog_loop_concat function:
 * This function returns a pointer to the concatenation of the
 * CloogLoop lists given as input.
 * - October 28th 2001: first version. 
 */
static CloogLoop *
cloog_loop_concat(CloogLoop * a, CloogLoop * b)
{ CloogLoop * loop, * temp ;

  loop = a  ;
  temp = loop ;
  if (loop != NULL)
    { 
      while (cloog_loop_next (temp))
	temp = cloog_loop_next (temp);

      cloog_loop_set_next (temp, b);
    }
  else
  loop = b ;
  
  return(loop) ;
} 


/**
 * cloog_loop_separate function:
 * This function implements the Quillere algorithm for separation of multiple
 * loops: for a given set of polyhedra (loop), it computes a set of disjoint
 * polyhedra such that the unions of these sets are equal, and returns this set.
 * - October   28th 2001: first version. 
 * - November  14th 2001: elimination of some unused blocks.
 * - August    13th 2002: (debug) in the case of union of polyhedra for one
 *                        loop, redundant constraints are fired.
 * - July 3rd->11th 2003: memory leaks hunt and correction.
 * - June      22nd 2005: Adaptation for GMP.
 * - October   16th 2005: Removal of the non-shared constraint elimination when
 *                        there is only one loop in the list (seems to work
 *                        without now, DomainSimplify may have been improved).
 *                        The problem was visible with test/iftest2.cloog.
 */ 
static CloogLoop * cloog_loop_separate(CloogLoop * loop)
{ int first, lazy_equal=0, lazy_disjoint=0 ;
  Value one ;
  CloogLoop * new_loop, * new_inner, * res, * now, * temp, * Q, 
            * inner, * old /*, * previous, * next*/  ;
  CloogDomain * UQ, * old_UQ, * domain ;
  
  if (loop == NULL)
  return NULL ;
  
  if (cloog_loop_next (loop) == NULL)
    return cloog_loop_disjoint (loop);
     
  value_init_c(one) ;
  value_set_si(one,1) ;

  UQ     = cloog_domain_copy(cloog_loop_domain (loop)) ;
  domain = cloog_domain_copy(cloog_loop_domain (loop)) ;
  res    = cloog_loop_alloc(domain,one,cloog_loop_block (loop),cloog_loop_inner (loop),NULL) ;
  	  
  old = loop ;
  while ((loop = cloog_loop_next (loop)))
    {
      temp = NULL ;
      first = 1 ;
    
      /* For all Q, add Q-loop associated with the blocks of Q alone,
       * and Q inter loop associated with the blocks of Q and loop.
       */
      Q = res ;
      while (Q != NULL)
	{ if (cloog_loop_block (Q) == NULL)
	    { /* Add (Q inter loop). */
	      if((lazy_disjoint=cloog_domain_lazy_disjoint(cloog_loop_domain (Q),cloog_loop_domain (loop))))
		domain = NULL ;
	      else
		{ if ((lazy_equal = cloog_domain_lazy_equal(cloog_loop_domain (Q),cloog_loop_domain (loop))))
		    domain = cloog_domain_copy(cloog_loop_domain (Q)) ;
		  else
		    domain = cloog_domain_intersection(cloog_loop_domain (Q),cloog_loop_domain (loop)) ;
          
		  if (!cloog_domain_isempty(domain))
		    { new_inner = cloog_loop_concat(cloog_loop_copy(cloog_loop_inner (Q)),
						    cloog_loop_copy(cloog_loop_inner (loop))) ;
		      new_loop = cloog_loop_alloc(domain,one,NULL,new_inner,NULL) ;
		      cloog_loop_add_disjoint(&temp,&now,new_loop) ;
		    }
		  else
		    cloog_domain_free(domain) ;
		}
        
	      /* Add (Q - loop). */
	      if (lazy_disjoint)
		domain = cloog_domain_copy(cloog_loop_domain (Q)) ;
	      else
		{ if (lazy_equal)
		    domain = cloog_domain_empty(cloog_domain_dim(cloog_loop_domain (Q))) ;
		  else
		    domain = cloog_domain_difference(cloog_loop_domain (Q),cloog_loop_domain (loop)) ;
		}
	
	      if (!cloog_domain_isempty(domain))
		{ new_loop = cloog_loop_alloc(domain,one,NULL,cloog_loop_inner (Q),NULL) ;
		  cloog_loop_add_disjoint(&temp,&now,new_loop) ;
		}
	      else
		{ cloog_domain_free(domain) ;
		  /* If cloog_loop_inner (Q) is no more useful, we can free it. */
		  inner = cloog_loop_inner (Q) ;
		  cloog_loop_set_inner (Q, NULL);
		  if (first) /* For the first Q, inner is also cloog_loop_inner (old). */
		    cloog_loop_set_inner (old, NULL);
		  cloog_loop_free(inner) ;
		}
	    }
	  Q = cloog_loop_next (Q) ;
	}

      /* Add loop-UQ associated with the blocks of loop alone.*/
      if (cloog_domain_lazy_disjoint(cloog_loop_domain (loop),UQ))
	domain = cloog_domain_copy(cloog_loop_domain (loop)) ;
      else
	{ if (cloog_domain_lazy_equal(cloog_loop_domain (loop),UQ))
	    domain = cloog_domain_empty(cloog_domain_dim(UQ)) ;
	  else
	    domain = cloog_domain_difference(cloog_loop_domain (loop),UQ) ;
	}
    
      if (!cloog_domain_isempty(domain))
	{ new_loop = cloog_loop_alloc(domain,one,NULL,cloog_loop_inner (loop),NULL) ;
	  cloog_loop_add_disjoint(&temp,&now,new_loop) ;
	}
      else
	{ cloog_domain_free(domain) ;
	  /* If cloog_loop_inner (loop) is no more useful, we can free it. */
	  cloog_loop_free(cloog_loop_inner (loop)) ;
	}
    
      cloog_loop_set_inner (loop, NULL);

      old_UQ = UQ ;
      if (cloog_loop_next (loop))
	UQ = cloog_domain_union(UQ,cloog_loop_domain (loop)) ;

      cloog_domain_free(old_UQ) ;
      cloog_loop_free_parts(res,1,0,0,1) ;

      first = 0 ;
      res = temp ;
    }  
  cloog_loop_free_parts(old,1,0,0,1) ;
  value_clear_c(one) ;

  return(res) ;
}


/**
 * cloog_loop_merge_list
 * Merge two lists of CloogLoops.  The new list contains the
 * elements of the two lists in the same order, but they may
 * be interleaved.
 * In particular, if the elements of a and b are ordered
 * according to the inner loops of the order list, then so are the elements
 * in the new list.
 */
static CloogLoop *cloog_loop_merge_inner_list(CloogLoop *a, CloogLoop *b, 
					      CloogLoop *order)
{
  CloogLoop *loop, **next;
  next = &loop;

  for ( ; order && (a||b); order = cloog_loop_next (order)) {
    if (a && cloog_loop_block (cloog_loop_inner (order)) == cloog_loop_block (a)) {
      *next = a;
      a = cloog_loop_next (a);
      next = cloog_loop_next_addr (*next);
      continue;
    }
    if (b && cloog_loop_block (cloog_loop_inner (order)) == cloog_loop_block (b)) {
      *next = b;
      b = cloog_loop_next (b);
      next = cloog_loop_next_addr (*next);
    }
  }
  return loop;
}

/**
 * cloog_loop_merge function:
 * This function is the 'soft' version of loop_separate if we are looking for
 * a code much simpler (and less efficicient). Here we merge loops if they have
 * common parts in the iteration space (if the intersection of their domains is
 * not empty), and let them isolated otherwise. This function returns the new
 * CloogLoop list.
 * - October 29th 2001: first version. 
 * - July 3rd->11th 2003: memory leaks hunt and correction.
 * - June      22nd 2005: Adaptation for GMP.
 */ 
static CloogLoop * cloog_loop_merge(CloogLoop * loop, int nb_par, CloogOptions * options)
{ Value one ;
  CloogLoop * res, * merge, * now, * Q, * P, * new_inner, * next, * old ;
  CloogDomain * new_domain, * temp ;

  if ((loop == NULL) || (cloog_loop_next (loop) == NULL))
  return loop ;

  value_init_c(one) ;
  value_set_si(one,1) ;
  
  /* First loop is added to the target list. */
  res = cloog_loop_alloc (cloog_loop_domain (loop), one,
			  cloog_loop_block (loop), cloog_loop_inner (loop), NULL);
  old = loop ;
  /* Now the domain is in 'res' and it will be freed. */
  cloog_loop_set_domain (loop, NULL);
  
  /* And one by one, we see if we have to merge or to add the other loops. */
  while ((loop = cloog_loop_next (loop)))
    {
      merge = NULL ;
      P = cloog_loop_alloc (cloog_loop_domain (loop), one,
			    cloog_loop_block (loop), cloog_loop_inner (loop), NULL) ;
      Q = res ;
      /* Now the domain is in 'P' and it will be freed. */
      cloog_loop_set_domain (loop, NULL);
        
      /* For each loop in the target list, if the intersection with the new loop
       * is empty, we can add the new loop directly, otherwise, we can merge then
       * add the fusion.
       */
      while (Q != NULL)
	{
	  temp = cloog_domain_intersection(cloog_loop_domain (Q),cloog_loop_domain (P)) ;
	  next = cloog_loop_next (Q) ;
	  if (cloog_domain_isempty(temp))
	    { cloog_domain_free(temp) ;
	      cloog_loop_add_disjoint(&merge,&now,Q) ;
	    }
	  else 
	    { cloog_domain_free(temp) ;
	      new_inner = cloog_loop_merge_inner_list(cloog_loop_inner (Q), cloog_loop_inner (P), old);
	      temp = cloog_domain_union(cloog_loop_domain (P),cloog_loop_domain (Q)) ;
	      if (options->sh)
		new_domain = cloog_domain_simple_convex(temp, nb_par);
	      else
		new_domain = cloog_domain_convex(temp);
	      cloog_domain_free(temp) ;
	      /* Q and P are no more used (but their content yes !).*/
	      cloog_loop_free_parts(P,1,0,0,0) ;
	      cloog_loop_free_parts(Q,1,0,0,0) ;
	      P = cloog_loop_alloc(new_domain,one,NULL,new_inner,NULL) ;
	    }
	  Q = next ;
	}

      /* If there was merging, add it, otherwise add the loop lonely.
       * DEBUG : ici pas besoin de s'assurer que cloog_loop_next (P) est NULL (possible que
       * non si pas de fusion) car le dernier loop etudie a cloog_loop_next (loop) = NULL.
       */
      cloog_loop_add_disjoint(&merge,&now,P) ;
      res = merge ;
    }  
  cloog_loop_free_parts(old,0,0,0,1) ;
  value_clear_c(one) ;

  return (res);
}


/**
 * cloog_loop_sort function:
 * Adaptation from LoopGen 0.4 by F. Quillere. This function sorts a list of
 * parameterized disjoint polyhedra, in order to not have lexicographic order
 * violation (see Quillere paper).
 * - September 16th 2005: inclusion of cloog_loop_number (October 29th 2001).
 */ 
static CloogLoop * cloog_loop_sort(CloogLoop * loop, int level, int nb_par)
{ CloogLoop * res, * now, * temp, ** loop_array ;
  CloogDomain ** pols ;
  int i, nb_loops=0, * permut ;
  
  /* We will need to know how many loops are in the list. */
  temp = loop ;
  while (temp != NULL)
    {
      nb_loops ++ ;
      temp = cloog_loop_next (temp) ;
    }

  /* If there is only one loop, it's the end. */
  if (nb_loops == 1)
  return(loop) ;

  /* We have to allocate memory for some useful components:
   * - loop_array: the loop array,
   * - pols: the array of domains to sort,
   * - permut: will give us a possible sort (maybe not the only one).
   */
  loop_array = (CloogLoop **)malloc(nb_loops*sizeof(CloogLoop *)) ;
  pols = (CloogDomain **) malloc (nb_loops * sizeof (CloogDomain *)) ;
  permut = (int *)malloc(nb_loops*sizeof(int)) ;

  /* We fill up the loop and domain arrays. */
  for (i=0;i<nb_loops;i++,loop=cloog_loop_next (loop))
    {
      loop_array[i] = loop ;
      pols[i] = cloog_loop_domain (loop_array[i]) ;
    }
  
  /* cloog_domain_sort will fill up permut. */
  cloog_domain_sort(pols,nb_loops,level,nb_par,permut) ;
  
  /* With permut and loop_array we build the sorted list. */
  res = NULL ;
  for (i=0;i<nb_loops;i++)
  { /* To avoid pointer looping... loop_add will rebuild the list. */
    cloog_loop_set_next (loop_array[permut[i]-1], NULL);
    cloog_loop_add(&res,&now,loop_array[permut[i]-1]) ;
  }
  
  free(permut) ;
  free(pols) ;
  free(loop_array) ;

  return res;
}


/**
 * cloog_loop_nest function:
 * This function changes the loop list in such a way that we have no more than
 * one dimension added by level. It returns an equivalent loop list with
 * this property.
 * - October 29th 2001: first version.
 * - July 3rd->11th 2003: memory leaks hunt and correction.
 * - June      22nd 2005: Adaptation for GMP.
 * - November  21th 2005: (debug) now OK when cloog_loop_restrict returns NULL.
 */ 
static CloogLoop * cloog_loop_nest(CloogLoop *loop, CloogDomain *context, int level, int nb_par)
{ int l ;
  Value one ;
  CloogLoop * p, * temp, * res, * now, * next ;
  CloogDomain * new_domain ;

  value_init_c(one) ;
  value_set_si(one,1) ;
      
  res = NULL ;
  /* Each domain is changed by its intersection with the context. */
  while (loop != NULL)
  { p = cloog_loop_restrict(loop,context,nb_par) ;
    next = cloog_loop_next (loop) ;
    
    if (p != NULL)
    { cloog_loop_free_parts(loop,1,0,0,0) ;
    
      temp = cloog_loop_alloc(cloog_loop_domain (p),one,cloog_loop_block (p),cloog_loop_inner (p),NULL) ;
    
      /* If the intersection dimension is too big, we make projections smaller
       * and smaller, and each projection includes the preceding projection
       * (thus, in the target list, dimensions are added one by one).
       */
      if ((((int) cloog_domain_dim (cloog_loop_domain (p))) - nb_par) > level)
	for (l=cloog_domain_dim(cloog_loop_domain (p))-nb_par-1;l>=level;l--)
	  { new_domain = cloog_domain_project(cloog_loop_domain (p),l,nb_par) ;
        temp = cloog_loop_alloc(new_domain,one,NULL,temp,NULL) ;
      }

       /* p is no more useful (but its content yes !). */ 
      cloog_loop_free_parts(p,0,0,0,0) ;
    
      cloog_loop_add(&res,&now,temp) ;
    }
    else
    cloog_loop_free_parts(loop,1,1,1,0) ;
    
    loop = next ;
  }
  value_clear_c(one) ;
  
  return(res) ;
}


/**
 * cloog_loop_stride_1 function:
 * This function will find the stride of a loop for the iterator at the column
 * number 'level' in the constraint matrix. It will update the lower bound of
 * the iterator accordingly. Basically, the function will try to find in the
 * inner loops a common condition on this iterator for the inner loop iterators
 * to be integral. For instance, let us consider a loop with the iterator i,
 * the iteration domain -4<=i<=n, and its two inner loops with the iterator j.
 * The first inner loop has the constraint 3j=i, and the second one has the
 * constraint 6j=i. Then the common constraint on i for j to be integral is
 * i%3=0, the stride for i is 3. Lastly, we have to find the new lower bound
 * for i: the first value satisfying the common constraint: -3. At the end, the
 * iteration domain for i is -3<=i<=n and the stride for i is 3.
 * - loop is the loop including the iteration domain of the considered iterator,
 * - level is the column number of the iterator in the matrix of contraints.
 **
 * - June 29th 2003: first version (work in progress since June 26th 2003).
 * - July 14th 2003: simpler version.
 * - June 22nd 2005: Adaptation for GMP (from S. Verdoolaege's 0.12.1 version).
 */
static void cloog_loop_stride_1 (CloogLoop * loop, int level, int nb_par)
{ int first_search ;
  Value stride, ref_offset, offset, potential, lower ;
  CloogLoop * inner ;

  value_init_c(stride) ;
  value_init_c(ref_offset) ;
  value_init_c(offset) ;
  value_init_c(potential) ;
  value_init_c(lower) ;

  value_set_si(ref_offset,0) ;
  value_set_si(offset,0) ;
  value_set_si(lower,0) ;

  /* Default stride. */
  value_set_si(stride,1) ;
  first_search = 1 ;
  inner = cloog_loop_inner (loop) ;
    
  if (cloog_domain_integral_lowerbound(cloog_loop_domain (loop),level,&lower))
  while (inner != NULL)
  { /* If the minimun stride has not been found yet, find the stride. */
    if ((first_search) || (value_notone_p(stride)))
      { cloog_domain_stride(cloog_loop_domain (inner),level,nb_par,&potential,&offset) ;
      if (value_notone_p(potential) && (!first_search))
      { /* Offsets must be the same for common stride. */
	Gcd(potential,stride,&stride) ;
	value_modulus(offset, offset, stride);
	value_modulus(ref_offset, ref_offset, stride);
        if (value_ne(offset,ref_offset))
	    value_set_si(stride, 1);
      }
      else
      { value_assign(stride,potential) ;
        value_assign(ref_offset,offset) ;
      }
	
      first_search = 0 ;
    }
      
    inner = cloog_loop_next (inner) ;
  }
    
  /* Update the values if necessary. */
  if (value_notone_p(stride))
  { /* Update the stride value. */
    value_assign (loop->stride, stride);
    /* The new lower bound l' is such that 
     *      (l' + offset) % s = 0 and l <= l' <= l+(s-1)
     * Let l' = k s - offset, then 
     *	    k s - offset <= l + (s-1) <= k s - offset + (s-1)
     * Or   l' = floor((l+offset+(s-1))/s) * s - offset
     *         = (floor((l+offset-1)/s) + 1) * s - offset
     */
    value_addto(lower, lower, offset);
    value_decrement(lower, lower);
    value_pdivision(lower, lower, stride);
    value_increment(lower, lower);
    value_multiply(lower, lower, stride);
    value_subtract(lower, lower, offset);
    cloog_domain_lowerbound_update(cloog_loop_domain (loop),level,lower) ;
  }
  
  value_clear_c(stride) ;
  value_clear_c(ref_offset) ;
  value_clear_c(offset) ;
  value_clear_c(potential) ;
  value_clear_c(lower) ;
}


/**
 * cloog_loop_stop function:
 * This function implements the 'stop' option : each domain of each loop
 * in the list 'loop' is replaced by 'context'. 'context' should be the
 * domain of the outer loop. By using this method, there are no more dimensions
 * to scan and the simplification step will automaticaly remove the domains
 * since they are the same as the corresponding contexts. The effect of this
 * function is to stop the code generation at the level this function is called,
 * the resulting code do not consider the next dimensions.
 * - January 11th 2005: first version.
 */
static CloogLoop * cloog_loop_stop(CloogLoop * loop, CloogDomain * context)
{ if (loop == NULL)
  return NULL ;
  else
    {
      cloog_domain_free(cloog_loop_domain (loop)) ;
      cloog_loop_set_domain (loop, cloog_domain_copy (context));
      cloog_loop_set_next (loop, cloog_loop_stop (cloog_loop_next (loop), context)) ;
    }
  
  return loop ;
}


/**
 * cloog_loop_scalar_gt function:
 * This function returns 1 if loop 'l1' is greater than loop 'l2' for the
 * scalar dimension vector that begins at dimension 'scalar', 0 otherwise. What
 * we want to know is whether a loop is scheduled before another one or not.
 * This function solves the problem when the considered dimension for scheduling
 * is a scalar dimension. Since there may be a succession of scalar dimensions,
 * this function will reason about the vector of scalar dimension that begins
 * at dimension 'level+scalar' and finish to the first non-scalar dimension.
 * \param l1 Loop to be compared with l2.
 * \param l2 Loop to be compared with l1.
 * \param level Current non-scalar dimension.
 * \param scaldims Boolean array saying whether a dimension is scalar or not.
 * \param nb_scattdims Size of the scaldims array.
 * \param scalar Current scalar dimension.
 * \return 1 if (l1 > l2), 0 otherwise.
 **
 * - September 9th 2005: first version.
 * - October  15nd 2007: now "greater than" instead of "greater or equal".
 */
static int cloog_loop_scalar_gt(CloogLoop *l1, CloogLoop *l2, int level, int *scaldims, int scalar)
{
  while ((scalar < cloog_block_nb_scaldims (cloog_loop_block (cloog_loop_inner (l1))))
	 && scaldims[level+scalar-1])
    {
      if (value_gt (cloog_loop_block (cloog_loop_inner (l1))->scaldims[scalar],
		    cloog_loop_block (cloog_loop_inner (l2))->scaldims[scalar]))
	scalar ++ ;
      else
	return 0 ;
    }
  return 1 ;
}


/**
 * cloog_loop_scalar_eq function:
 * This function returns 1 if loop 'l1' is equal to loop 'l2' for the scalar
 * dimension vector that begins at dimension 'scalar', 0 otherwise. What we want
 * to know is whether two loops are scheduled for the same time or not.
 * This function solves the problem when the considered dimension for scheduling
 * is a scalar dimension. Since there may be a succession of scalar dimensions,
 * this function will reason about the vector of scalar dimension that begins
 * at dimension 'level+scalar' and finish to the first non-scalar dimension.
 * - l1 and l2 are the loops to compare,
 * - level is the current non-scalar dimension,
 * - scaldims is the boolean array saying whether a dimension is scalar or not,
 * - scalar is the current scalar dimension.
 **
 * - September 9th 2005 : first version.
 */
static int cloog_loop_scalar_eq(CloogLoop * l1, CloogLoop * l2, int level, int *scaldims, int scalar)
{
  while ((scalar < cloog_block_nb_scaldims (cloog_loop_block (cloog_loop_inner (l1))))
	 && scaldims[level+scalar-1])
    {
      if (value_eq (cloog_loop_block (cloog_loop_inner (l1))->scaldims[scalar],
		    cloog_loop_block (cloog_loop_inner (l2))->scaldims[scalar]))
	scalar ++ ;
      else
	return 0 ;
    }
  return 1 ;
}


/**
 * cloog_loop_scalar_sort function:
 * This function sorts a linked list of loops (loop) with respect to the
 * scalar dimension vector that begins at dimension 'scalar'. Since there may
 * be a succession of scalar dimensions, this function will reason about the
 * vector of scalar dimension that begins at dimension 'level+scalar' and
 * finish to the first non-scalar dimension.
 * \param loop Loop list to sort.
 * \param level Current non-scalar dimension.
 * \param scaldims Boolean array saying whether a dimension is scalar or not.
 * \param scalar Current scalar dimension.
 * \return A pointer to the sorted list.
 **
 * - July      2nd 2005: first developments.
 * - September 2nd 2005: first version.
 * - October  15nd 2007: complete rewrite to remove bugs, now a bubble sort.
 */
static CloogLoop * cloog_loop_scalar_sort(CloogLoop * loop, int level, int *scaldims, int scalar)
{ int ok ;
  CloogLoop **current;
  
  do {
    ok = 1;
    for (current = &loop; cloog_loop_next (*current); current = cloog_loop_next_addr (*current)) {
      CloogLoop *next = cloog_loop_next (*current);
      if (cloog_loop_scalar_gt(*current,next,level,scaldims,scalar)) {
        ok = 0;
	cloog_loop_set_next (*current, cloog_loop_next (next));
	cloog_loop_set_next (next, *current);
	*current = next;
      }
    }
  } while (!ok);

  return loop ;
}


/**
 * cloog_loop_generate_backtrack function:
 * adaptation from LoopGen 0.4 by F. Quillere. This function implements the
 * backtrack of the Quillere et al. algorithm (see the Quillere paper).
 * It eliminates unused iterations of the current level for the new one. See the
 * example called linearity-1-1 example with and without this part for an idea.
 * - October 26th 2001: first version in cloog_loop_generate_general.
 * - July    31th 2002: (debug) no more parasite loops (REALLY hard !). 
 * - October 30th 2005: extraction from cloog_loop_generate_general.
 */
static CloogLoop *
cloog_loop_generate_backtrack (CloogLoop * loop, int level, int nb_par)
{ Value one ;
  CloogDomain * domain ;
  CloogLoop * now, * now2, * next, * next2, * end, * temp, * l, * inner,
            * new_loop ;
  
  value_init_c(one) ;
  value_set_si(one,1) ;

  temp = loop ;
  loop = NULL ;

  while (temp != NULL)
  { l = NULL ;
    inner = cloog_loop_inner (temp) ;
      
    while (inner != NULL)
      {
	next = cloog_loop_next (inner) ;
	/* This 'if' and its first part is the debug of july 31th 2002. */
	if (cloog_loop_block (inner))
	  {
	    end = cloog_loop_alloc (cloog_loop_domain (inner), one,
				    cloog_loop_block (inner), NULL, NULL);
	    domain = cloog_domain_copy(cloog_loop_domain (temp)) ;
	    new_loop = cloog_loop_alloc(domain,one,NULL,end,NULL) ;
	  }
	else
	  new_loop = cloog_loop_project(inner,level,nb_par) ;

	cloog_loop_free_parts(inner,0,0,0,0) ;
	cloog_loop_add(&l,&now2,new_loop) ;
	inner = next ;
      }
      
    cloog_loop_set_inner (temp, NULL);
      
    if (l != NULL)
    { l = cloog_loop_separate(l) ;
      l = cloog_loop_sort(l,level,nb_par) ;
      while (l != NULL)
	{
	  value_assign (l->stride, temp->stride);
	  cloog_loop_add(&loop,&now,l) ;
	  l = cloog_loop_next (l) ;
	}
    }
    next2 = cloog_loop_next (temp) ;
    cloog_loop_free_parts(temp,1,0,0,0) ;
    temp = next2 ;
  }

  value_clear_c(one) ;

  return loop ;
}


/**
 * cloog_loop_generate_general function:
 * Adaptation from LoopGen 0.4 by F. Quillere. This function implements the
 * Quillere algorithm for polyhedron scanning from step 3 to 5.
 * (see the Quillere paper).
 * - loop is the loop for which we have to generate a scanning code,
 * - level is the current non-scalar dimension,
 * - scalar is the current scalar dimension,
 * - scaldims is the boolean array saying whether a dimension is scalar or not,
 * - nb_scattdims is the size of the scaldims array,
 * - nb_par is the number of parameters,
 * - options are the general code generation options.
 **
 * - October 26th 2001: first version.
 * - July 3rd->11th 2003: memory leaks hunt and correction.
 * - June      22nd 2005: Adaptation for GMP.
 * - September  2nd 2005: The function have been cutted out in two pieces:
 *                        cloog_loop_generate and this one, in order to handle
 *                        the scalar dimension case more efficiently with
 *                        cloog_loop_generate_scalar.
 * - November  15th 2005: (debug) the result of the cloog_loop_generate call may
 *                        be a list of polyhedra (especially if stop option is
 *                        used): cloog_loop_add_list instead of cloog_loop_add.
 */ 
static CloogLoop * cloog_loop_generate_general(CloogLoop *loop, int level, int scalar,
					       int *scaldims, int nb_scattdims, int nb_par,
					       CloogOptions *options)
{ Value one ;
  CloogLoop * res, * now, * temp, * l, * new_loop, * inner, * now2, * end,
            * next, * into ;
  CloogDomain * domain ;

  /* 3. Separate all projections into disjoint polyhedra. */
  res = ((options->f > level+scalar) || (options->f < 0)) ?
        cloog_loop_merge(loop, nb_par, options) : cloog_loop_separate(loop);
    
  /* 3b. -correction- sort the loops to determine their textual order. */
  res = cloog_loop_sort(res,level,nb_par) ;
     
  value_init_c(one) ;
  value_set_si(one,1) ;
  
  /* 4. Recurse for each loop with the current domain as context. */
  temp = res ;
  res = NULL ;
  if ((level+scalar < options->l) || (options->l < 0))
  while(temp != NULL)
  { if (options->strides)
    cloog_loop_stride_1 (temp,level,nb_par) ;
    inner = cloog_loop_inner (temp) ;
    domain = cloog_loop_domain (temp) ;
    into = NULL ;
    while (inner != NULL)
    { /* 4b. -ced- recurse for each sub-list of non terminal loops. */
      if ((int) cloog_domain_dim(cloog_loop_domain (inner)) > (level + nb_par))
      { end = inner ;
        while ((cloog_loop_next (end)) &&
               ((int) cloog_domain_dim (cloog_loop_domain (cloog_loop_next (end))) > (level + nb_par)))
	  end = cloog_loop_next (end) ;
        
	next = cloog_loop_next (end) ;
        cloog_loop_set_next (end, NULL);

        l = cloog_loop_generate(inner,domain,level+1,scalar,
	                        scaldims,nb_scattdims,nb_par,options) ;
        
	if (l != NULL)
        cloog_loop_add_list(&into,&now,l) ;
        
        inner = next ;
      }
      else
      { cloog_loop_add(&into,&now,inner) ;
        inner = cloog_loop_next (inner) ;
      }
    }
    next = cloog_loop_next (temp) ;
    cloog_loop_set_next (temp, NULL);
    cloog_loop_set_inner (temp, into);
    cloog_loop_add(&res,&now2,temp) ;
    temp = next ;
  }
  else
  while (temp != NULL)
    { next = cloog_loop_next (temp) ;
    l = cloog_loop_nest(cloog_loop_inner (temp),cloog_loop_domain (temp),level+1,nb_par) ;
    new_loop = cloog_loop_alloc(cloog_loop_domain (temp),one,NULL,l,NULL) ;
    cloog_loop_set_inner (temp, NULL);
    cloog_loop_set_next (temp, NULL);
    cloog_loop_free_parts(temp,0,0,0,0) ;
    cloog_loop_add(&res,&now,new_loop) ;
    temp = next ;
  }
  
  /* 5. eliminate unused iterations of the current level for the new one. See
   *    the example called linearity-1-1 example with and without this part
   *    for an idea.
   */
  if ((!options->nobacktrack) &&
      ((level+scalar < options->l) || (options->l < 0)) &&
      ((options->f <= level+scalar) && !(options->f < 0)))
  res = cloog_loop_generate_backtrack(res,level,nb_par) ;
  
  /* Pray for my new paper to be accepted somewhere since the following stuff
   * is really amazing :-) !
   * Far long later: The paper has been accepted to PACT 2004 :-))). But there
   * are still some bugs and I have no time to fix them. Thus now you have to 
   * pray for me to get an academic position for that really amazing stuff :-) !
   * Later again: OK, I get my academic position, but still I have not enough
   * time to fix and clean this part... Pray again :-) !!!
   */
  /* res = cloog_loop_unisolate(res,context,level,nb_par) ;*/

  value_clear_c(one) ;
  return(res) ;
}


/**
 * cloog_loop_generate_scalar function:
 * This function applies the simplified code generation scheme in the trivial
 * case of scalar dimensions. When dealing with scalar dimensions, there is 
 * no need of costly polyhedral operations for separation or sorting: sorting
 * is a question of comparing scalar vectors and separation amounts to consider
 * only loops with the same scalar vector for the next step of the code
 * generation process. This function achieves the separation/sorting process
 * for the vector of scalar dimension that begins at dimension 'level+scalar'
 * and finish to the first non-scalar dimension.
 * - loop is the loop for which we have to generate a scanning code,
 * - level is the current non-scalar dimension,
 * - scalar is the current scalar dimension,
 * - scaldims is the boolean array saying whether a dimension is scalar or not,
 * - nb_scattdims is the size of the scaldims array,
 * - nb_par is the number of parameters,
 * - options are the general code generation options.
 **
 * - September  2nd 2005: First version.
 */ 
static CloogLoop *
cloog_loop_generate_scalar(CloogLoop *loop, int level, int scalar,
			   int *scaldims, int nb_scattdims, int nb_par,
			   CloogOptions *options)
{ CloogLoop * res, * now, * temp, * l, * end, * next, * ref ;
  
  /* We sort the loop list with respect to the current scalar vector. */
  res = cloog_loop_scalar_sort(loop,level,scaldims,scalar) ;
  
  temp = res ;
  res = NULL ;
  while (temp != NULL)
  { /* Then we will appy the general code generation process to each sub-list
     * of loops with the same scalar vector.
     */
    end = temp ;
    ref = temp ;
    
    while ((cloog_loop_next (end)) &&
	   cloog_loop_scalar_eq(ref,cloog_loop_next (end),level,scaldims,scalar))
      end = cloog_loop_next (end) ;

    next = cloog_loop_next (end) ;
    cloog_loop_set_next (end, NULL);

    /* For the next dimension, scalar value is updated by adding the scalar
     * vector size, which is stored at scaldims[level+scalar-1].
     */
    l = cloog_loop_generate_general(temp,level,
                                    scalar+scaldims[level+scalar-1],
	                            scaldims,nb_scattdims,nb_par,options) ;

    if (l != NULL)
    cloog_loop_add_list(&res,&now,l) ;
      
    temp = next ;
  }
  
  return res ;
}


/**
 * cloog_loop_generate function:
 * Adaptation from LoopGen 0.4 by F. Quillere. This function implements the
 * Quillere algorithm for polyhedron scanning from step 1 to 2.
 * (see the Quillere paper).
 * - loop is the loop for which we have to generate a scanning code,
 * - context is the context of the current loop (constraints on parameter and/or
 *   on outer loop counters),
 * - level is the current non-scalar dimension,
 * - scalar is the current scalar dimension,
 * - scaldims is the boolean array saying whether a dimension is scalar or not,
 * - nb_scattdims is the size of the scaldims array,
 * - nb_par is the number of parameters,
 * - options are the general code generation options.
 **
 * - October 26th 2001: first version.
 * - July 3rd->11th 2003: memory leaks hunt and correction.
 * - June      15th 2005: a memory leak fixed (loop was not entirely freed when
 *                        the result of cloog_loop_restrict was NULL).
 * - June      22nd 2005: Adaptation for GMP.
 * - September  2nd 2005: The function have been cutted out in two pieces:
 *                        cloog_loop_generate and this one, in order to handle
 *                        the scalar dimension case more efficiently with
 *                        cloog_loop_generate_scalar.
 * - November  15th 2005: (debug) Condition for stop option no more take care of
 *                        further scalar dimensions.
 */ 
CloogLoop * cloog_loop_generate(CloogLoop *loop, CloogDomain *context, int level,
				int scalar, int *scaldims, int nb_scattdims, int nb_par,
				CloogOptions *options)
{ CloogLoop * res, * now, * temp, * next, * old ;
  
  /* If the user asked to stop code generation at this level, let's stop. */
  if ((options->stop >= 0) && (level+scalar >= options->stop+1))
  return cloog_loop_stop(loop,context) ;

  res = NULL ;  
  
  /* 1. Replace each polyhedron by its intersection with the context.
   * 2. Compute the projection of each polyhedron onto the outermost
   *    loop variable and the parameters.
   */
  while (loop != NULL)
    {
      next = cloog_loop_next (loop) ;
      temp = cloog_loop_restrict(loop,context,nb_par) ;
    
      if (temp != NULL)
	{ old = temp ;
	  temp = cloog_loop_project(temp,level,nb_par) ;
	  cloog_loop_free_parts(old,0,0,0,0) ;
	  cloog_loop_add(&res,&now,temp) ;
	  cloog_loop_free_parts(loop,1,0,0,0) ;
	}
      else
	{ 
	  cloog_loop_set_next (loop, NULL);
	  cloog_loop_free(loop) ;
	}
    
      loop = next ;
    }
  if (res == NULL)
  return NULL ;

  /* To save both time and memory, we switch here depending on whether the
   * current dimension is scalar (simplified processing) or not (general
   * processing).
   */
  if ((level+scalar <= nb_scattdims) && (scaldims[level+scalar-1]))
  res = cloog_loop_generate_scalar(res,level,scalar,
                                   scaldims,nb_scattdims,nb_par,options) ;
  else
  res = cloog_loop_generate_general(res,level,scalar,
                                    scaldims,nb_scattdims,nb_par,options) ;

  return res ;
}


/**
 * cloog_loop_simplify function:
 * This function implements the part 6. of the Quillere algorithm, it
 * recursively simplifies each loop in the context of the preceding loop domain.
 * It returns a pointer to the simplified loop list.
 * The cloog_domain_simplify (DomainSimplify) behaviour is really bad with
 * polyhedra union and some really awful sidesteppings were written, I plan
 * to solve that...
 * - October   31th 2001: first version. 
 * - July 3rd->11th 2003: memory leaks hunt and correction.
 * - April     16th 2005: a memory leak fixed (extended_context was not freed).
 * - June      15th 2005: a memory leak fixed (loop was not conveniently freed
 *                        when the constraint system is never true).
 * - October   27th 2005: - this function called before cloog_loop_fast_simplify
 *                          is now the official cloog_loop_simplify function in
 *                          replacement of a slower and more complex one (after 
 *                          deep changes in the pretty printer).
 *                        - we use cloog_loop_disjoint to fix the problem when
 *                          simplifying gives a union of polyhedra (before, it
 *                          was under the responsibility of the pretty printer).
 */ 
CloogLoop * cloog_loop_simplify(CloogLoop *loop, CloogDomain *context, int level, int nb_par)
{ int domain_dim ;
  CloogBlock * new_block ;
  CloogLoop * simplified, * inner, * next ;
  CloogDomain * domain, * simp, * inter, * extended_context ;
	     
  if (loop == NULL)
  return(NULL) ;
  
  domain = cloog_loop_domain (loop) ;
  
  next = cloog_loop_simplify(cloog_loop_next (loop),context,level,nb_par) ;
  
  domain_dim = cloog_domain_dim(domain) - nb_par ;
  extended_context=cloog_domain_extend(context,domain_dim,nb_par);
  inter = cloog_domain_intersection(domain,extended_context) ;
  simp = cloog_domain_simplify(inter,extended_context) ;
  cloog_domain_free(extended_context) ;

  /* If the constraint system is never true, go to the next one. */
  if (cloog_domain_never_integral(simp)) {
    cloog_loop_set_next (loop, NULL);
    cloog_loop_free(loop);
    cloog_domain_free(inter);
    cloog_domain_free(simp);
    return next;
  }

  inner = cloog_loop_simplify(cloog_loop_inner (loop),inter,level+1,nb_par) ;
  cloog_domain_free(inter) ;
  
  if ((inner == NULL) && (cloog_loop_block (loop) == NULL))
    { cloog_loop_set_inner (loop, NULL); /* For loop integrity. */
      cloog_loop_set_next (loop, NULL);  /* For loop integrity. */
    cloog_loop_free_parts(loop,1,1,1,0) ;
    cloog_domain_free(simp);
    return(next) ;
  }

  new_block = cloog_block_copy (cloog_loop_block (loop));
  
  simplified = cloog_loop_alloc (simp, loop->stride, new_block, inner, next);
  
  /* Examples like test/iftest2.cloog give unions of polyhedra after
   * simplifying, thus we we have to disjoint them. Another good reason to
   * put the simplifying step in the Quillere backtrack.
   */
  simplified = cloog_loop_disjoint(simplified) ;

  cloog_loop_set_inner (loop, NULL); /* For loop integrity. */
  cloog_loop_set_next (loop, NULL);  /* For loop integrity. */
  cloog_loop_free_parts(loop,1,1,0,0) ;

  return(simplified) ; 
}

/**
 * cloog_loop_scatter function:
 * This function add the scattering (scheduling) informations in a loop.
 */
void cloog_loop_scatter(CloogLoop * loop, CloogDomain * scatt)
{
  CloogDomain *scattered_domain;
  scattered_domain = cloog_domain_scatter(cloog_loop_domain (loop), scatt);
  cloog_loop_set_domain (loop, scattered_domain);
}


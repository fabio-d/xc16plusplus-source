
   /**-------------------------------------------------------------------**
    **                              CLooG                                **
    **-------------------------------------------------------------------**
    **                             names.c                               **
    **-------------------------------------------------------------------**
    **                  First version: august 1st 2002                   **
    **-------------------------------------------------------------------**/


/******************************************************************************
 *               CLooG : the Chunky Loop Generator (experimental)             *
 ******************************************************************************
 *                                                                            *
 * Copyright (C) 2002-2005 Cedric Bastoul                                     *
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
# include <ctype.h>
# include "../include/cloog/cloog.h"


static inline int cloog_names_references (CloogNames *n)
{
  return n->_references;
}

static inline void cloog_names_init_references (CloogNames *n)
{
  n->_references = 1;
}

static inline void cloog_names_inc_references (CloogNames *n)
{
  n->_references++;
}

static inline void cloog_names_dec_references (CloogNames *n)
{
  n->_references--;
}


/******************************************************************************
 *                          Structure display function                        *
 ******************************************************************************/


/**
 * cloog_names_print function:
 * this function is a human-friendly way to display the CloogNames data
 * structure, it shows all the different fields and includes an indentation
 * level (level) in order to work with others print_structure functions.
 * - July 1st 2005: first version based on the old cloog_names_print function,
 *                  it was the first modification in this file since two years !
 */
void cloog_names_print_structure(FILE * file, CloogNames * names, int level)
{ int i ;
  
  /* Go to the right level. */
  for (i=0; i<level; i++)
  fprintf(file,"|\t") ;
  
  if (names != NULL)
  { fprintf(file,"+-- CloogNames\n") ;
    
    /* A blank line. */
    for (i=0; i<=level+1; i++)
    fprintf(file,"|\t") ;
    fprintf(file,"\n") ;

    /* Print the scalar dimension number. */
    for (i=0; i<=level; i++)
    fprintf(file,"|\t") ;
    fprintf (file, "Scalar dimension number ---: %d\n", cloog_names_nb_scalars (names));

    /* A blank line. */
    for (i=0; i<=level+1; i++)
    fprintf(file,"|\t") ;
    fprintf(file,"\n") ;

    /* Print the scalar iterators. */
    for (i=0; i<=level; i++)
    fprintf(file,"|\t") ;
    if (cloog_names_nb_scalars (names) > 0)
    { fprintf(file,"+-- Scalar iterator strings:") ;
      for (i=0;i<cloog_names_nb_scalars (names);i++)
	fprintf(file," %s",cloog_names_scalar_elt (names, i)) ;
      fprintf(file,"\n") ;
    }
    else
    fprintf(file,"+-- No scalar string\n") ;

    /* A blank line. */
    for (i=0; i<=level+1; i++)
    fprintf(file,"|\t") ;
    fprintf(file,"\n") ;

    /* Print the scattering dimension number. */
    for (i=0; i<=level; i++)
    fprintf(file,"|\t") ;
    fprintf(file,"Scattering dimension number: %d\n",cloog_names_nb_scattering (names)) ;

    /* A blank line. */
    for (i=0; i<=level+1; i++)
    fprintf(file,"|\t") ;
    fprintf(file,"\n") ;

    /* Print the scattering iterators. */
    for (i=0; i<=level; i++)
    fprintf(file,"|\t") ;
    if (cloog_names_nb_scattering (names) > 0)
    { fprintf(file,"+-- Scattering strings ----:") ;
      for (i=0;i<cloog_names_nb_scattering (names);i++)
	fprintf (file, " %s", cloog_names_scattering_elt (names, i));
      fprintf(file,"\n") ;
    }
    else
    fprintf(file,"+-- No scattering string\n") ;

    /* A blank line. */
    for (i=0; i<=level+1; i++)
    fprintf(file,"|\t") ;
    fprintf(file,"\n") ;
    
    /* Print the iterator number. */
    for (i=0; i<=level; i++)
    fprintf(file,"|\t") ;
    fprintf(file,"Iterator number -----------: %d\n",cloog_names_nb_iterators (names)) ;

    /* A blank line. */
    for (i=0; i<=level+1; i++)
    fprintf(file,"|\t") ;
    fprintf(file,"\n") ;

    /* Print the iterators. */
    for (i=0; i<=level; i++)
    fprintf(file,"|\t") ;
    if (cloog_names_nb_iterators (names) > 0)
    { fprintf(file,"+-- Iterator strings ------:") ;
      for (i=0;i<cloog_names_nb_iterators (names);i++)
	fprintf(file," %s",cloog_names_iterator_elt (names, i)) ;
      fprintf(file,"\n") ;
    }
    else
    fprintf(file,"+-- No iterators\n") ;

    /* A blank line. */
    for (i=0; i<=level+1; i++)
    fprintf(file,"|\t") ;
    fprintf(file,"\n") ;
    
    /* Print the parameter number. */
    for (i=0; i<=level; i++)
    fprintf(file,"|\t") ;
    fprintf(file,"Parameter number ----------: %d\n",cloog_names_nb_parameters (names)) ;

    /* A blank line. */
    for (i=0; i<=level+1; i++)
    fprintf(file,"|\t") ;
    fprintf(file,"\n") ;

    /* Print the parameters. */
    for (i=0; i<=level; i++)
    fprintf(file,"|\t") ;
    if (cloog_names_nb_parameters (names) > 0)
    { fprintf(file,"+-- Parameter strings -----:") ;
      for (i=0;i<cloog_names_nb_parameters (names);i++)
	fprintf(file," %s",cloog_names_parameter_elt (names, i)) ;
      fprintf(file,"\n") ;
    }
    else
    fprintf(file,"No parameters\n") ;
    
  }
  else
  fprintf(file,"+-- No CloogNames\n") ;
  fprintf(file, "Number of active references: %d\n", cloog_names_references (names));
}


/**
 * cloog_names_print function:
 * This function prints the content of a CloogNames structure (names) into a
 * file (file, possibly stdout).
 * - July 1st 2005: Now this function is only a frontend to
 *                  cloog_program_print_structure, with a quite better
 *                  human-readable representation.
 */
void cloog_names_print(FILE * file, CloogNames * names)
{ cloog_names_print_structure(file,names,0) ;
}


/******************************************************************************
 *                         Memory deallocation function                       *
 ******************************************************************************/


/**
 * cloog_names_free function:
 * This function decrements the number of active references to 
 * a CloogNames structure and frees the allocated memory for this structure
 * if the count drops to zero.
 */
void cloog_names_free(CloogNames * names)
{ int i ;

  cloog_names_dec_references (names);
  if (cloog_names_references (names))
    return;

  if (cloog_names_scalars (names))
    {
      for (i=0;i<cloog_names_nb_scalars (names);i++)
	free (cloog_names_scalar_elt (names, i));
      free (cloog_names_scalars (names));
    }
   
  if (cloog_names_scattering (names))
    {
      for (i=0;i<cloog_names_nb_scattering (names);i++)
	free (cloog_names_scattering_elt (names, i));
      free (cloog_names_scattering (names));
    }
   
  if (cloog_names_iterators (names))
    {
      for (i=0;i<cloog_names_nb_iterators (names);i++)
	free (cloog_names_iterator_elt (names, i)) ;
      free (cloog_names_iterators (names)) ;
    }
   
  if (cloog_names_parameters (names))
    {
      for (i=0;i<cloog_names_nb_parameters (names);i++)
	free (cloog_names_parameter_elt (names, i));
      free(cloog_names_parameters (names));
    }
  free(names) ;
}


/**
 * cloog_names_copy function:
 * As usual in CLooG, "copy" means incrementing the reference count.
 */ 
CloogNames *cloog_names_copy(CloogNames *names)
{
  cloog_names_inc_references (names);
  return names;
}


/******************************************************************************
 *                              Reading functions                             *
 ******************************************************************************/


/**
 * cloog_names_read_strings function:
 * This function reads names data from a file (file, possibly stdin). It first
 * reads the naming option to know if whether has to automatically generate the
 * names, or to read them. Names are stored into an array of strings, and a
 * pointer to this array is returned.
 * - nb_items is the number of names the function will have to read if the
 *   naming option is set to read.
 * - prefix is the prefix to give to each name in case of automatic generation.
 * - first item is the name of the first suffix in case of automatic generation.
 **
 * - September 9th 2002: first version.
 */
char ** cloog_names_read_strings(FILE *file, int nb_items, char *prefix, char first_item)
{ int i, option, n ;
  char s[MAX_STRING], str[MAX_STRING], * c, ** names ;

  /* We first read name option. */
  while (fgets(s,MAX_STRING,file) == 0) ;
  while ((*s=='#' || *s=='\n') || (sscanf(s," %d",&option)<1))
  fgets(s,MAX_STRING,file) ;
  
  /* If there is no item to read, then return NULL. */
  if (nb_items == 0)
  return NULL ;
  
  /* If option is to read them in the file, then we do it and put them into
   * the array.
   */
  if (option)
  { /* Memory allocation. */
    names = (char **)malloc(nb_items*sizeof(char *)) ;
    if (names == NULL) 
    { fprintf(stderr, "[CLooG]ERROR: memory overflow.\n") ;
      exit(1) ;
    }
    for (i=0;i<nb_items;i++)
    { names[i] = (char *)malloc(MAX_NAME*sizeof(char)) ;
      if (names[i] == NULL) 
      { fprintf(stderr, "[CLooG]ERROR: memory overflow.\n") ;
        exit(1) ;
      }
    }
    
    do  /* Skip the comments, spaces and empty lines... */
    { c = fgets(s,MAX_STRING,file) ;
      while ((c != NULL) && isspace(*c) && (*c != '\n'))
      c++ ;
    }
    while (c != NULL && (*c == '#' || *c == '\n'));
    
    if (c == NULL) 
    { fprintf(stderr, "[CLooG]ERROR: no names in input file.\n") ;
      exit(1) ;
    }
    for (i=0;i<nb_items;i++) 
    { /* All names must be on the same line. */
      while (isspace(*c))
      c++ ;
      if (c == NULL || *c == '#' || *c == '\n')
      { fprintf(stderr, "[CLooG]ERROR: not enough names in input file.\n") ;
        exit(1) ;
      }
      /* n is strlen(str). */
      if (sscanf(c,"%s%n",str,&n) == 0) 
      { fprintf(stderr, "[CLooG]ERROR: no names in input file.\n") ;
        exit(1) ;
      }
      sscanf(str,"%s",names[i]) ;
      c += n ;
    }
  }
  /* Else we create names automatically. */
  else
  names = cloog_names_generate_items(nb_items,prefix,first_item) ;

  return names ;
}


/******************************************************************************
 *                            Processing functions                            *
 ******************************************************************************/


/**
 * cloog_names_malloc function:
 * This function allocates the memory space for a CloogNames structure and
 * sets its fields with default values. Then it returns a pointer to the
 * allocated space.
 * - November 21th 2005: first version.
 */
CloogNames * cloog_names_malloc (void)
{ CloogNames * names ;
  
  /* Memory allocation for the CloogNames structure. */
  names = (CloogNames *)malloc(sizeof(CloogNames)) ;
  if (names == NULL) 
  { fprintf(stderr, "[CLooG]ERROR: memory overflow.\n") ;
    exit(1) ;
  }
  
  /* We set the various fields with default values. */
  cloog_names_set_nb_scalars (names, 0);
  cloog_names_set_nb_scattering (names, 0);
  cloog_names_set_nb_iterators (names, 0);
  cloog_names_set_nb_parameters (names, 0);
  cloog_names_set_scalars (names, NULL);
  cloog_names_set_scattering (names, NULL);
  cloog_names_set_iterators (names, NULL);
  cloog_names_set_parameters (names, NULL);
  cloog_names_init_references (names);
  
  return names ;
}  


/**
 * cloog_names_alloc function:
 * This function allocates the memory space for a CloogNames structure and
 * sets its fields with those given as input. Then it returns a pointer to the
 * allocated space.
 * - July       7th 2005: first version.
 * - September 11th 2005: addition of both scalar and scattering informations.
 * - November  21th 2005: use of cloog_names_malloc.
 */
CloogNames * cloog_names_alloc(
     int nb_scalars, int nb_scattering, int nb_iterators, int nb_parameters,
     char **scalars, char **scattering, char **iterators, char **parameters)
{ CloogNames * names ;

  /* Memory allocation for the CloogNames structure. */
  names = cloog_names_malloc() ;
  
  cloog_names_set_nb_scalars (names, nb_scalars);
  cloog_names_set_nb_scattering (names, nb_scattering);
  cloog_names_set_nb_iterators (names, nb_iterators);
  cloog_names_set_nb_parameters (names, nb_parameters);
  cloog_names_set_scalars (names, scalars);
  cloog_names_set_scattering (names, scattering);
  cloog_names_set_iterators (names, iterators);
  cloog_names_set_parameters (names, parameters);
  
  return names ;
}


/**
 * cloog_names_generate_items function:
 * This function returns a pointer to an array of strings with entries set
 * based on the function's parameters.
 * - nb_items will be the number of entries in the string array.
 * - prefix is the name prefix of each item or NULL.
 *   If not NULL, then the remainder of the name will be an integer
 *   in the range [0, nb_items-1].
 * - first_item is the name of the first item (if prefix == NULL),
 *   the nb_items-1 following items will be the nb_items-1
 *   following letters in ASCII code.
 **
 * - September 9th 2002 : first version, extracted from cloog_names_generate.
 */
char ** cloog_names_generate_items(int nb_items, char * prefix, char first_item)
{ int i ;
  char ** names ;
  
  if (nb_items == 0)
  return NULL ;
    
  names = (char **)malloc(nb_items*sizeof(char *)) ;
  if (names == NULL) 
  { fprintf(stderr, "[CLooG]ERROR: memory overflow.\n") ;
    exit(1) ;
  }
  for (i=0;i<nb_items;i++)
  { names[i] = (char *)malloc(MAX_NAME*sizeof(char)) ;
    if (names[i] == NULL) 
    { fprintf(stderr, "[CLooG]ERROR: memory overflow.\n") ;
      exit(1) ;
    }
    if (prefix == NULL)
    sprintf(names[i],"%c",first_item+i) ;
    else
      sprintf(names[i], "%s%d", prefix, 1+i);
  }
  
  return names ;
}


/**
 * cloog_names_generate function:
 * This function returns a pointer to a CloogNames structure with fields set
 * thanks to the function's parameters.
 * - nb_scalars will be the number of scalar dimensions in the structure.
 * - nb_scattering will be the number of scattering dimensions in the structure.
 * - nb_iterators will be the number of iterators in the CloogNames structure.
 * - nb_parameters will be the number of parameters in the CloogNames structure.
 * - first_s is the name of the first scalar iterator, the nb_scalars-1
 *   following iterators will be the nb_scalars-1 following letters in ASCII.
 * - first_t is the name of the first scattering iterator, the nb_scattering-1
 *   following iterators will be the nb_scattering-1 following letters in ASCII.
 * - first_i is the name of the first iterator, the nb_iterators-1 following
 *   iterators will be the nb_iterators-1 following letters in ASCII code.
 * - first_i is the name of the first iterator, the nb_iterators-1 following
 *   iterators will be the nb_iterators-1 following letters in ASCII code.
 * - first_p is the name of the first parameter, the nb_parameters-1 following
 *   parameters will be the nb_parameters-1 following letters in ASCII code.
 **
 * - July       1st 2002 : first version.
 * - September  9th 2002 : use of cloog_names_generate_items.
 * - September 11th 2005 : addition of both scalar and scattering informations.
 */
CloogNames * cloog_names_generate(
     int nb_scalars, int nb_scattering, int nb_iterators, int nb_parameters,
     char first_s, char first_t, char first_i, char first_p)
{ CloogNames * names ;

  names = (CloogNames *)malloc(sizeof(CloogNames)) ;
  if (names == NULL) 
  { fprintf(stderr, "[CLooG]ERROR: memory overflow.\n") ;
    exit(1) ;
  }
  
  cloog_names_set_nb_scalars (names, nb_scalars);
  cloog_names_set_nb_scattering (names, nb_scattering);
  cloog_names_set_nb_parameters (names, nb_parameters);
  cloog_names_set_nb_iterators (names, nb_iterators);
  cloog_names_set_scalars (names, cloog_names_generate_items (nb_scalars, NULL, first_s));
  cloog_names_set_scattering (names, cloog_names_generate_items (nb_scattering,
								 NULL, first_t));
  cloog_names_set_parameters (names, cloog_names_generate_items (nb_parameters, NULL, first_p));
  cloog_names_set_iterators (names, cloog_names_generate_items (nb_iterators, NULL, first_i));

  return names ;
}


/* Lastly we update the CLoogNames structure: the iterators corresponding to
 * scalar dimensions have to be removed since these dimensions have been
 * erased and do not need to be print. We copy all the iterator names except
 * the scalar ones in a new string array.
 * - September 12th 2005: first version. 
 */
void cloog_names_scalarize(CloogNames * names, int nb_scattdims, int * scaldims)
{ int  nb_scalars, nb_scattering, i, current_scalar, current_scattering ;
  char ** scalars, ** scattering ;

  if (!nb_scattdims || (scaldims == NULL))
  return ;
  
  nb_scalars = 0 ;
  for (i=0;i<nb_scattdims;i++)
  if (scaldims[i])
  nb_scalars  ++ ;

  if (!nb_scalars)
  return ;
  
  nb_scattering = cloog_names_nb_scattering (names) - nb_scalars ;
  scattering = (char **)malloc(nb_scattering * sizeof(char *)) ;
  if (scattering == NULL) 
  { fprintf(stderr, "[CLooG]ERROR: memory overflow.\n") ;
    exit(1) ;
  }
  scalars = (char **)malloc(nb_scalars * sizeof(char *)) ;
  if (scalars == NULL) 
  { fprintf(stderr, "[CLooG]ERROR: memory overflow.\n") ;
    exit(1) ;
  }
  
  current_scalar = 0 ;
  current_scattering  = 0 ;
  for (i=0;i<nb_scattdims;i++)
  { if (!scaldims[i])
      { scattering[current_scattering] = cloog_names_scattering_elt (names, i);
      current_scattering ++ ;
    }
    else
      { scalars[current_scalar] = cloog_names_scattering_elt (names, i);
      current_scalar ++ ;
    }
  }
  
  free(cloog_names_scattering (names)) ;
  cloog_names_set_scattering (names, scattering);
  cloog_names_set_scalars (names, scalars);
  cloog_names_set_nb_scattering (names, nb_scattering);
  cloog_names_set_nb_scalars (names, nb_scalars);
}

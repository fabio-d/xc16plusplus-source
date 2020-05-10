/* A Bison parser, made by GNU Bison 1.875c.  */

/* Skeleton parser for Yacc-like parsing with Bison,
   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003 Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 59 Temple Place - Suite 330,
   Boston, MA 02111-1307, USA.  */

/* As a special exception, when this file is copied by Bison into a
   Bison output file, you may use that output file without restriction.
   This special exception was added by the Free Software Foundation
   in version 1.24 of Bison.  */

/* Written by Richard Stallman by simplifying the original so called
   ``semantic'' parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Using locations.  */
#define YYLSP_NEEDED 0



/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     NL = 258,
     MCIDENT = 259,
     MCFILENAME = 260,
     MCLINE = 261,
     MCCOMMENT = 262,
     MCTOKEN = 263,
     MCENDLINE = 264,
     MCLANGUAGENAMES = 265,
     MCFACILITYNAMES = 266,
     MCSEVERITYNAMES = 267,
     MCOUTPUTBASE = 268,
     MCMESSAGEIDTYPEDEF = 269,
     MCLANGUAGE = 270,
     MCMESSAGEID = 271,
     MCSEVERITY = 272,
     MCFACILITY = 273,
     MCSYMBOLICNAME = 274,
     MCNUMBER = 275
   };
#endif
#define NL 258
#define MCIDENT 259
#define MCFILENAME 260
#define MCLINE 261
#define MCCOMMENT 262
#define MCTOKEN 263
#define MCENDLINE 264
#define MCLANGUAGENAMES 265
#define MCFACILITYNAMES 266
#define MCSEVERITYNAMES 267
#define MCOUTPUTBASE 268
#define MCMESSAGEIDTYPEDEF 269
#define MCLANGUAGE 270
#define MCMESSAGEID 271
#define MCSEVERITY 272
#define MCFACILITY 273
#define MCSYMBOLICNAME 274
#define MCNUMBER 275




/* Copy the first part of user declarations.  */
#line 1 "mcparse.y"
 /* mcparse.y -- parser for Windows mc files
  Copyright 2007
  Free Software Foundation, Inc.
  
  Parser for Windows mc files
  Written by Kai Tietz, Onevision.
  
  This file is part of GNU Binutils.
  
  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation; either version 3 of the License, or
  (at your option) any later version.
  
  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.
  
  You should have received a copy of the GNU General Public License
  along with this program; if not, write to the Free Software
  Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston, MA
  02110-1301, USA.  */

/* This is a parser for Windows rc files.  It is based on the parser
   by Gunther Ebert <gunther.ebert@ixos-leipzig.de>.  */

#include "sysdep.h"
#include "bfd.h"
#include "bucomm.h"
#include "libiberty.h"
#include "windmc.h"
#include "safe-ctype.h"

static rc_uint_type mc_last_id = 0;
static rc_uint_type mc_sefa_val = 0;
static unichar *mc_last_symbol = NULL;
static const mc_keyword *mc_cur_severity = NULL;
static const mc_keyword *mc_cur_facility = NULL;
static mc_node *cur_node = NULL;



/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

#if ! defined (YYSTYPE) && ! defined (YYSTYPE_IS_DECLARED)
#line 45 "mcparse.y"
typedef union YYSTYPE {
  rc_uint_type ival;
  unichar *ustr;
  const mc_keyword *tok;
  mc_node *nod;
} YYSTYPE;
/* Line 191 of yacc.c.  */
#line 166 "mcparse.c"
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 214 of yacc.c.  */
#line 178 "mcparse.c"

#if ! defined (yyoverflow) || YYERROR_VERBOSE

# ifndef YYFREE
#  define YYFREE free
# endif
# ifndef YYMALLOC
#  define YYMALLOC malloc
# endif

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   define YYSTACK_ALLOC alloca
#  endif
# else
#  if defined (alloca) || defined (_ALLOCA_H)
#   define YYSTACK_ALLOC alloca
#  else
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning. */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
# else
#  if defined (__STDC__) || defined (__cplusplus)
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   define YYSIZE_T size_t
#  endif
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
# endif
#endif /* ! defined (yyoverflow) || YYERROR_VERBOSE */


#if (! defined (yyoverflow) \
     && (! defined (__cplusplus) \
	 || (defined (YYSTYPE_IS_TRIVIAL) && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  short yyss;
  YYSTYPE yyvs;
  };

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (short) + sizeof (YYSTYPE))				\
      + YYSTACK_GAP_MAXIMUM)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined (__GNUC__) && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  register YYSIZE_T yyi;		\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (0)
#  endif
# endif

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack)					\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack, Stack, yysize);				\
	Stack = &yyptr->Stack;						\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (0)

#endif

#if defined (__STDC__) || defined (__cplusplus)
   typedef signed char yysigned_char;
#else
   typedef short yysigned_char;
#endif

/* YYFINAL -- State number of the termination state. */
#define YYFINAL  3
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   114

/* YYNTOKENS -- Number of terminals. */
#define YYNTOKENS  26
/* YYNNTS -- Number of nonterminals. */
#define YYNNTS  29
/* YYNRULES -- Number of rules. */
#define YYNRULES  82
/* YYNRULES -- Number of states. */
#define YYNSTATES  125

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   275

#define YYTRANSLATE(YYX) 						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const unsigned char yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
      22,    23,     2,    25,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,    24,     2,
       2,    21,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const unsigned short yyprhs[] =
{
       0,     0,     3,     5,     6,     9,    11,    13,    15,    17,
      23,    29,    33,    36,    42,    48,    52,    55,    61,    67,
      71,    74,    78,    82,    86,    89,    91,    94,    96,   101,
     105,   108,   110,   113,   115,   120,   124,   127,   129,   132,
     134,   141,   148,   153,   157,   160,   161,   164,   167,   168,
     173,   177,   181,   184,   185,   187,   190,   193,   194,   197,
     200,   203,   207,   211,   215,   217,   220,   225,   227,   230,
     232,   235,   237,   240,   246,   252,   258,   263,   266,   268,
     270,   271,   272
};

/* YYRHS -- A `-1'-separated list of the rules' RHS. */
static const yysigned_char yyrhs[] =
{
      27,     0,    -1,    28,    -1,    -1,    28,    29,    -1,    30,
      -1,    38,    -1,    49,    -1,     1,    -1,    12,    21,    22,
      31,    23,    -1,    12,    21,    22,    31,     1,    -1,    12,
      21,     1,    -1,    12,     1,    -1,    10,    21,    22,    35,
      23,    -1,    10,    21,    22,    35,     1,    -1,    10,    21,
       1,    -1,    10,     1,    -1,    11,    21,    22,    33,    23,
      -1,    11,    21,    22,    33,     1,    -1,    11,    21,     1,
      -1,    11,     1,    -1,    13,    21,    20,    -1,    14,    21,
       4,    -1,    14,    21,     1,    -1,    14,     1,    -1,    32,
      -1,    31,    32,    -1,     1,    -1,    51,    21,    20,    37,
      -1,    51,    21,     1,    -1,    51,     1,    -1,    34,    -1,
      33,    34,    -1,     1,    -1,    51,    21,    20,    37,    -1,
      51,    21,     1,    -1,    51,     1,    -1,    36,    -1,    35,
      36,    -1,     1,    -1,    51,    21,    20,    54,    24,     5,
      -1,    51,    21,    20,    54,    24,     1,    -1,    51,    21,
      20,     1,    -1,    51,    21,     1,    -1,    51,     1,    -1,
      -1,    24,     4,    -1,    24,     1,    -1,    -1,    40,    42,
      39,    46,    -1,    16,    21,    41,    -1,    16,    21,     1,
      -1,    16,     1,    -1,    -1,    20,    -1,    25,    20,    -1,
      25,     1,    -1,    -1,    42,    43,    -1,    42,    44,    -1,
      42,    45,    -1,    17,    21,     8,    -1,    18,    21,     8,
      -1,    19,    21,     4,    -1,    47,    -1,    46,    47,    -1,
      50,    53,    48,     9,    -1,     6,    -1,    48,     6,    -1,
       1,    -1,    48,     1,    -1,     7,    -1,    49,     7,    -1,
      15,    52,    21,     8,     3,    -1,    15,    52,    21,     4,
       3,    -1,    15,    52,    21,    51,     1,    -1,    15,    52,
      21,     1,    -1,    15,     1,    -1,     4,    -1,     8,    -1,
      -1,    -1,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const unsigned short yyrline[] =
{
       0,    67,    67,    70,    72,    74,    75,    76,    81,    85,
      86,    87,    88,    89,    90,    91,    92,    93,    94,    95,
      96,    97,   103,   107,   111,   118,   119,   120,   124,   128,
     129,   133,   134,   135,   139,   143,   144,   148,   149,   150,
     154,   158,   159,   160,   161,   166,   169,   173,   178,   177,
     190,   191,   192,   196,   199,   203,   207,   212,   219,   225,
     231,   239,   247,   255,   262,   263,   267,   277,   281,   293,
     294,   297,   298,   312,   316,   321,   326,   331,   338,   339,
     343,   347,   351
};
#endif

#if YYDEBUG || YYERROR_VERBOSE
/* YYTNME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals. */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "NL", "MCIDENT", "MCFILENAME", "MCLINE",
  "MCCOMMENT", "MCTOKEN", "MCENDLINE", "MCLANGUAGENAMES",
  "MCFACILITYNAMES", "MCSEVERITYNAMES", "MCOUTPUTBASE",
  "MCMESSAGEIDTYPEDEF", "MCLANGUAGE", "MCMESSAGEID", "MCSEVERITY",
  "MCFACILITY", "MCSYMBOLICNAME", "MCNUMBER", "'='", "'('", "')'", "':'",
  "'+'", "$accept", "input", "entities", "entity", "global_section",
  "severitymaps", "severitymap", "facilitymaps", "facilitymap", "langmaps",
  "langmap", "alias_name", "message", "@1", "id", "vid", "sefasy_def",
  "severity", "facility", "symbol", "lang_entities", "lang_entity",
  "lines", "comments", "lang", "token", "lex_want_nl", "lex_want_line",
  "lex_want_filename", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const unsigned short yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,    61,    40,    41,    58,    43
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const unsigned char yyr1[] =
{
       0,    26,    27,    28,    28,    29,    29,    29,    29,    30,
      30,    30,    30,    30,    30,    30,    30,    30,    30,    30,
      30,    30,    30,    30,    30,    31,    31,    31,    32,    32,
      32,    33,    33,    33,    34,    34,    34,    35,    35,    35,
      36,    36,    36,    36,    36,    37,    37,    37,    39,    38,
      40,    40,    40,    41,    41,    41,    41,    42,    42,    42,
      42,    43,    44,    45,    46,    46,    47,    48,    48,    48,
      48,    49,    49,    50,    50,    50,    50,    50,    51,    51,
      52,    53,    54
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const unsigned char yyr2[] =
{
       0,     2,     1,     0,     2,     1,     1,     1,     1,     5,
       5,     3,     2,     5,     5,     3,     2,     5,     5,     3,
       2,     3,     3,     3,     2,     1,     2,     1,     4,     3,
       2,     1,     2,     1,     4,     3,     2,     1,     2,     1,
       6,     6,     4,     3,     2,     0,     2,     2,     0,     4,
       3,     3,     2,     0,     1,     2,     2,     0,     2,     2,
       2,     3,     3,     3,     1,     2,     4,     1,     2,     1,
       2,     1,     2,     5,     5,     5,     4,     2,     1,     1,
       0,     0,     0
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const unsigned char yydefact[] =
{
       3,     0,     0,     1,     8,    71,     0,     0,     0,     0,
       0,     0,     4,     5,     6,    57,     7,    16,     0,    20,
       0,    12,     0,     0,    24,     0,    52,     0,    48,    72,
      15,     0,    19,     0,    11,     0,    21,    23,    22,    51,
      54,     0,    50,     0,     0,     0,     0,    58,    59,    60,
      39,    78,    79,     0,    37,     0,    33,     0,    31,     0,
      27,     0,    25,     0,    56,    55,     0,     0,     0,     0,
      49,    64,    81,    14,    13,    38,    44,     0,    18,    17,
      32,    36,     0,    10,     9,    26,    30,     0,    61,    62,
      63,    77,     0,    65,     0,    43,     0,    35,    45,    29,
      45,     0,    69,    67,     0,    42,     0,     0,    34,    28,
      76,    78,    79,     0,    70,    68,    66,     0,    47,    46,
      74,    73,    75,    41,    40
};

/* YYDEFGOTO[NTERM-NUM]. */
static const yysigned_char yydefgoto[] =
{
      -1,     1,     2,    12,    13,    61,    62,    57,    58,    53,
      54,   108,    14,    46,    15,    42,    28,    47,    48,    49,
      70,    71,   104,    16,    72,    55,    92,    94,   106
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -34
static const yysigned_char yypact[] =
{
     -34,    62,    70,   -34,   -34,   -34,    15,    22,    30,   -15,
      34,    37,   -34,   -34,   -34,   -34,    56,   -34,    10,   -34,
      12,   -34,    20,    25,   -34,    52,   -34,     0,    80,   -34,
     -34,    71,   -34,    84,   -34,    86,   -34,   -34,   -34,   -34,
     -34,    45,   -34,     1,    68,    74,    76,   -34,   -34,   -34,
     -34,   -34,   -34,     4,   -34,    38,   -34,     6,   -34,    39,
     -34,    29,   -34,    40,   -34,   -34,    93,    94,    99,    43,
      76,   -34,   -34,   -34,   -34,   -34,   -34,    46,   -34,   -34,
     -34,   -34,    47,   -34,   -34,   -34,   -34,    49,   -34,   -34,
     -34,   -34,    83,   -34,     3,   -34,     2,   -34,    81,   -34,
      81,    92,   -34,   -34,    48,   -34,    82,    72,   -34,   -34,
     -34,   104,   105,   108,   -34,   -34,   -34,    73,   -34,   -34,
     -34,   -34,   -34,   -34,   -34
};

/* YYPGOTO[NTERM-NUM].  */
static const yysigned_char yypgoto[] =
{
     -34,   -34,   -34,   -34,   -34,   -34,    50,   -34,    53,   -34,
      59,    13,   -34,   -34,   -34,   -34,   -34,   -34,   -34,   -34,
     -34,    44,   -34,   -34,   -34,   -33,   -34,   -34,   -34
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -83
static const yysigned_char yytable[] =
{
      59,    39,    63,   105,   102,    73,    23,    78,    51,   103,
      51,    30,    52,    32,    52,   -53,    17,   -53,   -53,   -53,
      40,    34,    66,    19,    59,    41,   -82,    74,    63,    79,
      83,    21,    31,    51,    33,    24,    18,    52,    26,    76,
      81,    86,    35,    20,    91,    36,    64,    95,    97,   114,
      99,    22,    84,    37,   115,    25,    38,   116,    27,    77,
      82,    87,     3,    29,   -80,    65,    96,    98,   113,   100,
      -2,     4,    50,   118,   123,    51,   119,     5,   124,    52,
       6,     7,     8,     9,    10,    56,    11,    60,    51,    67,
      51,    69,    52,   110,    52,    68,   111,    43,    44,    45,
     112,    88,    89,    90,   101,   107,   117,   120,   121,   122,
      80,    85,    75,   109,    93
};

static const unsigned char yycheck[] =
{
      33,     1,    35,     1,     1,     1,    21,     1,     4,     6,
       4,     1,     8,     1,     8,    15,     1,    17,    18,    19,
      20,     1,    21,     1,    57,    25,    24,    23,    61,    23,
       1,     1,    22,     4,    22,     1,    21,     8,     1,     1,
       1,     1,    22,    21,     1,    20,     1,     1,     1,     1,
       1,    21,    23,     1,     6,    21,     4,     9,    21,    21,
      21,    21,     0,     7,    21,    20,    20,    20,   101,    20,
       0,     1,     1,     1,     1,     4,     4,     7,     5,     8,
      10,    11,    12,    13,    14,     1,    16,     1,     4,    21,
       4,    15,     8,     1,     8,    21,     4,    17,    18,    19,
       8,     8,     8,     4,    21,    24,    24,     3,     3,     1,
      57,    61,    53,   100,    70
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const unsigned char yystos[] =
{
       0,    27,    28,     0,     1,     7,    10,    11,    12,    13,
      14,    16,    29,    30,    38,    40,    49,     1,    21,     1,
      21,     1,    21,    21,     1,    21,     1,    21,    42,     7,
       1,    22,     1,    22,     1,    22,    20,     1,     4,     1,
      20,    25,    41,    17,    18,    19,    39,    43,    44,    45,
       1,     4,     8,    35,    36,    51,     1,    33,    34,    51,
       1,    31,    32,    51,     1,    20,    21,    21,    21,    15,
      46,    47,    50,     1,    23,    36,     1,    21,     1,    23,
      34,     1,    21,     1,    23,    32,     1,    21,     8,     8,
       4,     1,    52,    47,    53,     1,    20,     1,    20,     1,
      20,    21,     1,     6,    48,     1,    54,    24,    37,    37,
       1,     4,     8,    51,     1,     6,     9,    24,     1,     4,
       3,     3,     1,     1,     5
};

#if ! defined (YYSIZE_T) && defined (__SIZE_TYPE__)
# define YYSIZE_T __SIZE_TYPE__
#endif
#if ! defined (YYSIZE_T) && defined (size_t)
# define YYSIZE_T size_t
#endif
#if ! defined (YYSIZE_T)
# if defined (__STDC__) || defined (__cplusplus)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# endif
#endif
#if ! defined (YYSIZE_T)
# define YYSIZE_T unsigned int
#endif

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */

#define YYFAIL		goto yyerrlab

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      yytoken = YYTRANSLATE (yychar);				\
      YYPOPSTACK;						\
      goto yybackup;						\
    }								\
  else								\
    { 								\
      yyerror ("syntax error: cannot back up");\
      YYERROR;							\
    }								\
while (0)

#define YYTERROR	1
#define YYERRCODE	256

/* YYLLOC_DEFAULT -- Compute the default location (before the actions
   are run).  */

#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)		\
   ((Current).first_line   = (Rhs)[1].first_line,	\
    (Current).first_column = (Rhs)[1].first_column,	\
    (Current).last_line    = (Rhs)[N].last_line,	\
    (Current).last_column  = (Rhs)[N].last_column)
#endif

/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (0)

# define YYDSYMPRINT(Args)			\
do {						\
  if (yydebug)					\
    yysymprint Args;				\
} while (0)

# define YYDSYMPRINTF(Title, Token, Value, Location)		\
do {								\
  if (yydebug)							\
    {								\
      YYFPRINTF (stderr, "%s ", Title);				\
      yysymprint (stderr, 					\
                  Token, Value);	\
      YYFPRINTF (stderr, "\n");					\
    }								\
} while (0)

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if defined (__STDC__) || defined (__cplusplus)
static void
yy_stack_print (short *bottom, short *top)
#else
static void
yy_stack_print (bottom, top)
    short *bottom;
    short *top;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (/* Nothing. */; bottom <= top; ++bottom)
    YYFPRINTF (stderr, " %d", *bottom);
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if defined (__STDC__) || defined (__cplusplus)
static void
yy_reduce_print (int yyrule)
#else
static void
yy_reduce_print (yyrule)
    int yyrule;
#endif
{
  int yyi;
  unsigned int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %u), ",
             yyrule - 1, yylno);
  /* Print the symbols being reduced, and their result.  */
  for (yyi = yyprhs[yyrule]; 0 <= yyrhs[yyi]; yyi++)
    YYFPRINTF (stderr, "%s ", yytname [yyrhs[yyi]]);
  YYFPRINTF (stderr, "-> %s\n", yytname [yyr1[yyrule]]);
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (Rule);		\
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YYDSYMPRINT(Args)
# define YYDSYMPRINTF(Title, Token, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   SIZE_MAX < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#if defined (YYMAXDEPTH) && YYMAXDEPTH == 0
# undef YYMAXDEPTH
#endif

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif



#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined (__GLIBC__) && defined (_STRING_H)
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
static YYSIZE_T
#   if defined (__STDC__) || defined (__cplusplus)
yystrlen (const char *yystr)
#   else
yystrlen (yystr)
     const char *yystr;
#   endif
{
  register const char *yys = yystr;

  while (*yys++ != '\0')
    continue;

  return yys - yystr - 1;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined (__GLIBC__) && defined (_STRING_H) && defined (_GNU_SOURCE)
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
#   if defined (__STDC__) || defined (__cplusplus)
yystpcpy (char *yydest, const char *yysrc)
#   else
yystpcpy (yydest, yysrc)
     char *yydest;
     const char *yysrc;
#   endif
{
  register char *yyd = yydest;
  register const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

#endif /* !YYERROR_VERBOSE */



#if YYDEBUG
/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if defined (__STDC__) || defined (__cplusplus)
static void
yysymprint (FILE *yyoutput, int yytype, YYSTYPE *yyvaluep)
#else
static void
yysymprint (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  /* Pacify ``unused variable'' warnings.  */
  (void) yyvaluep;

  if (yytype < YYNTOKENS)
    {
      YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
# ifdef YYPRINT
      YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# endif
    }
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  switch (yytype)
    {
      default:
        break;
    }
  YYFPRINTF (yyoutput, ")");
}

#endif /* ! YYDEBUG */
/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

#if defined (__STDC__) || defined (__cplusplus)
static void
yydestruct (int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yytype, yyvaluep)
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  /* Pacify ``unused variable'' warnings.  */
  (void) yyvaluep;

  switch (yytype)
    {

      default:
        break;
    }
}


/* Prevent warnings from -Wmissing-prototypes.  */

#ifdef YYPARSE_PARAM
# if defined (__STDC__) || defined (__cplusplus)
int yyparse (void *YYPARSE_PARAM);
# else
int yyparse ();
# endif
#else /* ! YYPARSE_PARAM */
#if defined (__STDC__) || defined (__cplusplus)
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */



/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;



/*----------.
| yyparse.  |
`----------*/

#ifdef YYPARSE_PARAM
# if defined (__STDC__) || defined (__cplusplus)
int yyparse (void *YYPARSE_PARAM)
# else
int yyparse (YYPARSE_PARAM)
  void *YYPARSE_PARAM;
# endif
#else /* ! YYPARSE_PARAM */
#if defined (__STDC__) || defined (__cplusplus)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{
  
  register int yystate;
  register int yyn;
  int yyresult;
  /* Number of tokens to shift before error messages enabled.  */
  int yyerrstatus;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;

  /* Three stacks and their tools:
     `yyss': related to states,
     `yyvs': related to semantic values,
     `yyls': related to locations.

     Refer to the stacks thru separate pointers, to allow yyoverflow
     to reallocate them elsewhere.  */

  /* The state stack.  */
  short	yyssa[YYINITDEPTH];
  short *yyss = yyssa;
  register short *yyssp;

  /* The semantic value stack.  */
  YYSTYPE yyvsa[YYINITDEPTH];
  YYSTYPE *yyvs = yyvsa;
  register YYSTYPE *yyvsp;



#define YYPOPSTACK   (yyvsp--, yyssp--)

  YYSIZE_T yystacksize = YYINITDEPTH;

  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;


  /* When reducing, the number of symbols on the RHS of the reduced
     rule.  */
  int yylen;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY;		/* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */

  yyssp = yyss;
  yyvsp = yyvs;

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed. so pushing a state here evens the stacks.
     */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack. Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	short *yyss1 = yyss;


	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow ("parser stack overflow",
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),

		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyoverflowlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyoverflowlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	short *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyoverflowlab;
	YYSTACK_RELOCATE (yyss);
	YYSTACK_RELOCATE (yyvs);

#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;


      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

/* Do appropriate processing given the current state.  */
/* Read a lookahead token if we need one and don't already have one.  */
/* yyresume: */

  /* First try to decide what to do without reference to lookahead token.  */

  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YYDSYMPRINTF ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yyn == 0 || yyn == YYTABLE_NINF)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  /* Shift the lookahead token.  */
  YYDPRINTF ((stderr, "Shifting token %s, ", yytname[yytoken]));

  /* Discard the token being shifted unless it is eof.  */
  if (yychar != YYEOF)
    yychar = YYEMPTY;

  *++yyvsp = yylval;


  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  yystate = yyn;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 7:
#line 77 "mcparse.y"
    {
	    cur_node = mc_add_node ();
	    cur_node->user_text = yyvsp[0].ustr;
	  }
    break;

  case 8:
#line 81 "mcparse.y"
    { mc_fatal ("syntax error"); }
    break;

  case 10:
#line 86 "mcparse.y"
    { mc_fatal ("missing ')' in SeverityNames"); }
    break;

  case 11:
#line 87 "mcparse.y"
    { mc_fatal ("missing '(' in SeverityNames"); }
    break;

  case 12:
#line 88 "mcparse.y"
    { mc_fatal ("missing '=' for SeverityNames"); }
    break;

  case 14:
#line 90 "mcparse.y"
    { mc_fatal ("missing ')' in LanguageNames"); }
    break;

  case 15:
#line 91 "mcparse.y"
    { mc_fatal ("missing '(' in LanguageNames"); }
    break;

  case 16:
#line 92 "mcparse.y"
    { mc_fatal ("missing '=' for LanguageNames"); }
    break;

  case 18:
#line 94 "mcparse.y"
    { mc_fatal ("missing ')' in FacilityNames"); }
    break;

  case 19:
#line 95 "mcparse.y"
    { mc_fatal ("missing '(' in FacilityNames"); }
    break;

  case 20:
#line 96 "mcparse.y"
    { mc_fatal ("missing '=' for FacilityNames"); }
    break;

  case 21:
#line 98 "mcparse.y"
    {
	    if (yyvsp[0].ival != 10 && yyvsp[0].ival != 16)
	      mc_fatal ("OutputBase allows 10 or 16 as value");
	    mcset_out_values_are_decimal = (yyvsp[0].ival == 10 ? 1 : 0);
	  }
    break;

  case 22:
#line 104 "mcparse.y"
    {
	    mcset_msg_id_typedef = yyvsp[0].ustr;
	  }
    break;

  case 23:
#line 108 "mcparse.y"
    {
	    mc_fatal ("MessageIdTypedef expects an identifier");
	  }
    break;

  case 24:
#line 112 "mcparse.y"
    {
	    mc_fatal ("missing '=' for MessageIdTypedef");
	  }
    break;

  case 27:
#line 120 "mcparse.y"
    { mc_fatal ("severity ident missing"); }
    break;

  case 28:
#line 125 "mcparse.y"
    {
	    mc_add_keyword (yyvsp[-3].ustr, MCTOKEN, "severity", yyvsp[-1].ival, yyvsp[0].ustr);
	  }
    break;

  case 29:
#line 128 "mcparse.y"
    { mc_fatal ("severity number missing"); }
    break;

  case 30:
#line 129 "mcparse.y"
    { mc_fatal ("severity missing '='"); }
    break;

  case 33:
#line 135 "mcparse.y"
    { mc_fatal ("missing ident in FacilityNames"); }
    break;

  case 34:
#line 140 "mcparse.y"
    {
	    mc_add_keyword (yyvsp[-3].ustr, MCTOKEN, "facility", yyvsp[-1].ival, yyvsp[0].ustr);
	  }
    break;

  case 35:
#line 143 "mcparse.y"
    { mc_fatal ("facility number missing"); }
    break;

  case 36:
#line 144 "mcparse.y"
    { mc_fatal ("facility missing '='"); }
    break;

  case 39:
#line 150 "mcparse.y"
    { mc_fatal ("missing ident in LanguageNames"); }
    break;

  case 40:
#line 155 "mcparse.y"
    {
	    mc_add_keyword (yyvsp[-5].ustr, MCTOKEN, "language", yyvsp[-3].ival, yyvsp[0].ustr);
	  }
    break;

  case 41:
#line 158 "mcparse.y"
    { mc_fatal ("missing filename in LanguageNames"); }
    break;

  case 42:
#line 159 "mcparse.y"
    { mc_fatal ("missing ':' in LanguageNames"); }
    break;

  case 43:
#line 160 "mcparse.y"
    { mc_fatal ("missing language code in LanguageNames"); }
    break;

  case 44:
#line 161 "mcparse.y"
    { mc_fatal ("missing '=' for LanguageNames"); }
    break;

  case 45:
#line 166 "mcparse.y"
    {
	    yyval.ustr = NULL;
	  }
    break;

  case 46:
#line 170 "mcparse.y"
    {
	    yyval.ustr = yyvsp[0].ustr;
	  }
    break;

  case 47:
#line 173 "mcparse.y"
    { mc_fatal ("illegal token in identifier"); yyval.ustr = NULL; }
    break;

  case 48:
#line 178 "mcparse.y"
    {
	    cur_node = mc_add_node ();
	    cur_node->symbol = mc_last_symbol;
	    cur_node->facility = mc_cur_facility;
	    cur_node->severity = mc_cur_severity;
	    cur_node->id = (yyvsp[-1].ival & 0xffffUL);
	    cur_node->vid = (yyvsp[-1].ival & 0xffffUL) | mc_sefa_val;
	    mc_last_id = yyvsp[-1].ival;
	  }
    break;

  case 50:
#line 190 "mcparse.y"
    { yyval.ival = yyvsp[0].ival; }
    break;

  case 51:
#line 191 "mcparse.y"
    { mc_fatal ("missing number in MessageId"); yyval.ival = 0; }
    break;

  case 52:
#line 192 "mcparse.y"
    { mc_fatal ("missing '=' for MessageId"); yyval.ival = 0; }
    break;

  case 53:
#line 196 "mcparse.y"
    {
	    yyval.ival = ++mc_last_id;
	  }
    break;

  case 54:
#line 200 "mcparse.y"
    {
	    yyval.ival = yyvsp[0].ival;
	  }
    break;

  case 55:
#line 204 "mcparse.y"
    {
	    yyval.ival = mc_last_id + yyvsp[0].ival;
	  }
    break;

  case 56:
#line 207 "mcparse.y"
    { mc_fatal ("missing number after MessageId '+'"); }
    break;

  case 57:
#line 212 "mcparse.y"
    {
	    yyval.ival = 0;
	    mc_sefa_val = (mcset_custom_bit ? 1 : 0) << 29;
	    mc_last_symbol = NULL;
	    mc_cur_severity = NULL;
	    mc_cur_facility = NULL;
	  }
    break;

  case 58:
#line 220 "mcparse.y"
    {
	    if (yyvsp[-1].ival & 1)
	      mc_warn (_("duplicate definition of Severity"));
	    yyval.ival = yyvsp[-1].ival | 1;
	  }
    break;

  case 59:
#line 226 "mcparse.y"
    {
	    if (yyvsp[-1].ival & 2)
	      mc_warn (_("duplicate definition of Facility"));
	    yyval.ival = yyvsp[-1].ival | 2;
	  }
    break;

  case 60:
#line 232 "mcparse.y"
    {
	    if (yyvsp[-1].ival & 4)
	      mc_warn (_("duplicate definition of SymbolicName"));
	    yyval.ival = yyvsp[-1].ival | 4;
	  }
    break;

  case 61:
#line 240 "mcparse.y"
    {
	    mc_sefa_val &= ~ (0x3UL << 30);
	    mc_sefa_val |= ((yyvsp[0].tok->nval & 0x3UL) << 30);
	    mc_cur_severity = yyvsp[0].tok;
	  }
    break;

  case 62:
#line 248 "mcparse.y"
    {
	    mc_sefa_val &= ~ (0xfffUL << 16);
	    mc_sefa_val |= ((yyvsp[0].tok->nval & 0xfffUL) << 16);
	    mc_cur_facility = yyvsp[0].tok;
	  }
    break;

  case 63:
#line 256 "mcparse.y"
    {
	  mc_last_symbol = yyvsp[0].ustr;
	}
    break;

  case 66:
#line 268 "mcparse.y"
    {
	    mc_node_lang *h;
	    h = mc_add_node_lang (cur_node, yyvsp[-3].tok, cur_node->vid);
	    h->message = yyvsp[-1].ustr;
	    if (mcset_max_message_length != 0 && unichar_len (h->message) > mcset_max_message_length)
	      mc_warn ("message length to long");
	  }
    break;

  case 67:
#line 278 "mcparse.y"
    {
	    yyval.ustr = yyvsp[0].ustr;
	  }
    break;

  case 68:
#line 282 "mcparse.y"
    {
	    unichar *h;
	    rc_uint_type l1,l2;
	    l1 = unichar_len (yyvsp[-1].ustr);
	    l2 = unichar_len (yyvsp[0].ustr);
	    h = (unichar *) res_alloc ((l1 + l2 + 1) * sizeof (unichar));
	    if (l1) memcpy (h, yyvsp[-1].ustr, l1 * sizeof (unichar));
	    if (l2) memcpy (&h[l1], yyvsp[0].ustr, l2 * sizeof (unichar));
	    h[l1 + l2] = 0;
	    yyval.ustr = h;
	  }
    break;

  case 69:
#line 293 "mcparse.y"
    { mc_fatal ("missing end of message text"); yyval.ustr = NULL; }
    break;

  case 70:
#line 294 "mcparse.y"
    { mc_fatal ("missing end of message text"); yyval.ustr = yyvsp[-1].ustr; }
    break;

  case 71:
#line 297 "mcparse.y"
    { yyval.ustr = yyvsp[0].ustr; }
    break;

  case 72:
#line 299 "mcparse.y"
    {
	    unichar *h;
	    rc_uint_type l1,l2;
	    l1 = unichar_len (yyvsp[-1].ustr);
	    l2 = unichar_len (yyvsp[0].ustr);
	    h = (unichar *) res_alloc ((l1 + l2 + 1) * sizeof (unichar));
	    if (l1) memcpy (h, yyvsp[-1].ustr, l1 * sizeof (unichar));
	    if (l2) memcpy (&h[l1], yyvsp[0].ustr, l2 * sizeof (unichar));
	    h[l1 + l2] = 0;
	    yyval.ustr = h;
	  }
    break;

  case 73:
#line 313 "mcparse.y"
    {
	    yyval.tok = yyvsp[-1].tok;
	  }
    break;

  case 74:
#line 317 "mcparse.y"
    {
	    yyval.tok = NULL;
	    mc_fatal (_("undeclared language identifier"));
	  }
    break;

  case 75:
#line 322 "mcparse.y"
    {
	    yyval.tok = NULL;
	    mc_fatal ("missing newline after Language");
	  }
    break;

  case 76:
#line 327 "mcparse.y"
    {
	    yyval.tok = NULL;
	    mc_fatal ("missing ident for Language");
	  }
    break;

  case 77:
#line 332 "mcparse.y"
    {
	    yyval.tok = NULL;
	    mc_fatal ("missing '=' for Language");
	  }
    break;

  case 78:
#line 338 "mcparse.y"
    { yyval.ustr = yyvsp[0].ustr; }
    break;

  case 79:
#line 339 "mcparse.y"
    { yyval.ustr = yyvsp[0].tok->usz; }
    break;

  case 80:
#line 343 "mcparse.y"
    { mclex_want_nl = 1; }
    break;

  case 81:
#line 347 "mcparse.y"
    { mclex_want_line = 1; }
    break;

  case 82:
#line 351 "mcparse.y"
    { mclex_want_filename = 1; }
    break;


    }

/* Line 1000 of yacc.c.  */
#line 1607 "mcparse.c"

  yyvsp -= yylen;
  yyssp -= yylen;


  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;


  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if YYERROR_VERBOSE
      yyn = yypact[yystate];

      if (YYPACT_NINF < yyn && yyn < YYLAST)
	{
	  YYSIZE_T yysize = 0;
	  int yytype = YYTRANSLATE (yychar);
	  const char* yyprefix;
	  char *yymsg;
	  int yyx;

	  /* Start YYX at -YYN if negative to avoid negative indexes in
	     YYCHECK.  */
	  int yyxbegin = yyn < 0 ? -yyn : 0;

	  /* Stay within bounds of both yycheck and yytname.  */
	  int yychecklim = YYLAST - yyn;
	  int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
	  int yycount = 0;

	  yyprefix = ", expecting ";
	  for (yyx = yyxbegin; yyx < yyxend; ++yyx)
	    if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	      {
		yysize += yystrlen (yyprefix) + yystrlen (yytname [yyx]);
		yycount += 1;
		if (yycount == 5)
		  {
		    yysize = 0;
		    break;
		  }
	      }
	  yysize += (sizeof ("syntax error, unexpected ")
		     + yystrlen (yytname[yytype]));
	  yymsg = (char *) YYSTACK_ALLOC (yysize);
	  if (yymsg != 0)
	    {
	      char *yyp = yystpcpy (yymsg, "syntax error, unexpected ");
	      yyp = yystpcpy (yyp, yytname[yytype]);

	      if (yycount < 5)
		{
		  yyprefix = ", expecting ";
		  for (yyx = yyxbegin; yyx < yyxend; ++yyx)
		    if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
		      {
			yyp = yystpcpy (yyp, yyprefix);
			yyp = yystpcpy (yyp, yytname[yyx]);
			yyprefix = " or ";
		      }
		}
	      yyerror (yymsg);
	      YYSTACK_FREE (yymsg);
	    }
	  else
	    yyerror ("syntax error; also virtual memory exhausted");
	}
      else
#endif /* YYERROR_VERBOSE */
	yyerror ("syntax error");
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* If at end of input, pop the error token,
	     then the rest of the stack, then return failure.  */
	  if (yychar == YYEOF)
	     for (;;)
	       {
		 YYPOPSTACK;
		 if (yyssp == yyss)
		   YYABORT;
		 YYDSYMPRINTF ("Error: popping", yystos[*yyssp], yyvsp, yylsp);
		 yydestruct (yystos[*yyssp], yyvsp);
	       }
        }
      else
	{
	  YYDSYMPRINTF ("Error: discarding", yytoken, &yylval, &yylloc);
	  yydestruct (yytoken, &yylval);
	  yychar = YYEMPTY;

	}
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

#ifdef __GNUC__
  /* Pacify GCC when the user code never invokes YYERROR and the label
     yyerrorlab therefore never appears in user code.  */
  if (0)
     goto yyerrorlab;
#endif

  yyvsp -= yylen;
  yyssp -= yylen;
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (yyn != YYPACT_NINF)
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;

      YYDSYMPRINTF ("Error: popping", yystos[*yyssp], yyvsp, yylsp);
      yydestruct (yystos[yystate], yyvsp);
      YYPOPSTACK;
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  YYDPRINTF ((stderr, "Shifting error token, "));

  *++yyvsp = yylval;


  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#ifndef yyoverflow
/*----------------------------------------------.
| yyoverflowlab -- parser overflow comes here.  |
`----------------------------------------------*/
yyoverflowlab:
  yyerror ("parser stack overflow");
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
  return yyresult;
}


#line 354 "mcparse.y"


/* Something else.  */


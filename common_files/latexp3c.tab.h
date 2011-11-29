
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     BACKSL = 258,
     LBEGIN = 259,
     LCURLYB = 260,
     DOCUMENT = 261,
     RCURLYB = 262,
     END = 263,
     WORD = 264,
     WS = 265,
     SPECCHAR = 266,
     CENTER = 267,
     VERBATIM = 268,
     SINGLE = 269,
     ITEMIZE = 270,
     ENUMERATE = 271,
     TABULAR = 272,
     TABLE = 273,
     LSQRB = 274,
     RSQRB = 275,
     H = 276,
     T = 277,
     B = 278,
     COLS = 279,
     CAPTION = 280,
     LABEL = 281,
     DBLBS = 282,
     ITEM = 283,
     SECTION = 284,
     SUBSEC = 285,
     TABOCON = 286,
     RENEW = 287,
     BASELINES = 288,
     PAGENUM = 289,
     INTEGER = 290,
     ARABIC1 = 291,
     LROMAN1 = 292,
     CROMAN1 = 293,
     LALPH1 = 294,
     CALPH1 = 295,
     VSPACE = 296,
     HSPACE = 297,
     RM = 298,
     IT = 299,
     NOINDENT = 300,
     REF = 301,
     ARABIC2 = 302,
     LROMAN2 = 303,
     CROMAN2 = 304,
     LALPH2 = 305,
     CALPH2 = 306,
     NEWLINE = 307
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 19 "latexp3c.y"

      char   trans[BUF_SIZE+1];
      int    val;
   


/* Line 1676 of yacc.c  */
#line 111 "latexp3c.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;



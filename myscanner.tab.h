/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

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

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_MYSCANNER_TAB_H_INCLUDED
# define YY_YY_MYSCANNER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    COLON = 258,                   /* COLON  */
    COMMA = 259,                   /* COMMA  */
    OBRACKETS = 260,               /* OBRACKETS  */
    OBRACES = 261,                 /* OBRACES  */
    CBRACKETS = 262,               /* CBRACKETS  */
    CBRACES = 263,                 /* CBRACES  */
    DOT = 264,                     /* DOT  */
    RESULTS = 265,                 /* RESULTS  */
    AMOUNT = 266,                  /* AMOUNT  */
    NORMAL = 267,                  /* NORMAL  */
    DESCENDING_SHORT = 268,        /* DESCENDING_SHORT  */
    ASCENDING_SHORT = 269,         /* ASCENDING_SHORT  */
    NATIVE = 270,                  /* NATIVE  */
    FLOAT = 271,                   /* FLOAT  */
    INT_ARRAY = 272,               /* INT_ARRAY  */
    JSON_ARRAY = 273,              /* JSON_ARRAY  */
    LAST = 274,                    /* LAST  */
    GAME_ID = 275,                 /* GAME_ID  */
    DRAW_ID = 276,                 /* DRAW_ID  */
    DRAW_TIME = 277,               /* DRAW_TIME  */
    STATUS = 278,                  /* STATUS  */
    DRAW_BREAK = 279,              /* DRAW_BREAK  */
    VISUAL_DRAW = 280,             /* VISUAL_DRAW  */
    PRICE_POINTS = 281,            /* PRICE_POINTS  */
    WINNING_NUMBERS = 282,         /* WINNING_NUMBERS  */
    PRIZE_CATEGORIES = 283,        /* PRIZE_CATEGORIES  */
    WAGER_STATISTICS = 284,        /* WAGER_STATISTICS  */
    LIST = 285,                    /* LIST  */
    BONUS = 286,                   /* BONUS  */
    ACTIVE = 287,                  /* ACTIVE  */
    ID = 288,                      /* ID  */
    DIVIDENT = 289,                /* DIVIDENT  */
    WINNERS = 290,                 /* WINNERS  */
    DISTRIBUTED = 291,             /* DISTRIBUTED  */
    JACKPOT = 292,                 /* JACKPOT  */
    FIXED = 293,                   /* FIXED  */
    CATEGORY_TYPE = 294,           /* CATEGORY_TYPE  */
    GAME_TYPE = 295,               /* GAME_TYPE  */
    MINIMUM_DISTRIBUTED = 296,     /* MINIMUM_DISTRIBUTED  */
    COLUMNS = 297,                 /* COLUMNS  */
    WAGERS = 298,                  /* WAGERS  */
    ADD_ON = 299,                  /* ADD_ON  */
    CONTENT = 300,                 /* CONTENT  */
    TOTAL_PAGES = 301,             /* TOTAL_PAGES  */
    TOTAL_ELEMENTS = 302,          /* TOTAL_ELEMENTS  */
    NUMBER_OF_ELEMENTS = 303,      /* NUMBER_OF_ELEMENTS  */
    SORT = 304,                    /* SORT  */
    DIRECTION = 305,               /* DIRECTION  */
    PROPERTY = 306,                /* PROPERTY  */
    IGNORE_CASE = 307,             /* IGNORE_CASE  */
    NULL_HANDLING = 308,           /* NULL_HANDLING  */
    DESCENDING = 309,              /* DESCENDING  */
    ASCENDING = 310,               /* ASCENDING  */
    FIRST = 311,                   /* FIRST  */
    SIZE = 312,                    /* SIZE  */
    NUMBER = 313,                  /* NUMBER  */
    BOOLEAN = 314,                 /* BOOLEAN  */
    INT = 315,                     /* INT  */
    STRING = 316                   /* STRING  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_MYSCANNER_TAB_H_INCLUDED  */

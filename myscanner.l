%option yylineno

%{
#include "myscanner.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

%}

boolean		("true"|"false")
string		[\"]([\. \t\ra-zA-Z0-9]|(\\\"))+?[\"]
json_array  \[\]
s_int_f     ({string}|-?{int}|-?{float})
int			[1-9][0-9]*|0
float		{int}\.{int}
ws 			[ \t\r]
newline     \n

%%

{int}						{printf("%s", yytext); return INT;}
{json_array}                {printf("%s", yytext); return JSON_ARRAY;}
\:							{printf("%s", yytext); return COLON;}
\,							{printf("%s", yytext); return COMMA;}
\.							{printf("%s", yytext); return DOT;}
\{							{printf("%s", yytext); return OBRACKETS;}
\}							{printf("%s", yytext); return CBRACKETS;}
\[							{printf("%s", yytext); return OBRACES;}
\]							{printf("%s", yytext); return CBRACES;}
\"last\"					{printf("%s", yytext); return LAST;}
\"active\"					{printf("%s", yytext); return ACTIVE;}
\"gameId\"					{printf("%s", yytext); return GAME_ID;}
\"drawId\"					{printf("%s", yytext); return DRAW_ID;}
\"drawTime\"				{printf("%s", yytext); return DRAW_TIME;}
\"status\"					{printf("%s", yytext); return STATUS;}
\"results\"					{printf("%s", yytext); return RESULTS;}
\"drawBreak\"				{printf("%s", yytext); return DRAW_BREAK;}
\"visualDraw\"				{printf("%s", yytext); return VISUAL_DRAW;}
\"pricePoints\"				{printf("%s", yytext); return PRICE_POINTS;}
\"amount\"					{printf("%s", yytext); return AMOUNT;}
\"winningNumbers\"			{printf("%s", yytext); return WINNING_NUMBERS;}
\"list\"					{printf("%s", yytext); return LIST;}
\"bonus\"					{printf("%s", yytext); return BONUS;}
\"prizeCategories\"			{printf("%s", yytext); return PRIZE_CATEGORIES;}
\"id\"						{printf("%s", yytext); return ID;}
\"divident\"				{printf("%s", yytext); return DIVIDENT;}
\"winners\"					{printf("%s", yytext); return WINNERS;}
\"distributed\"				{printf("%s", yytext); return DISTRIBUTED;}
\"jackpot\" 				{printf("%s", yytext); return JACKPOT;}
\"fixed\"					{printf("%s", yytext); return FIXED;}
\"categoryType\"			{printf("%s", yytext); return CATEGORY_TYPE;}
\"gameType\"				{printf("%s", yytext); return GAME_TYPE;}
\"Normal\"					{printf("%s", yytext); return NORMAL;}
\"minimumDistributed\"		{printf("%s", yytext); return MINIMUM_DISTRIBUTED;}
\"wagerStatistics\"			{printf("%s", yytext); return WAGER_STATISTICS;}
\"columns\" 				{printf("%s", yytext); return COLUMNS;}
\"wagers\" 					{printf("%s", yytext); return WAGERS;}
\"addOn\" 					{printf("%s", yytext); return ADD_ON;}
\"content\"					{printf("%s", yytext); return CONTENT;}
\"totalPages\"				{printf("%s", yytext); return TOTAL_PAGES;}
\"totalElements\"			{printf("%s", yytext); return TOTAL_ELEMENTS;}
\"numberOfElements\" 		{printf("%s", yytext); return NUMBER_OF_ELEMENTS;}
\"sort\"					{printf("%s", yytext); return SORT;}
\"direction\"				{printf("%s", yytext); return DIRECTION;}
\"DESC\"					{printf("%s", yytext); return DESCENDING_SHORT;}
\"ASC\"						{printf("%s", yytext); return ASCENDING_SHORT;}
\"ignoreCase\"              {printf("%s", yytext); return IGNORE_CASE;}
\"property\"				{printf("%s", yytext); return PROPERTY;}
\"nullHandling\"			{printf("%s", yytext); return NULL_HANDLING;}
\"NATIVE\"					{printf("%s", yytext); return NATIVE;}
\"descending\" 				{printf("%s", yytext); return DESCENDING;}
\"ascending\" 				{printf("%s", yytext); return ASCENDING;}
\"first\" 					{printf("%s", yytext); return FIRST;}
\"size\" 					{printf("%s", yytext); return SIZE;}
\"number\" 					{printf("%s", yytext); return NUMBER;}
{boolean} 					{printf("%s", yytext); return BOOLEAN;}
{string}    				{printf("%s", yytext); return STRING;}
{ws}						printf("%s", yytext);
{float}						{printf("%s", yytext); return FLOAT;}
{newline}					{printf("%s", yytext); yylineno++;}
.                           printf("\nUnrecognized character. %s\n", yytext);

%%

int yywrap(void)
{
	return 1;
}

void yyerror(char *s)
{
    printf("\nError in line %d, input: %s, near %s\n", yylineno, s, yytext);
}

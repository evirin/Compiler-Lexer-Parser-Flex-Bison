%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
void yyerror(char *s);
extern FILE *yyin;
extern FILE *yyout;
extern int yylineno;
// function variables
int error_line = 0; //Γραμμή που βρίσκεται το error
int indent_status = 0;
int counter;
int errors = 0;
int length = 0;
int correctIDs[] = {1100, 1110, 2100, 2101, 5103, 5104, 5106};
int number_of_games = 7;
int found = 0;

%}
%error-verbose

%token COLON
%token COMMA
%token OBRACKETS
%token OBRACES
%token CBRACKETS
%token CBRACES
%token DOT
%token RESULTS
%token AMOUNT
%token NORMAL
%token DESCENDING_SHORT
%token ASCENDING_SHORT
%token NATIVE
%token FLOAT
%token INT_ARRAY
%token JSON_ARRAY
%token LAST
%token GAME_ID
%token DRAW_ID
%token DRAW_TIME
%token STATUS
%token DRAW_BREAK
%token VISUAL_DRAW
%token PRICE_POINTS
%token WINNING_NUMBERS
%token PRIZE_CATEGORIES
%token WAGER_STATISTICS
%token LIST
%token BONUS
%token ACTIVE
%token ID
%token DIVIDENT
%token WINNERS
%token DISTRIBUTED
%token JACKPOT
%token FIXED
%token CATEGORY_TYPE
%token GAME_TYPE
%token MINIMUM_DISTRIBUTED
%token COLUMNS
%token WAGERS
%token ADD_ON
%token CONTENT
%token TOTAL_PAGES
%token TOTAL_ELEMENTS
%token NUMBER_OF_ELEMENTS
%token SORT
%token DIRECTION
%token PROPERTY
%token IGNORE_CASE
%token NULL_HANDLING
%token DESCENDING
%token ASCENDING
%token FIRST
%token SIZE
%token NUMBER
%token BOOLEAN
%token INT
%token STRING

%%

jsonfile :			    OBRACKETS rSTART CBRACKETS;

rSTART :			    rLAST COMMA rACTIVE | rRANGE ;

rRANGE :                rCONTENT COMMA rTOTAL_PAGES COMMA rTOTAL_ELEMENTS COMMA rLAST COMMA rNUMBER_OF_ELEMENTS COMMA rSORT COMMA rFIRST COMMA rSIZE COMMA rNUMBER;

rLAST :			        LAST COLON rBODY_LAST;

rACTIVE :		        ACTIVE COLON rBODY_ACTIVE;

rBODY_LAST :	        OBRACKETS rGAME_ID COMMA rDRAW_ID COMMA rDRAW_TIME COMMA rSTATUS COMMA rDRAW_BREAK COMMA rVISUAL_DRAW COMMA rPRICE_POINTS COMMA rWINNING_NUMBERS COMMA rPRIZECATEGORIES COMMA rWAGER_STATISTICS CBRACKETS;

rBODY_ACTIVE :	        OBRACKETS rGAME_ID COMMA rDRAW_ID COMMA rDRAW_TIME COMMA rSTATUS COMMA rDRAW_BREAK COMMA rVISUAL_DRAW COMMA rPRICE_POINTS COMMA rPRIZECATEGORIES COMMA rWAGER_STATISTICS CBRACKETS;

rGAME_ID :  		    GAME_ID COLON INT;

rDRAW_ID :			    DRAW_ID COLON INT;

rDRAW_TIME :	        DRAW_TIME COLON INT;

rSTATUS :    	        STATUS COLON rSTATUS_EXT;

rSTATUS_EXT :           RESULTS | ACTIVE;

rDRAW_BREAK :           DRAW_BREAK COLON INT;

rVISUAL_DRAW :          VISUAL_DRAW COLON INT;

rPRICE_POINTS :         PRICE_POINTS COLON OBRACKETS rAMOUNT CBRACKETS;

rAMOUNT :               AMOUNT COLON FLOAT;

rPRIZECATEGORIES :      PRIZE_CATEGORIES COLON OBRACES rPRIZECATEGORIES_EXT CBRACES;

rPRIZECATEGORIES_EXT :  rBODY_PC | rPRIZECATEGORIES_EXT COMMA rPRIZECATEGORIES_EXT

rBODY_PC :              OBRACKETS rID COMMA rDIVIDENT COMMA rWINNERS COMMA rDISTRIBUTED COMMA rJACKPOT COMMA rFIXED COMMA rCATEGORY_TYPE COMMA rGAME_TYPE rMINIMUM_DISTRIBUTED CBRACKETS;

rWINNING_NUMBERS :      WINNING_NUMBERS COLON rBODY_WN;

rBODY_WN :		        OBRACKETS rLIST COMMA rBONUS CBRACKETS;

rINT_ARRAY :            OBRACES rINT_ARRAY_EXT CBRACES;

rINT_ARRAY_EXT :        INT | rINT_ARRAY_EXT COMMA INT;

rLIST:                  LIST COLON rINT_ARRAY;

rBONUS :                BONUS COLON rINT_ARRAY;

rID :                   ID COLON INT;

rDIVIDENT :             DIVIDENT COLON FLOAT;

rWINNERS :              WINNERS COLON INT;

rDISTRIBUTED :          DISTRIBUTED COLON FLOAT;

rJACKPOT : 	            JACKPOT COLON FLOAT;

rFIXED :   	            FIXED COLON FLOAT;

rCATEGORY_TYPE :        CATEGORY_TYPE COLON INT;

rGAME_TYPE :            GAME_TYPE COLON NORMAL;

rMINIMUM_DISTRIBUTED :  COMMA MINIMUM_DISTRIBUTED COLON FLOAT | %empty;

rWAGER_STATISTICS :     WAGER_STATISTICS rBODY_WS;

rBODY_WS :		        COLON OBRACKETS rCOLUMNS COMMA rWAGERS COMMA rADD_ON CBRACKETS;

rCOLUMNS :              COLUMNS COLON INT;

rWAGERS :               WAGERS COLON INT;

rADD_ON :               ADD_ON COLON JSON_ARRAY;

rCONTENT :              CONTENT COLON OBRACES rBODY_CONTENT CBRACES;

rBODY_CONTENT :         rBODY_LAST | rBODY_CONTENT COMMA rBODY_CONTENT;

rTOTAL_PAGES :          TOTAL_PAGES COLON INT;

rTOTAL_ELEMENTS :       TOTAL_ELEMENTS COLON INT;

rLAST :                 LAST COLON BOOLEAN;

rNUMBER_OF_ELEMENTS :   NUMBER_OF_ELEMENTS COLON INT;

rSORT :                 SORT COLON rBODY_S;

rBODY_S :               OBRACES OBRACKETS rDIRECTION COMMA rPROPERTY COMMA rIGNORE_CASE COMMA rNULL_HANDLING COMMA rDESCENDING COMMA rASCENDING CBRACKETS CBRACES;

rDIRECTION :            DIRECTION COLON rDIR;

rDIR :                  DESCENDING_SHORT | ASCENDING_SHORT;

rPROPERTY :             PROPERTY COLON STRING;

rIGNORE_CASE :          IGNORE_CASE COLON BOOLEAN;

rNULL_HANDLING :        NULL_HANDLING COLON NATIVE;

rDESCENDING :           DESCENDING COLON BOOLEAN;

rASCENDING :            ASCENDING COLON BOOLEAN;

rFIRST :                FIRST COLON BOOLEAN;

rSIZE :                 SIZE COLON INT;

rNUMBER :               NUMBER COLON INT;

%%


void check_gameID(int gID){
    /*Check if the gameID is one of the available ones*/
    for(counter = 0; counter<number_of_games; counter++){
        if(gID == correctIDs[counter])
            found = 1;
    }
    if(found = 0){
        errors++;
        error_line = yylineno;
        printf("Error in line %d: the gameID is not available!", &error_line);
        exit(EXIT_FAILURE);
    }
}

void check_prizeCategories(char* pC){
    /*Check if the number of objects within element winningNumbers is 8*/
    // validate zero in paronomasti??
    length = sizeof(pC) / sizeof(pC[0]);
    if(length != 8){
        errors++;
        error_line = yylineno;
        printf("Error in line %d: the element prizeCategories does not have exactly 8 objects!", &error_line);
        exit(EXIT_FAILURE);
    }
}

//To be checked: can we access the list of winningNumbers just by passing a pointer

void check_winningNumbers(char* wN){
    /*Check if the number of objects within element winningNumbers is 5*/
    // pos tha vroume to megethos tou pinaka?
    length = sizeof(wN) / sizeof(wN[0]);
    if(length != 5){
        errors++;
        error_line = yylineno;
        printf("Error in line %d: the element winningNumbers does not have exactly 5 objects!", &error_line);
        exit(EXIT_FAILURE);
    }

    /*Check if the objects within element winningNumbers are in the frame 1-45*/
    for(counter = 0; counter<5; counter++){
        if(wN[counter]<1 || wN[counter]>45){
            errors++;
            error_line = yylineno;
            printf("Error in line %d: the element winningNumbers include objects out of the frame 1-45!", &error_line);
            exit(EXIT_FAILURE);
        }
    }
}

int main (int argc, char **argv) {
	FILE *jfile = fopen(argv[1], "r");
	if (jfile == NULL)
	    {
            printf( "Failed to read input file." ) ;
            exit(EXIT_FAILURE);
        }
	else {
	    printf( "Reading input file...\n" ) ;
	    yyin = jfile;
	    int token;
	    for(;;){
	        token = yyparse();
	        if (token == 0){
                if(errors==0) {
          	        printf("\nNo errors identified. Input file is acceptable!\n");
          	        break;
	            } else {
	                printf("\nErrors encountered. Error count: %d\n", errors);
	                break;
	            }
	        } else {
	            break;
	        }
	    }
	    fclose(jfile);
	    printf( "File closed successfully.\n");
	    return 0;
	}
}




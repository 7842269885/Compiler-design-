%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int macro_count = 0;
int header_count = 0;
%}

%%
"#define" { macro_count++; }
"#include" { header_count++; }

.|\n { ; } /* Ignore all other characters */

%%

int main()
{
    yyin = stdin; // Set input to standard input

    yylex();

    printf("Number of Macros Defined: %d\n", macro_count);
    printf("Number of Header Files Included: %d\n", header_count);

    return 0;
}

int yywrap()
{
    return 1; // Indicate end of input
}

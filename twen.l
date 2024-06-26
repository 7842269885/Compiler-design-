%{
#include <stdio.h>
#include <stdlib.h>
%}

%%

"<"[^>]*">" { printf("HTML Tag: %s\n", yytext); }

.|\n { ; } /* Ignore all other characters */

%%

int main()
{
    yylex();
    return 0;
}

int yywrap()
{
    return 1; // Indicate end of input
}

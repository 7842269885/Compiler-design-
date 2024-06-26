%{
#include <stdio.h>
#include <string.h>
%}

%%

[a-zA-Z_][a-zA-Z0-9_]*   { fprintf(yyout, "Identifier: %s\n", yytext); }
[0-9]+                    { fprintf(yyout, "Integer: %s\n", yytext); }
\".*\"                    { fprintf(yyout, "String: %s\n", yytext); }
[ \t\n]                   { /* Ignore whitespace */ }
.                         { fprintf(yyout, "Operator/Symbol: %s\n", yytext); }

%%

int main() {
    yyin = fopen("input.txt", "r");
    yyout = fopen("output.txt", "w");

    if (!yyin || !yyout) {
        perror("Error");
        return 1;
    }

    yylex();

    fclose(yyin);
    fclose(yyout);

    return 0;
}

int yywrap() {
    return 1;  // Indicate no more files to process
}

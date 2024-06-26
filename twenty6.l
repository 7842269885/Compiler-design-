%{
#include <stdio.h>
#include <string.h>
#define MAX_IDENTIFIER_LENGTH 50
int line_count = 1;
%}

%option noyywrap

identifier [a-zA-Z_][a-zA-Z0-9_]*
constant   [0-9]+
operator   [+\-*/%=]

%%

{identifier}   { printf("Identifier: %.*s\n", MAX_IDENTIFIER_LENGTH, yytext); }
{constant}     { printf("Constant: %s\n", yytext); }
{operator}     { printf("Operator: %s\n", yytext); }
[\t ]+         ; // Ignore spaces and tabs
"\n"           { line_count++; } // Count lines
"//"(.)*       ; // Ignore single line comments
"/*"([^*]|\*+[^*/])*\*+"/"   ; // Ignore multi-line comments

.              ; // Ignore other characters

%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1; // Indicate no more files to process
}

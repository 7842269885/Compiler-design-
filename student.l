%{
#include <stdio.h>
%}

DIGIT [0-9]
MONTH (0[1-9]|1[0-2])
DAY (0[1-9]|[1-2][0-9]|3[0-1])
YEAR (19|20)[0-9]{2}

%%

{MONTH}"/"{DAY}"/"{YEAR}   { printf("Valid DOB\n"); }
{MONTH}"-"{DAY}"-"{YEAR}   { printf("Valid DOB\n"); }
{DAY}" "{MONTH}" "{YEAR}    { printf("Valid DOB\n"); }
{YEAR}"/"{MONTH}"/"{DAY}   { printf("Valid DOB\n"); }
{YEAR}"-"{MONTH}"-"{DAY}   { printf("Valid DOB\n"); }
{YEAR}" "{MONTH}" "{DAY}    { printf("Valid DOB\n"); }

. { printf("Invalid DOB\n"); }

%%

int main()
{
    printf("Enter the Date of Birth (DOB): ");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}

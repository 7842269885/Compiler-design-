%{
#include <stdio.h>
#include <string.h>
%}

%%
.*abc.* { 
    char *ptr = yytext;
    char output[1000]; // Assuming maximum length of input string
    char *out_ptr = output;

    while (*ptr != '\0') {
        if (strncmp(ptr, "abc", 3) == 0) {
            *out_ptr++ = 'A';
            *out_ptr++ = 'B';
            *out_ptr++ = 'C';
            ptr += 3;
        } else {
            *out_ptr++ = *ptr++;
        }
    }
    *out_ptr = '\0';
    printf("%s\n", output);
}

.|\n { ; } // Ignore all other characters

%%

int main()
{
    printf("Enter the string: ");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}

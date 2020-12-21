%{
#include <stdio.h>
int words = 0, characters = 0, digits = 0, symbols = 0, size = 0;
%}

%%

[\t \n] words++;
[a-zA-Z] characters++;
[0-9] digits++;
. symbols++;
%%

int main(){
    yyin = fopen("text.txt", "r");
    yylex();
    size = characters + digits + symbols;

    printf("The number of words is: %d \n", words);
    printf("There are %d characters, %d digits and %d symbols \n", characters, digits, symbols);
    printf("The total size is: %d \n", size);
    fclose(yyin);
    return 0;

}

int yywrap(){
    return 1;
}

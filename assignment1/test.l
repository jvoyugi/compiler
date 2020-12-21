%{
#include <stdio.h>
int words = 0;
%}


%%
[\t \n] words++;


%%

int main(){
yyin = fopen("test.txt", "r");
yylex();

printf("\nThere are %d words", words);
return 0;
}

int yywrap(){
return 1;
}

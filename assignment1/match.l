%{
#include <stdio.h>
#include <string.h>

char match[] = "abc", replace_match[] = "ABC";

%}

%%
abc {fprintf(yyout, "%s", replace_match);}
.   {fprintf(yyout, "%s", yytext);}
%%


int main(){
 yyin = fopen("input.txt", "r");
 yyout = fopen("output.txt", "w");
 yylex();
fclose(yyin);
fclose(yyout);
 return 0;
}
int yywrap(){
return 1;
}

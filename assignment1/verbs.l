%{
#include <stdio.h>


%}

%%
[\t]+
is | 
am |
are |
was |
be |
being |
do |
does |
did |
will |
would |
should |
can |
could |
has |
have |
had |
go {printf("%s: is a verb\n", yytext);}
[a-zA-Z]+ {printf("%s: is not a verb\n", yytext);}
%%
int main(){

 yylex();


 return 0;
}
int yywrap(){
 return 1;
}

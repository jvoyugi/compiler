%{
#include <stdio.h>
void yyerror(char *);
int yylex(void);
%}

%token NUMBER
%left '+'
%%

E:NUMBER {$$ = $1;}
    | E '+' E {$$ = $1 + $3;};
    ;
%%

void yyerror(char *s) {
    printf("%s\n", s);
}

int main()
{
    printf("Please key in the expression:");
    yyparse();
    return 0;
}

int yywrap(){
    return 1;
}

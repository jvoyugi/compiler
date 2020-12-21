%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *);
#include "y.tab.h"
double currVal=0.0,num=0.0;
int operandToken=0,operatorToken=0;
%}

%%
[0-9]+?(\.[0-9]+?)?        {
                            printf("%g is an operand\n",atof(yytext));
                            yylval = atof(yytext);
                            return NUMBER;                          
                           }
[+-]                       {
                            printf("%s is an operator\n",yytext);
                            return *yytext;
                           }
[ \t]                      ;
[\n]                       {                        
                            printf("Answer = %g\n",currVal);
                            exit(0);
                           }
.                          {
                            yyerror("An error occured at");
                           }
%%

int getSign(char *yytext)
{
    int negatives=0;
    for (int i=0;i<strlen(yytext);i++)
    {
        if(yytext[i]=='-')
        {
            negatives+=1;
        }
    }
    return negatives%2==0?1:-1;
}

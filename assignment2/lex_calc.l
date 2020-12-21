%{
#include <stdio.h>
#include <stdlib.h>
#include "tokens.h"
#include "y.tab.h"
void yyerror(char *);
double currVal=0.0,num=0.0;
int operandToken=0,operatorToken=0;
%}

%%
[0-9]+?(\.[0-9]+?)?         {
                            printf("%g is an operand\n",atof(yytext));
                            return OPERAND;                          
                           }
[+-]+                      {
                            printf("%s is an operator\n",yytext);
                            return OPERATOR;
                           }
[ \t]                      ;
[\n]                       {                        
                            printf("Answer = %g\n",currVal);
                            exit(0);
                           }
.                          {
                            printf("An error occured at %s\n",yytext);
                            exit(1);
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


int main()
{
    printf("Please key in the expression:");
    yyparse();
    int firstToken = yylex();
    int op=1;
    if(firstToken == OPERATOR)
    { 
        op=getSign(yytext);
        operandToken=yylex();
        if(operandToken==OPERAND)
        { 
            num=atof(yytext);
        }
    }
    else if(firstToken == OPERAND)
    { 
        num=atof(yytext);
    }
    currVal+=num*op;
    operatorToken=yylex();
    while(operatorToken)
    {
        if(operatorToken==OPERATOR)
        { 
            op=getSign(yytext);
        }
        else
        {
            printf("error in reading operator\n");
            return 1;
        }
        operandToken=yylex();
        if(operandToken==OPERAND)
        { 
            num=atof(yytext);
            currVal+=num*op;
        }
        else
        {
            printf("error in reading operand\n");
            return 1;
        }
        operatorToken=yylex();
    }
    return 0;
}

int yywrap(){
    return 1;
}

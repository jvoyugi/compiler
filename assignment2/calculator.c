/*
   Recursive-descent integer arithmetic calculator
   according to the EBNF:

   <e> -> <t> {+ <t>}
   <t> -> <f> {* <f>}
   <f> -> ( <e> ) | Number

   Inputs a line of text from stdin.
   Outputs "Error" or the result.
*/

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>


char token;

int expr();
int term();
int factor();

void reportError(char expectedToken)
{
    printf("Error! Expected %c but got %c\n", expectedToken, token);
    exit(1);
}

void reportErrorInFactor()
{
    printf("Unexpected token. Got %c\n", token);
    exit(1);
}

void match(char expectedToken)
{
    if (token == expectedToken)
        token = getchar();
    else
        reportError(expectedToken);
}

int main()
{
    int result;
    printf("Key in expression to evaluate: ");
    token = getchar();
    result = expr();
    if (token == '\n')
        printf("Result = %d\n", result);
    else
        reportErrorInFactor();
    return 0;
}

int expr()
{
    int temp = term();
    while (token == '+')
        switch (token)
        {
        case '+':
            match('+');
            temp += term();
        }
    return temp;
}

int term()
{
    int temp = factor();
    while (token == '*')
    {
        match('*');
        temp *= factor();
    }
    return temp;
}

int factor()
{
    int temp;
    if (token == '(')
    {
        match('(');
        temp = expr();
        match(')');
    }
    else if (isdigit(token))
    {
        ungetc(token, stdin);
        scanf("%d", &temp);
        token = getchar();
    }
    else
        reportErrorInFactor();
    return temp;
}
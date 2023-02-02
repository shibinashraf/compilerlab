%{
#include<stdio.h>
%}
%%
[0/1]*01 {printf("is a valid string");}
[0/1]*10 {printf("is a invalid string");}
[0/1]*11 {printf("is a invalid string");}
[0/1]*00 {printf("is a invalid string");}
%%
int main(){
yylex();
}

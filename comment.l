%{
#include<stdio.h>
%}
%%
[a-z A-Z 0-9]*[/][/][a-z A-Z 0-9]* {printf("Single Comment line");}
[a-z A-Z 0-9]*[/][*][a-z A-Z 0-9]* {printf("Starting of a multiple Comment line");}
[a-z A-Z 0-9]*[*][/][a-z A-Z 0-9]* {printf("Ending of a multiple Comment line");}
%%
int main(void){
yylex();
}

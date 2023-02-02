%{
#include<stdio.h>
int vow = 0,con = 0; 
%}
%%
[\t\n]+ ;
[aeiouAEIOU]+ {vow++;}
[^aeiouAEIOU]+ {con++;}
%%
int main(void){
yyin = fopen("a.txt","r");
yylex();
printf("no. of vowels :%d\n", vow);
printf("no. of consonants :%d\n", con);
}

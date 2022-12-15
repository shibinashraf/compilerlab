%{
#include<stdio.h>
int c1 = 0, c2 = 0, lc = 0, sc = 0, tc = 0, ch = 0, sletter = 0, cletter = 0;  
%}
%%
[A-Z] {cletter++;}
[a-z] {sletter++;}
[0-9] {c1++;}
-[0-9] {c2++;}
\n {lc++;}
[ ] {sc++;}
\t {tc++;}
. {ch++;}
%%
int main(void){
yyin = fopen("a.txt","r");
yylex();
printf("Total Numbers :%d\n", c1 + c2);
printf("no. of small letters :%d\n", sletter);
printf("no. of capital letters :%d\n", cletter);
printf("no. of positive integers :%d\n", c1);
printf("no. of negative integers :%d\n", c2);
printf("no. of newlines :%d\n", lc);
printf("no. of spaces :%d\n", sc);
printf("no. of tabs :%d\n", tc);
printf("no. of dots :%d\n", ch);
}

%{
    #include<stdio.h>
    #include<string.h>
    #include<stdlib.h>
    #include<ctype.h>
    #include"lex.yy.c"
    void yyerror(const char *s);
    int yylex();
    int yywrap();
%}

%union { 
	struct var_name { 
		char name[100]; 
		struct node* nd;
	} nd_obj; 
} 

%start P
%token <nd_obj> EQ ADD SUB MUL DIV SLP SRP SEMI LT GT GE LE NEQ IF THEN ELSE WHILE DO NUMBER FLOAT_NUM ID
%type <nd_obj> P L S T E F 

%%

/* descriptions of expected inputs     corresponding actions (in C) */
P       : L                     {printf("%s",$$.name);}//{$$.nd=$1.nd;head=$$.nd;}
        | L P                   {$$.nd=mknode($1.nd,$2.nd,"P");head=$$.nd;}
;

L       : S                     {printf("%s",$$.name);}//{$$.nd=$1.nd;}
;

S       : ID '=' E               {printf("%s",$$.name);}//{add('V');$1.nd=mknode(NULL,NULL,$1.name);$$.nd=mknode($1.nd,$3.nd,"=");}
;

E       : E '+' T               {$$.nd=mknode($1.nd,$3.nd,"+");}
        | E '-' T               {$$.nd=mknode($1.nd,$3.nd,"-");}
        | T                      {printf("%s",$$.name);}//{$$.nd = $1.nd;}
;
T       : T '/' F               {$$.nd=mknode($1.nd,$3.nd,"/");}
        | T '*' F               {$$.nd=mknode($1.nd,$3.nd,"*");}
        | F                      {printf("%s",$$.name);}//{$$.nd = $1.nd;}
;
F		:'('E')'               {$$.nd = $2.nd;}
        | ID                     {printf("%s",$$.name);}//{add('V');$$.nd=mknode(NULL,NULL,$1.name);}
        | FLOAT_NUM              {printf("%s",$$.name);}//{add('C');$$.nd=mknode(NULL,NULL,$1.name);}
        | NUMBER                 {printf("%s",$$.name);}//{add('C');$$.nd=mknode(NULL,NULL,$1.name);}
;
%%                     /* C code */

int main() {
    yyparse();
}

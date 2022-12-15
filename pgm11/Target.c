#include<stdio.h>
#include<string.h>
void main() {
    char icode[10][30], str[20], opr[10];
    int i=0;
    printf("/n Entr the set of intermediate code terminated by exit ");
    do 
    {
        scanf("%s",icode[i]);
    }while(strcmp(icode[i++], "exit")!=0);
    printf("\n target code generation");
    printf("\n ****************");
    i=0;
    do{
        strcpy(str,icode[i]);
        switch(str[3])
        {
            case '+':
            strcpy(opr,"ADD");
            break;
            
            case '-':
            strcpy(opr,"SUB");
            break;
            
            case '*':
            strcpy(opr,"MUL");
            break;
            
            case '/':
            strcpy(opr,"DIV");
            break;
                    
        }
        printf("\n\t MOV %c , R%d",str[2],i);
        printf("\n\t%s%C, R%d",opr,str[4],i);
        printf("\n\t MOV R%d,%c", i,str[0] );
        
    }while(strcmp(icode[++i],"exit")!=0);
}

PILE SEGMENT STACK
DW 256 DUP(?)
Base:
PILE ENDS
DATA SEGMENT
N1 DW 5
N2 DW 3
N3 DW 3 DUP(?)
N4 DB ?
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE, DS:DATA, SS:PILE
main:
MOV AX,DATA ; Initialisation du segment de données
MOV DS,AX
MOV AX,PILE
MOV SS,AX ; Initialisation du segment de pile
MOV SP,Base ; Initialise la pile à vide
MOV AX,N1
CMP AX,N2
JE etiq
MOV N4,0
JMP fin
Etiq:
MOV N4,1
fin:
MOV AH,4CH ; Les 2 lignes nécessaires pour la fin du programme
INT 21H ;
CODE ENDS
END main
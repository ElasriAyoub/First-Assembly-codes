                                     STACK SEGMENT STACK
 DW 256 DUP(0)
base:
STACK ENDS
DATA SEGMENT
    message db ':',$


 ; ici on declare les variable
DATA ENDS
CODE SEGMENT
 ASSUME CS:CODE, DS:DATA, SS:STACK

 ; ici on declare les fonctions publiques

 ; ici on declare les fonctions externes


 ; ici on declare les fonctions locales
 ; on precise a l'aide d'un commantaire
 ; son nom, ses entrees et ses sorties

 ; Procedure: name
 ; Entree: ...
 ; Sortie: ...
debut:
 MOV AX, DATA
 MOV DS, AX
 MOV AX, STACK
 MOV SS, AX 
 MOV AX,0
 MOV BX,0
 MOV CX,0
MOV AX, 1102h
MOV BX, 1100H
MOV CX,AX
MOV WORD PTR[200H],BX
NOT BX
or  BX,AX
MOV [300H],BX
MOV AX,CX
MOV BX,[200H]
NOT AX
or bx,aX
and [300H],bx
not bx

fin:
 MOV AH, 4CH
 INT 21H 
CODE ENDS
END debut
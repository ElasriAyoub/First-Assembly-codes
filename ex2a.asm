STACK SEGMENT STACK
 DW 256 DUP(0)
base:
STACK ENDS
DATA SEGMENT
                          
VAR1 DW -2
VAR2 DW 04

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
 MOV SP, base
 MOV AX,VAR1 
 ADD AX,VAR2
 
fin:
 MOV AH, 4CH
 INT 21H 
CODE ENDS
END debut
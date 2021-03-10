STACK SEGMENT STACK
 DW 256 DUP(0)
base:
STACK ENDS
DATA SEGMENT
                          
VAR1 DB 2
VAR2 DB 04 
SOM DW ?

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
 MOV AH,VAR1 
 ADD AH,VAR2
 MOV AL,00h
 MOV SOM,AX
 
fin:
 MOV AH, 4CH
 INT 21H 
CODE ENDS
END debut
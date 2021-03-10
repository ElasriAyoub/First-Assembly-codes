STACK SEGMENT STACK
DW 256 DUP(0)
base :
STACK ENDS

DATA SEGMENT
A DW -3
B DW 4
C DW ?
O DB ?
   
;ici on declare les variables
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE,DS:DATA,SS:STACK

;ici on declare les fonctions publiques

;ici on declare les fonctions externes



;ici on declare les fonctions locales
;on precise a l'aide d'un commentaire
;son nom, ses entrees et ses sorties

;Procedure :  name
;Entree:...
;Sortie:...


debut:
MOV AX, DATA
MOV DS, AX

MOV AX, STACK
MOV SS, AX 

MOV SP, base  
MOV AX,A
MOV BX,B
ADD AX,BX
MOV C,AX

; ici on ecrit le corps du programme
fin:
MOV AH, 4CH
INT 21H
CODE ENDS
END debut
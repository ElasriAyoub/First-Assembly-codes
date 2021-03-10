STACK SEGMENT STACK
 DW 256 DUP(0)
base:
STACK ENDS
DATA SEGMENT
B1 DB 1
B2 DB 255
B3 DB -1
B4 DB 'e'
B5 DB 032h
B6 DB 0ffh
B7 DB 1b
B8 DB 11111111b 


D1 DW 1
D2 DW 255
D3 DW -1
D4 DW 'e'
D5 DW 032h
D6 DW 0ffh
D7 DW 1b
D8 DW 11111111b  

Tb DB 1,255,-1,'e',032h,0ffh,1b,11111111b
Td DW 1,255,-1,'e',032h,0ffh,1b,11111111b 
TAB DB 152 DUP(111)
TAB2 DW 150 DUP(43981) 


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
 ; ici on ecrit le corps du programme
fin:
 MOV AH, 4CH
 INT 21H 
CODE ENDS
END debut
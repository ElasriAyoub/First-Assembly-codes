



STACK SEGMENT STACK
 DW 256 DUP(0)
base:
STACK ENDS
DATA SEGMENT  

 msg1 dw 'entrer un entier entre 00 et 99 $' 
 msg2 dw 'la moyenne egale a =$'
 tab1 Dw 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16 
 resTab1 Dw 16 DUP (0) 
  
 n dw 12 
 n2 dw 2
 n3 dw 10
 
tab dw 12 dup(0) 
TAB2 DW 150 DUP(43981) 


 ; ici on declare les variable
DATA ENDS
CODE SEGMENT
 ASSUME CS:CODE, DS:DATA, SS:STACK

 ; ici on declare les fonctions publiques

 ; ici on declare les fonctions externes


 ; ici on declare les fonctions locales
 ; on precise a l'aide d'un commantaire

debut:
 MOV AX, DATA
 MOV DS, AX
 MOV AX, STACK
 MOV SS, AX
 MOV SP, base 
 mov di,16

 mov si,0 
 
    
 h: 
    push si
    
    mov ax,tab1[si]
 
    div  n2
    mov bx,tab1[si]
   
    
    dec di
    cmp dx,0
    
    
    jne donee 
    mov resTab1 [si],bx 
    
    
    cmp di,0
    jne h2
    cmp di,0
    je fin
 h2: 
  pop si
  add si,2  
   jmp h
 donee:
   add bx ,1 
   
  
   pop si
  
   mov resTab1 [si],bx
   add si,2  
   jmp h




 
  
 ; ici on ecrit le corps du programme
fin:
 MOV AH, 4CH
 INT 21H 
CODE ENDS
END debut
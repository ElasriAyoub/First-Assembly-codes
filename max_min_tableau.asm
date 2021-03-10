               STACK SEGMENT STACK
 DW 256 DUP(0)
base:
STACK ENDS
DATA SEGMENT
tab DW 1,5,7,8,0,2



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
 mov si ,0
 mov ax,tab[si]
 mov bx,tab[si]
 mov [200h],ax
 mov [202h],bx
 mov cx,7
 mov si,0
 i:
    mov ax,tab[si]
    cmp ax,[200h]
    jl min 
    cmp ax,[202h]
    jg max  
    h:dec cx
      add si,2
  cmp cx,0
  jl fin
  jmp i
    
    
    
 min:mov [200h],ax
     mov bx,ax
     jmp h 
     
max: mov [202h],ax 
     mov dx,ax
        jmp h  
    
fin:
 MOV AH, 4CH
 INT 21H 
CODE ENDS
END debut
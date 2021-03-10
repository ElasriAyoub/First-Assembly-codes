PUTC    MACRO   char
        PUSH    AX
        MOV     AL, char
        MOV     AH, 0Eh
        INT     10h     
        POP     AX
ENDM




STACK SEGMENT STACK
 DW 256 DUP(0)
base:
STACK ENDS
DATA SEGMENT  

 msg1 dw 'entrer un entier entre 00 et 99 $' 
 msg2 dw 'la moyenne egale a =$'
 
  
 n dw 12 
 n2 dw 10
 
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
 ; son nom, ses entrees et ses sorties
SCAN_NUM        PROC    NEAR
        PUSH    DX
        PUSH    AX
        PUSH    SI
        
        MOV     CX, 0

        ; reset flag:
        MOV     CS:make_minus, 0

 next_digit:

        ; get char from keyboard
        ; into AL:
        MOV     AH, 00h
        INT     16h
        ; and print it:
        MOV     AH, 0Eh
        INT     10h

        ; check for MINUS:
        CMP     AL, '-'
        JE      set_minus

        ; check for ENTER key:
        CMP     AL, 13  ; carriage return?
        JNE     not_cr
        JMP     stop_input
not_cr:


        CMP     AL, 8                   ; 'BACKSPACE' pressed?
        JNE     backspace_checked
        MOV     DX, 0                   ; remove last digit by
        MOV     AX, CX                  ; division:
        DIV     CS:ten                  ; AX = DX:AX / 10 (DX-rem).
        MOV     CX, AX
        PUTC    ' '                     ; clear position.
        PUTC    8                       ; backspace again.
        JMP     next_digit
backspace_checked:


        ; allow only digits:
        CMP     AL, '0'
        JAE     ok_AE_0
        JMP     remove_not_digit
ok_AE_0:        
        CMP     AL, '9'
        JBE     ok_digit
remove_not_digit:       
        PUTC    8       ; backspace.
        PUTC    ' '     ; clear last entered not digit.
        PUTC    8       ; backspace again.        
        JMP     next_digit ; wait for next input.       
ok_digit:


        ; multiply CX by 10 (first time the result is zero)
        PUSH    AX
        MOV     AX, CX
        MUL     CS:ten                  ; DX:AX = AX*10
        MOV     CX, AX
        POP     AX

        ; check if the number is too big
        ; (result should be 16 bits)
        CMP     DX, 0
        JNE     too_big

        ; convert from ASCII code:
        SUB     AL, 30h

        ; add AL to CX:
        MOV     AH, 0
        MOV     DX, CX      ; backup, in case the result will be too big.
        ADD     CX, AX
        JC      too_big2    ; jump if the number is too big.

        JMP     next_digit

set_minus:
        MOV     CS:make_minus, 1
        JMP     next_digit

too_big2:
        MOV     CX, DX      ; restore the backuped value before add.
        MOV     DX, 0       ; DX was zero before backup!
too_big:
        MOV     AX, CX
        DIV     CS:ten  ; reverse last DX:AX = AX*10, make AX = DX:AX / 10
        MOV     CX, AX
        PUTC    8       ; backspace.
        PUTC    ' '     ; clear last entered digit.
        PUTC    8       ; backspace again.        
        JMP     next_digit ; wait for Enter/Backspace.
        
        
stop_input:
        ; check flag:
        CMP     CS:make_minus, 0
        JE      not_minus
        NEG     CX
not_minus:

        POP     SI
        POP     AX
        POP     DX
        RET
make_minus      DB      ?       ; used as a flag.
ten             DW      10      ; used as multiplier.
SCAN_NUM        ENDP
debut:
 MOV AX, DATA
 MOV DS, AX
 MOV AX, STACK
 MOV SS, AX
 MOV SP, base
 mov si,0
 mov bx,n2
 
  
boucle: push si
        push bx 
        MOV DL, offset msg1
        MOV AH, 09H
        INT 21H  
        call SCAN_NUM  
        pop bx 
         dec bx
        pop si
        
        
        mov tab[si],cx 
        add si,2
        MOV DL, 10
        MOV AH, 02H
        INT 21H  
        
        cmp bx,0 
        
        
        jg boucle    
        
        jmp moyen
        
moyen: 
      mov bx,0
      mov si,0
      mov dx,n2 
      
   ici:
      mov ax,tab[si]
      add si,2
      add bx,ax 
      dec dx
      cmp dx,0 
      jg ici
      mov ax,bx 
      div n2
      mov tab[22],ax
      
        
      MOV DL, offset msg2
      MOV AH, 09H
      INT 21H  
      jmp afficher
      


afficher:    
    
    mov si,0
    mov bx,n

;;;;;;;;;;;;; AFFICHAGE APRES LE TRI ;;;;;;;;;;;;;

        
        
    boucle2:
        
        mov ax,tab[22]
                
        dec bx
        push bx
        
            
        
        
        mov bx,10
        mov cx,0
        
    empiler:
    
        mov dx,0
        div bx
        add dx,48
        push dx
        inc cx
        cmp ax,0
        jne empiler
        
    depiler:
    
        mov ah,02h
        pop dx 
        int 21h
        loop depiler        
        
        mov ah,02h
        mov dl,09h
        int 21h
        
        
        pop bx
        
            
        
 
    
    
     
        



 
  
 ; ici on ecrit le corps du programme
fin:
 MOV AH, 4CH
 INT 21H 
CODE ENDS
END debut
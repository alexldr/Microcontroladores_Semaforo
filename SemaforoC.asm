#include "p16F628a.inc" 
    __CONFIG _FOSC_INTOSCCLK & _WDTE_OFF & _PWRTE_OFF & _MCLRE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF

RES_VECT CODE 0x0000 
    GOTO START 

MAIN_PROG CODE 

i equ 0x30
j equ 0x31
k equ 0x32

m equ 0x33
 
state1 equ b'00100001'
state2 equ b'00100010'
state3 equ b'00001100'
state4 equ b'00010100' 
 
START
    MOVLW 0x07 
    MOVWF CMCON
    BCF STATUS, RP1 
    BSF STATUS, RP0
    MOVLW b'00000000' 
    MOVWF TRISB
    BCF STATUS, RP0 
    NOP

inicio:
   

   MOVLW state1
   MOVWF PORTB
   call tiempo5

   MOVLW state2
   MOVWF PORTB
   call tiempo1
   
   nop
   nop
   MOVLW state3
   MOVWF PORTB
   call tiempo5

   MOVLW state4
   MOVWF PORTB
   call tiempo1
  
    goto inicio 

;rutina de tiempo 1seg
tiempo1:
    
    movlw d'127' 
    movwf m
mloop1:
    decfsz m,f
    goto mloop1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    movlw d'71' 
    movwf i
iloop1:
    nop 
    movlw d'62' 
    movwf j
jloop1:
    nop 
    movlw d'74' 
    movwf k
kloop1:
    decfsz k,f
    goto kloop1
    decfsz j,f
    goto jloop1
    decfsz i,f
    goto iloop1
    return 
    
;rutina de tiempo 5 seg
tiempo5:
    nop
    movlw d'10' 
    movwf m
mloop5:
    decfsz m,f
    goto mloop5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    nop
    movlw d'70' 
    movwf i
iloop5:
    nop 
    movlw d'151' 
    movwf j
jloop5:
    nop 
    movlw d'156' 
    movwf k
kloop5:
    decfsz k,f
    goto kloop5
    decfsz j,f
    goto jloop5
    decfsz i,f
    goto iloop5
    return   
    END
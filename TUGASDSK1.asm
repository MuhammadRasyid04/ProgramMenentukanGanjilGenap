.MODEL SMALL
.CODE
ORG 100H
        
   START:
    JMP PROSES
        
    INPUT DB 10,13,'MASUKKAN ANGKA [0-9]: $'
    GANJIL DB 10,13,'ANGKA YANG ANDA INPUT ADALAH GANJIL$'
    GENAP DB 10,13,'ANGKA YANG ANDA INPUT ADALAH GENAP$'
    INVALID DB 10,13, 'INPUTAN ANDA TIDAK VALID!!$'
    

    PROSES:
          MOV AX,@DATA
          MOV DS,AX
          
          MOV AH,9
          LEA DX,INPUT
          INT 21H
          
          MOV AH,1
          INT 21H
          CMP AL,48
          JL SALAH
          CMP AL,57
          JG SALAH
        
          
          MOV AH,0
          MOV DL,2
          DIV DL
          
          CMP AH,0
          JNE GJL
          
     GNP:
          MOV AH,9
          LEA DX,GENAP
          INT 21H
          JMP KELUAR
          
     GJL:
          MOV AH,9
          LEA DX,GANJIL
          INT 21H
          JMP KELUAR
          
     SALAH:
          MOV AH,9
          LEA DX,INVALID
          INT 21H
          
     KELUAR: 
          END PROSES
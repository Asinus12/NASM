; Delete(unlink) file by caling sys_unlink(expects one argument,filename in ebx)
; The sys_unlink opcode is then loaded into eax and kernel is called to delete the file
; To test create file_del.txt in the same folder as .asm file

%include    'functions.asm'
 
SECTION .data
filename db 'file_del.txt', 0h    ; the filename to delete
 
SECTION .text
global  _start
 
_start:
 
    mov     ebx, filename       ; filename we will delete
    mov     eax, 10             ; invoke SYS_UNLINK (kernel opcode 10)
    int     80h                 ; call the kernel
 
    call    quit                ; call our quit function

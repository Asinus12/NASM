; prints a hello world 


SECTION .data
msg     db      'Hello Woold!', 0Ah     ; assign msg variable with your message string
 
SECTION .text
global  _start ; must be declared for linker gcc
 
_start: ; tell linker entry point
 
    mov     edx, 13     ; number of bytes to write - one for each letter plus 0Ah (line feed character)
    mov     ecx, msg    ; move the memory address of our message string into ecx
    mov     ebx, 1      ; write to the STDOUT file
    mov     eax, 4      ; invoke SYS_WRITE (kernel opcode 4)
    int     80h		; without this and bottom two lines, program gives segmentation error
    mov     ebx, 0	; return 0 status on exit - no errors
    mov     eax, 1 	; invoke SYS_EXIT (kernel opcode 1)
    int     80h	

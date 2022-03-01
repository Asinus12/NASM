# NASM (Netwide Assembler) # 
NASM is an assembler and disassembler for the Intel x86 architecture. It can be used to write 16-bit, 32-bit (IA-32) and 64-bit (x86-64) programs.  
NASM is considered to be one of the most popular assemblers for Linux and can output several binary formats:  COFF, OMF, a.out, ELF (support for  
position-independent code), Mach-O , .bin  and its own RDOFF binary format. 

## Building ##

Install the necessary dependancies
```
sudo apt install nasm 
```

Build and run for 64bit system:
``` 
$ nasm -f elf main.asm
$ ld -m elf_i386 main.o -o main 
$ ./main
```


## Cheat Sheat ##


**Registers**
- 32 bit registers (eax,  ebx,  ecx,  edx)  
- 16 bit registers ( ax,   bx,   cx,   dx) - "lower halves of top ones"
-  8 bit registers ( ah,   bh,   ch    dh) - "high" 
-  8 bit registers ( al,   bl    cl    dl) - "low"

**General purpose registers** 
```
; eax - accumulator - input/output, in multiplication, one operand is stored here (eax,ax,al,ah) according to size
; ebx - base - indexed addressing
; ecx - counter - counter in iterative operations
; edx - data - also input/output, used with eax in divide/multiply operations
```

**Pointer registers**
```
; eip - instruction pointer
; esp - stack pointer
; ebp - base pointer
```

**index registers (for string operations)**
```
; esi/si - source index
; edi/di - destination index
```

**control registers**
```
                    		bits
; of - overflow flag		11
; df - direction flag		10
; if - interrupt flag		9
; tf - trap flag	    	8
; sf - sign flag		    7
; zf - zero flag		    6
; ad - auxiliary carry flag	4
; pf - parity flag		    2
; cf - carry flag		    0
```

**System Calls**   
```
  %eax	name		%ebx		        %ecx		    %edx
  1	    sys_exit	int
  2     sys_fork	struct pt_regs
  3	    sys_read	unsigned_int	    char*		    size_t
  4	    sys_write	unsigned int        const char*	    size_t
  5	    sys_open	const char*	        int		        int
  6     sys_close	unsigned int
```
All the syscalls are listed in /usr/inlude/asm/unistd.h

**Kitchen Sink**
```
; $ denotes a constant (integral literal), without it, the number is an absolute address
; % denotes a register
; 32(%esp) indicates an offset of 32 from %esp.
; mov	%ax, %bx moves content of bx into ax
```




- https://www.tutorialspoint.com/assembly_programming/assembly_registers.htm  
- https://asmtutor.com/#lesson1  
- https://carlosrafaelgn.com.br/Asm86/  
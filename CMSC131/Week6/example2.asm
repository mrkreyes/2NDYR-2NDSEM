global _start
global area

section .data
    SYS_EXIT equ 60
    length dq 19
    width dq 42

section .text
_start:
    move rdi, qword[length] ; place the 1st arg to rdi
    mov rsi, qword[width]   ; place the 2nd arg top rsi
    call area

exit_here:
    mov rax, SYS_EXIT
    xor rdi, rdi
    syscall

area:
    mov rax, rdi
    mul rsi
    ret
    

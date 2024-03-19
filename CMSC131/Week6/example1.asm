global _start

section .data
    SYS_EXIT equ 60
    num dq 140

section .text
_start:
    push 30
    pop rax
    push rax
    push qword[num]
    pop rcx
    pop rax

exit_here:
    mov rax, SYS_EXIT
    xor rdi, rdi
    syscall


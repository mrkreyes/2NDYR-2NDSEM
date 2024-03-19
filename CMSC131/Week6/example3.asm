global _start
global swap

section .data
_start:
    mov rdi, num1
    mov rsi, num2
    call swap

exit_here:
    mov rax, SYS_EXIT
    xor rdi, rdi
    syscall
swap:
    push rbp
    mov rbp, rsp
    sub rsp, 8

    mov r10, qword[rdi]
    mov qword[rbp-8], r10
    mov r10, qword[rsi]
    mov qword[rdi], r10
    mov r10, qword[rbp-8]
    mov qword[rsi], r10

    add rsp, 8
    pop rbp
    ret
    
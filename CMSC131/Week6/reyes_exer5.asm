;NAME: MARK ANDREI M. REYES
;2022-03124
;EXERCISE # 5

global _start
global compare
global repeat_subtract
global done

section .data
    SYS_EXIT equ 60
    dividend dq 21
    divisor dq 28
    quo dq 0

section .text
_start:
    mov rdi, qword[dividend] ;place the 1st arg to rdi
    mov rsi, qword[divisor]  ;place the 2nd arg to rsi
    call compare
    mov qword[quo], rax

exit_here:
    mov rax, SYS_EXIT
    xor rdi, rdi
    syscall

compare:
    mov r10, 0               ;Initialize quo counter to 0

repeat_subtract:
    cmp rdi, rsi             ;Compare remaining dividend with divisor
    jb done                  ;If less, division is complete
    sub rdi, rsi             ;Subtract divisor from remaining  dividend
    add r10, 1               ;Increment quotient

    jmp repeat_subtract

done:
    mov rax, r10             ;Store the result in rax
    ret
    




global _start

section .data
    msg: db "Hello World!", 0xa
    len: equ $-msg

section .text

_start:
    mov rax, 0x1   ; SYSCALL SYS_WRITE
    mov rdi, 0x1   ; STDOUT FD
    mov rsi, msg
    mov rdx, len
    syscall

    ; Abort with 0
    mov rax, 60
    mov rdi, 0
    syscall

    ret


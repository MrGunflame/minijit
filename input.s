global _start

section .data
    msg: db "Hello World!", 0xa
    len: equ $-msg

section .text

_start:
    mov eax, 0x4   ; SYSCALL SYS_WRITE
    mov ebx, 0x1   ; STDOUT FD
    mov ecx, msg
    mov edx, len

    int 0x80

    ; Abort with 0
    mov eax, 0x1
    mov ebx, 0x0
    int 0x80


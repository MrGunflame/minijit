global _start

section .data
    msg: db "Hello World!", 0xa
    len: equ $-msg

section .text

_start:
    ; Create static string on stack
    ; Allocate string on stack, aligned to 8
    sub rsp, 16
    ;push dword 'H' | ('e' << 8) | ('l' << 16) | ('l' << 24)
    ;push dword 'o' | (' ' << 8) | ('W' << 16) | ('o' << 24)
    ;push dword 'r' | ('l' << 8) | ('d' << 16) | ('!' << 24)
    ;push dword "Hell"
    ;push dword "o Wo"
    ;push dword "rld!"

    mov dword [rsp], "Hell"
    mov dword [rsp+4], "o Wo"
    mov dword [rsp+8], "rld!"

    mov rsi, rsp

    mov rax, 0x1   ; SYSCALL SYS_WRITE
    mov rdi, 0x1   ; STDOUT FD
    ;mov rsi, msg
    mov rdx, 12
    syscall

    ; Free string
    add rsp, 16

    ; Abort with 0
    mov rax, 60
    mov rdi, 0
    syscall

    ret


bits 64
section .text
global memmove

memmove:
    xor rcx, rcx
    jmp loop

loop:
    cmp rcx, rdx
    je end
    mov r8b, byte[rsi + rcx]
    mov byte[rdi + rcx], r8b
    inc rcx
    jmp loop

end:
    mov rax, rdi
    ret


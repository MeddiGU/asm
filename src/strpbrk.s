bits 64
section .text
global strpbrk

strpbrk:
    xor rcx, rcx
    xor rax, rax
    xor rdx, rdx
    jmp f_loop

f_loop:
    mov rdx, 0
    mov al, byte [rdi + rcx]
    cmp al, 0
    je null
    jmp s_loop

s_loop:
    cmp byte [rsi + rdx], 0
    je increment
    cmp al, byte [rsi + rdx]
    je end
    inc rdx
    jmp s_loop

increment:
    inc rcx
    jmp f_loop

null:
    mov rax, 0
    ret

end:
    add rdi, rcx
    mov rax, rdi
    ret
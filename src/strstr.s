bits 64
section .text
global strstr

strstr:
    xor rcx, rcx
    xor rax, rax
    xor rdx, rdx
    xor r9, r9
    jmp f_loop

f_loop:
    mov rdx, 0
    cmp byte [rsi + rdx], 0
    je end
    mov al, byte [rdi + rcx]
    cmp al, 0
    je null
    mov r9, rcx
    jmp s_loop

s_loop:
    mov al, byte [rdi + r9]
    cmp byte [rsi + rdx], 0
    je end
    cmp al, byte [rsi + rdx]
    je found
    jne increment

increment:
    mov rdx, 0
    inc rcx
    jmp f_loop

found:
    inc rdx
    inc r9
    jmp s_loop

null:
    mov rax, 0
    ret

end:
    add rdi, rcx
    mov rax, rdi
    ret
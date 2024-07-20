bits 64
section .text
global memset

memset:
    xor rcx, rcx
    jmp loop

loop:
    cmp rcx, rdx
    je end
    mov [rdi + rcx], sil
    inc rcx
    jmp loop

end:
    mov rax, rdi
    ret

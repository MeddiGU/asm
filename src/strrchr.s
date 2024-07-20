bits 64
section .text
global strrchr

strrchr:
    mov rcx, 0
    xor rdx, rdx
    mov rax, 0
    jmp loop;

loop:
    cmp byte [rdi], sil
    je stock
    cmp byte [rdi], 0
    je end
    inc rdi
    jmp loop

stock:
    mov rax, rdi
    cmp byte [rdi], 0
    je end
    inc rdi
    jmp loop

end:
    ret;

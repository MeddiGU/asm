bits 64
section .text
global strchr

strchr:
    xor rax, rax
    jmp loop;

loop:
    cmp byte [rdi], sil
    je end
    cmp byte [rdi], 0
    je null
    inc rdi
    jmp loop

end:
    mov rax, rdi
    ret;

null:
    ret;
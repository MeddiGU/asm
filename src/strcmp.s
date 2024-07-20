bits 64
section .text
global strcmp

strcmp:
    mov rax, 0
    mov rcx, 0
    jmp loop;

loop:
    mov bl, byte[rdi + rcx]
    mov al, byte[rsi + rcx]

    cmp bl, 0
    je end
    cmp al, 0
    je end

    cmp bl, al
    jne end

    inc rcx
    jmp loop;

end:
    sub bl, al
    movsx rax, bl
    ret;


bits 64
section .text
global strncmp

strncmp:
    mov rcx, 0
    cmp rdx, 0
    je null

    jmp loop

loop:

    cmp rcx, rdx
    je end
    mov al, byte[rdi + rcx]
    mov bl, byte[rsi + rcx]
    cmp al, 0
    je end

    cmp bl, 0
    je end

    cmp al, bl
    jne end

    inc rcx
    jmp loop

end:
    sub al, bl
    movsx rax, al
    ret;

null:
    mov rax, 0
    ret;
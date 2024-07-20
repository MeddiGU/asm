bits 64
section .text
global strcspn
extern strlen

strcspn:
    xor rdx, rdx
    xor rcx, rcx
    xor rax, rax
    mov rdx, 699
    jmp f_loop

f_loop:
    mov al, byte [rsi]
    cmp byte [rsi], 0
    je check
    jmp s_loop

    s_loop:
        cmp byte[rdi + rcx], 0
        je increment
        cmp byte [rdi + rcx], al
        je increment
        inc rcx
        jmp s_loop

    increment:
        cmp rdx, 699
        je stock
        cmp rcx, rdx
        jb stock
        inc rsi
        xor rcx, rcx
        jmp f_loop

    stock:
        mov rdx, rcx
        mov rcx, 0
        inc rsi
        jmp f_loop

check:
    cmp rdx, 699
    je not_found
    jmp end

not_found:
    xor rax, rax
    jmp loop_not_found

    loop_not_found:
        cmp byte[rdi + rax], 0
        je ret_not_found
        inc rax
        jmp loop_not_found

ret_not_found:
    ret

end:
    mov rax, rdx
    ret
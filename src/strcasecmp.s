bits 64
section .text
global strcasecmp

strcasecmp:
    xor rcx, rcx
    xor rax, rax
    xor r8b, r8b
    xor r9b, r9b
    xor r10b, r10b
    xor r11b, r11b
    cmp byte [rsi + rcx], 0
    je empty_rsi
    jmp loop

loop:
    mov al, byte [rdi + rcx]
    mov bl, byte [rsi]
    cmp al, 0
    je end
    cmp bl, 0
    je end

    cmp al, bl
    je increment

    mov r8b, bl
    add r8b, 32
    mov r9b, al
    add r9b, 32

    cmp r8b, al
    je increment
    cmp r9b, bl
    je increment

    mov r10b, al
    sub r10b, 32
    mov r11b, bl
    sub r11b, 32

    cmp r10b, bl
    je increment
    cmp r11b, al
    je increment;
    jne end

increment:
    inc rsi
    inc rcx
    jmp loop;

greater:
	mov	al, [rdi + rcx]
	add	al, 32
	jmp	end_empty

lower:
	cmp	byte [rdi + rcx], "A"
	jge	greater                     ; va dans greater si le caractère est en majuscule
	jmp	end_empty

empty_rsi:
	cmp	byte [rdi + rcx], "Z"
	jle	lower                       ; va dans lower si le caractère est en minuscule
	jmp	end_empty

end_empty:
    mov al, byte [rdi + rcx]
    movsx rax, al
    ret

end:
    sub al, bl
    movsx rax, al
    ret;
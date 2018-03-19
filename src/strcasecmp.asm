section .text
global strcasecmp:function

strcasecmp:
        enter	0, 0
        xor	rcx, rcx
        xor	rdx, rdx
        xor	rax, rax
        xor	r8, r8
        xor	r9, r9
        mov	r10, 1
        cmp	rdi, 0
        jz	end
        cmp	rsi, 0
        jz	end
loop:
	cmp	r10, 1
	jz	test_r8b
	cmp	r8b, r9b
	jnz	end
	cmp	r8b, 0
        jz	end
        cmp	r9b, 0
        jz	end
        inc	rcx
        mov	r10, 1
        jmp	loop
test_r8b:
	xor	r10, r10
	mov	r8b, BYTE [rdi + rcx]
	cmp	r8b, 'A'
	jnae	test_r9b
	cmp	r8b, 'Z'
	jbe	set_r8b
	jmp	test_r9b
set_r8b:
	add	r8b, 32
	jmp	test_r9b
test_r9b:
	mov	r9b, BYTE [rsi + rcx]
	cmp	r9b, 'A'
	jnae	loop
	cmp	r9b, 'Z'
	jbe	set_r9b
	jmp	loop
set_r9b:
	add	r9b, 32
	jmp	loop
end:
	mov	rax, r8
	sub	rax, r9
	leave
	ret
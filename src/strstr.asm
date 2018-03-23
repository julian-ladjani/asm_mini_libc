section .text
global strstr:function

strstr:
	enter	0, 0
	xor	rcx, rcx
        xor	rdx, rdx
        xor	rbx, rbx
        xor	rax, rax
        xor	r8, r8
        xor	r9, r9
        cmp	rdi, 0
        jz	end_null
        cmp	rsi, 0
        jz	end_null
        cmp	BYTE [rsi], 0
        je	end_found
loop:
	mov	r8b, BYTE [rdi + rcx]
	mov	r9b, BYTE [rsi]
	cmp	r8b, r9b
        jz	loop_equal
	cmp	r8b, 0
	jz	end_null
	inc	rcx
	inc	rbx
	jmp	loop
loop_equal:
	mov	r8b, BYTE [rdi + rbx]
	mov	r9b, BYTE [rsi + rdx]
	cmp	r9b, 0
        jz	end_found
	cmp	r8b, r9b
	jne	reset
	inc	rbx
	inc	rdx
	jmp	loop_equal
reset:
	inc	rcx
	mov	rbx, rcx
	xor	rdx, rdx
	jmp	loop
end_found:
	add	rdi, rcx
	mov	rax, rdi
	leave
	ret
end_null:
	mov	rax, 0
	leave
	ret

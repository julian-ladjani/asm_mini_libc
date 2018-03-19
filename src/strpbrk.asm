section .text
global strpbrk:function

strpbrk:
        enter	0, 0
        xor	rcx, rcx
        xor	rdx, rdx
        xor	rax, rax
        xor	r8, r8
        xor	r9, r9
        cmp	rdi, 0
        jz	end
        cmp	rsi, 0
        jz	end
        xor	r10, r10
        mov	r8b, BYTE [rdi]
loop:
	mov	r9b, BYTE [rsi + rcx]
	cmp	r8b, r9b
	jz	found
	cmp	r9b, 0
        jz	set_r8b
        inc	rcx
        jmp	loop
set_r8b:
	mov	r8b, BYTE [rdi + r10]
	xor	rcx, rcx
	inc	r10
	cmp	r8b, 0
	jz	end
	jmp	loop
found:
	cmp	r10, 0
	jz	ret_r10
	sub	r10, 1
	add	rdi, r10
        mov	rax, rdi
	jmp	end
ret_r10:
	mov	rax, rdi
	jmp	end
end:
	leave
	ret
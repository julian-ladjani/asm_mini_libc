section .text
global strcspn:function

strcspn:
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
        mov	r8b, BYTE [rdi + r10]
loop:
	mov	r9b, BYTE [rsi + rcx]
	cmp	r8b, r9b
	jz	end_diff
	cmp	r9b, 0
        jz	set_r8b
        inc	rcx
        jmp	loop
set_r8b:
	mov	r8b, BYTE [rdi + r10]
	cmp	r8b, 0
        jz	end_diff
	inc	r10
	xor	rcx, rcx
	jmp	loop
end_diff:
	cmp	r10, 0
	jz	end
	cmp	r9b, 0
	jz	end
	sub	r10, 1
	jmp	end
end:
	mov	rax, r10
	leave
	ret
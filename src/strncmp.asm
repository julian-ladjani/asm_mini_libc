section .text
global strncmp:function

strncmp:
        enter	0, 0
        xor	rcx, rcx
        xor	rax, rax
        xor	r8, r8
        xor	r9, r9
        cmp	rdi, 0
        jz	end
        cmp	rsi, 0
        jz	end
loop:
	cmp	rdx, rcx
	jz	end
	mov	r8b, BYTE [rdi + rcx]
	mov	r9b, BYTE [rsi + rcx]
	cmp	r8b, r9b
	jnz	end
	cmp	r8b, 0
        jz	end
        cmp	r9b, 0
        jz	end
        inc	rcx
        jmp	loop
end:
	mov	rax, r8
	sub	rax, r9
	leave
	ret
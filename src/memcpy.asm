section .text
global memcpy:function

memcpy:
	enter	0,0
	xor	rcx, rcx
	cmp	rdi, 0
	jz	end
	cmp	rsi, 0
	jz	end
loop:
	cmp	rdx, rcx
	jz	end
	mov	r8b, [rsi + rcx]
	mov	[rdi + rcx], r8b
	inc	rcx
	jmp	loop
end:
	mov rax, rdi
	leave
	ret
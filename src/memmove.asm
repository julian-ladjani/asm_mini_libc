section .text
global memmove:function

memmove:
	enter	0,0
	xor	rcx, rcx
	xor	r8, r8
	cmp	rdi, 0
	jz	end
	cmp	rsi, 0
	jz	end
check_overlap:
	cmp	rdi, rsi
	jb	left_to_right
	dec	rdx
right_to_left:
	cmp	rdx, 0
	jl	end
	mov	r8b, [rsi + rdx]
	mov	[rdi + rdx], r8b
	dec	rdx
	jmp	right_to_left
left_to_right:
	cmp	rdx, rcx
	jz	end
	mov	r8b, [rsi + rcx]
	mov	[rdi + rcx], r8b
	inc	rcx
	jmp	left_to_right
end:
	mov rax, rdi
	leave
	ret
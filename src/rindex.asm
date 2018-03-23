section .text
global rindex:function

rindex:
        enter	0, 0
        xor	rcx, rcx
        xor	rdx, rdx
        xor	rax, rax
        mov	r8, -1
        cmp	rdi, 0
        je	end_null
loop:
	cmp	BYTE [rdi + rcx], sil
	je	save_pos
	cmp	BYTE [rdi + rcx], 0
	je	end_check
	inc	rcx
	jmp	loop
save_pos:
	mov	r8, rcx
	cmp	BYTE [rdi + rcx], 0
        je	end_check
	inc	rcx
	jmp	loop
end_check:
	cmp	r8, -1
	je	end_null
	jmp	end
end_null:
	leave
	ret
end:
	add	rdi, r8
	mov	rax, rdi
	leave
	ret
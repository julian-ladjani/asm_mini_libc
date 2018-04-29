section .text
global atoi:function

atoi:
	enter	0,0
        xor	rax, rax
        xor	rcx, rcx
        xor	rsi, rsi
        xor	rdx, rdx
        cmp	rdi, 0
        je	end
loop:
	cmp	BYTE [rdi + rcx], 0
	je	good_string_end
	mov	sil, BYTE [rdi + rcx]
	jmp	check_char
add_char:
	sub	sil, 48
	imul	rdx, rdx, 10
	add	rdx, rsi
inc:	inc	rcx
	jmp	loop
check_char:
	cmp	sil, '0'
	jae	check_char_second
	cmp	sil, '-'
	je	check_first_char
	jmp	wrong_char_end
check_char_second:
	cmp	sil, '9'
	jnae	add_char
	jmp	wrong_char_end
check_first_char:
	cmp	rcx, 0
	je	inc
	jmp	wrong_char_end
good_string_end:
	cmp	BYTE [rdi], '-'
	je	invert_number
	jmp	end
invert_number:
	imul	rdx, rdx, -1
	jmp	end
wrong_char_end:
	xor	rdx, rdx
	jmp	end
end:
	mov	rax, rdx
	leave
	ret
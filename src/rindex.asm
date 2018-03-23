section .text
global rindex:function

rindex:
        enter	0, 0
        xor	rcx, rcx
        xor	rdx, rdx
        xor	rax, rax
        cmp	rdi, 0
        jz	end
loop:
	cmp	BYTE [rdi + rcx], sil
	jz	found
	cmp	BYTE [rdi + rcx], 0
        jz	end_check
        inc	rcx
        jmp	loop
found:
	add	rdi, rcx
	mov	rax, rdi
	cmp	BYTE [rdi + rcx], 0
        jz	end
	mov	rcx, 1
        jmp	loop
end_check:
	cmp	sil, 0
	jz	fix_end
	jmp	end
fix_end:
	add	rdi, rcx
        mov	rax, rdi
        jmp	end
end:
	leave
	ret
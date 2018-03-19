section .text
global memset:function

memset:
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
        jz	end
        inc	rcx
        jmp	loop
found:
	add	rdi, rcx
	mov	rax, rdi
	cmp	BYTE [rdi + rcx], 0
        jz	end
	mov	rcx, 1
        jmp	loop
end:
	leave
	ret
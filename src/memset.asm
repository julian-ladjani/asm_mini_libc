section .text
global memset:function

memset:
        enter	0, 0
        xor	rcx, rcx
        xor	rax, rax
        cmp	rdi, 0
        jz	end
loop:
	cmp	rcx, rdx
	jz	end
	mov	BYTE [rdi + rcx], sil
        inc	rcx
        jmp	loop
end:
	mov	rax, rdi
	leave
	ret
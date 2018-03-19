section .text
global strchr:function

strchr:
        enter	0, 0
        xor	rcx, rcx
        xor	rdx, rdx
        cmp	rdi, 0
        jz	not_found
loop:
	cmp	BYTE [rdi + rcx], sil
	jz	found
	cmp	BYTE [rdi + rcx], 0
	jz	not_found
        inc	rcx
        jmp	loop
found:
	add	rdi, rcx
        mov	rax, rdi
       	leave
        ret
not_found:
	mov	rax, 0
	leave
	ret
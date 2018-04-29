section .text
global write:function

write:
	enter	0,0
        xor	rax, rax
        cmp	rsi, 0
        je	end
	syscall	1
end:
	leave
	ret
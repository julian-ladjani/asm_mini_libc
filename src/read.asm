section .text
global read:function

read:
	enter	0,0
        xor	rax, rax
        cmp	rsi, 0
        je	end
	syscall	0
end:
	leave
	ret
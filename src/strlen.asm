section .text
global strlen:function

strlen:
	enter	0, 0
        xor 	rsi, rsi
        xor     rcx, rcx
        cmp	rdi, 0
        jz	end
loop:
        cmp     BYTE [rdi + rcx], 0
        jz      end
        inc     rcx
        jmp     loop
end:
        mov     rax, rcx
        leave
        ret

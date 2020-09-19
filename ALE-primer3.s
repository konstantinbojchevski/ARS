; Program prešteje enice v 16-bitnem številu
;
		.data
		.org 0x400
A:		.word16 0xabcd
B:		.space 1

		.code
		.org 0
		addi r2, r0, 16		; števec bitov
		addi r7, r0, 0		; števec enic
		lhu r4, A(r0)		; r4 <- M[0x400]
		addi r3, r0, 1		; maska  ..000001
ZANKA:	and r5, r4, r3		; 
		snei r6, r5, 0		; r6 <- (r5 != 0)
		addu r7, r7, r6		; 
		slli r3, r3, 1		; r3 <- r3 << 1, pomik maske ..0010
		subi r2, r2, 1		; r2 <- r2 - 1
		bne r2, ZANKA		; branch if not equal to zero
		sb B(r0), r7
		halt
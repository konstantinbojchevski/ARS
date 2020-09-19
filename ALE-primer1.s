	.data
	.org 0x400		; 0100 0000 0000 = 1024
A:	.byte 12		; A = 0x400 naslov
B:	.byte 0x12		; = 18, naslov B = 0x401
C:	.space 1		; prostor 1B

D:	.byte -6
E:	.byte 0xF5		; 
F:	.space 1		

	.code ; ali .text
	.org 0
		
	lb r2, A(r0)	; r2 <- M[0x400] (= 12)
	lb r3, B(r0)	; r3 <- M[0x401] (=18)
	add r4, r2, r3	; r4 <- r2 + r3 (=30)
	sb C(r0), r4
		
	lb r5, D(r0)	; -6
	lb r6, E(r0)	; 0xF5 = 1111 0101, 1'K: 0000 1010 + 1 = 11, 0xF5 = -11
	sub r7, r5, r6	; r7 <- r5 - r6 = 5
	sb F(r0), r7
		
	lbu r8, D(r0)	; -6 = 1111 1010 -> r8 <- 0...0 1111 1010 = 255-4-1=250  
	lb r9, E(r0)	; r9 <- -11
	add r10, r8, r9	; 239
		
	halt
	.data
	.org 0x400
A:	.word 12
B:	.space 4

	.code
	.org 0x0
	lw r1, A(r0)
	slli r2, r1, 3
	slli r3, r1, 1
	add r4, r2, r3
	sw B(r0), r4
	halt

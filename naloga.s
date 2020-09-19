	.data
	.org 0x400
x:	.word16 20, 0xa505, 0x0c3
y:	.space 2

	.code
	.org 0
	addui r1, r0, #3
	addui r2, r0, #x
	add r3, r0, r0
zanka:  lh r4, 0(r2)
	sgti r5, r4, #0
	beq r5, if1
	add r3, r3, r4
if1:	subui r1, r1, #1
	addui r2, r2, #2
	bne r1, zanka
	sh 0(r2), r3
	halt
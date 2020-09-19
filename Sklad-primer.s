; Podprogram, ki inkrementira spremenljivko
;
		.data 
		.org 0x400
a:		.word 5

		.text
		.org 0
		lw r1, a(r0)
		addui r30, r0, 0x7FC	; SP
		add r24, r0, r1			; parameter
		call r31, inkrement(r0)	; klic, povratni naslov
		add r1, r0, r28			; vrnjena vrednost v r1
		halt

inkrement:		
; VSTOPNA TOCKA:
		sw 0(r30), r31		; push r31 (shrani povratni naslov)
		subui r30, r30, 4	

		sw 0(r30), r29		; push r29 (shrani FP)
		subui r30, r30, 4	

		add r29, r0, r30 	; FP <- SP
; PROCEDURA:
		subui r30,r30, 4 	; rezerviraj na skladu prostor za 32-bitno spremenljivko x (SP--)
		
		sw 0(r30), r6		; push r6 (shrani register, ki se v podprogramu spreminja)
		subui r30, r30, 4	
		
		add r6, r0, r24 	; r6 <- a
		addi r6, r6, #1
		sw 0(r29), r6 		; x <- r6
		lw r28, 0(r29) 		; vrednosti vracamo v r28 (r28 <- x)
		
		addui r30, r30, 4 	; pop r6 (pred izstopom obnovimo r6)
		lw r6, 0(r30)
; IZSTOPNA TOCKA: 
		add r30, r0, r29 	; pobrisemo lokalne spremenljivke s sklada
		addui r30, r30, 4	; pop r29 (obnovi r29)
		lw r29, 0(r30)
		addui r30, r30, 4	; pop r31 (povratni naslov v r31)
		lw r31, 0(r30)
		j 0(r31) 			; povratek v klicoci program

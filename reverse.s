> lbu r1, A(r0):

    r1 = 0000 .... 0000 ABCD EFGH 

 > andi r2, r1, #0xf:

    r2 = 0000 .... 0000 0000 EFGH

> andi r3, r1, #0xf0:

    r3 = 0000 .... 0000 ABCD 0000

> srli r3, r3, #4

    r3 = 0000 .... 0000 0000 ABCD

> add  r4, r3, r2

    r2 = 0000 .... 0000 0000 EFGH
 +  r3 = 0000 .... 0000 0000 ABCD
    r4 = 0000 .... 0000 000? ????

    Tuki trenutno se ne vemo dost, se vrnemo po koncu 

> slli r2, r2, #4

    r2 = 0000 .... 0000 EFGH 0000

> add  r5, r3, r2

    r3 = 0000 .... 0000 0000 ABCD
 +  r2 = 0000 .... 0000 EFGH 0000
    r5 = 0000 .... 0000 EFGH ABCD

> sub r5, r1, r5

    r1 = 0000 .... 0000 ABCD EFGH 
 -  r5 = 0000 .... 0000 EFGH ABCD
    r5 = 0000 .... 000? ???? ????

    Tuki trenutno se ne vemo dost, se vrnemo po koncu 

> seqi  r1, r5, #0xa5

    Tuki ugotovimo da more biti:
    r5 = #0xa5 = 
    r5 = 0000 .... 0000 1010 0101

> seqi  r4, r4, #0xf

    Tuki ugotovimo da more biti:
    r4 = #0xf =
    r4 = 0000 .... 0000 0000 1111

In zej mamo dovolj podatkov da izracunamo zacetni X 

    r2 = 0000 .... 0000 0000 EFGH
 +  r3 = 0000 .... 0000 0000 ABCD
    r4 = 0000 .... 0000 0000 1111

    (Tle je zlo pomembno da nimamo preliva)

    in 

    r1 = 0000 .... 0000 ABCD EFGH 
 -  r5 = 0000 .... 0000 EFGH ABCD
    r5 = 0000 .... 0000 1010 0101

    Sepravi:

    EFGH
 +  ABCD
    1111

    in 

    ABCD EFGH  
 -  EFGH ABCD  
    1010 0101  

    Vemo da ker pri prvi enačbi ni preliva, da sta ABCD in EFGH lih v reversu.
    Sepravi ali je ABCD = 1100, EFGH = 0011 ali ABCD = 1001 in EFGH = 0110 and so on. 
    Torej lahko recemo da je ABCD = NOT EFGH

    To je ful usefull ker ugotovimo da če je bi te dve števili sešteli bi morali dobiti 1111 1111 = 255 

    in essence

    x + y = 255
    x - y = 165 = 1010 0101 

    X = 210 = 0XD2

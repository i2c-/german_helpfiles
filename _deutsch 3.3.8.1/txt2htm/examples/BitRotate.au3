Local $x = BitRotate(7, 2)
;  x == 28 weil 111b zweimal nach links rotiert 1 1100b ==28 ist.

Local $y = BitRotate(14, -2)
;  y == 32771 weil 1110b zweimal nach rechts rotiert bei 16 Bits 1000 0000 0000 0011b == 32771 ergibt.

Local $z = BitRotate(14, -2, "D")
;  z == -2147483645 weil 1110b zweimal nach rechts rotiert bei 32 Bits 1000 0000 0000 0000 0000 0000 0000 0011b == -2147483645 ergibt.

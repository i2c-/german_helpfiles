Local $x = BitShift(14, 2)
;  x == 3 weil 1110b zweimal nach rechts verschoben 11b == 3 ist.

Local $y = BitShift(14, -2)
;  y == 56 weil 1110b zweimal nach links verschoben 111000b == 56 ist.

Local $z = BitShift(1, -31)
;  z == -2147483648 weil in der Darstellung als 2-Komplement
;  das 32. Bit von rechts das Minuszeichen darstellt.

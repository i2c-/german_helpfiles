Local $x = BitNOT(5)

#cs Kommentar:
	Ergebnis ist -6 weil f&uuml;r 32-bit Werte
	5 == 00000000000000000000000000000101 bin&auml;r
	-6 == 11111111111111111111111111111010 bin&auml;r
	und das erste Bit das Vorzeichenbit ist.
#ce

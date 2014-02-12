#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Weisst einer lokalen Variable den Arcsinus von 0.5 zu.
	Local $iArcSin1 = ASin(0.5)

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", $iArcSin1 & " rad.")

	; Weisst einer lokalen konstanten Variable die gerundete PI-Zahl zu.
	Local Const $PI = 3.141592653589793

	; Weisst einer lokalen Variable die Formel f&uuml;r das umrechnen von Bogenma&szlig; (Radian) in Grad zu (entspricht einem Bogenma&szlig; in Grad).
	Local $iRadToDeg = 180 / $PI

	; Weisst einer lokalen Variable eine Gradzahl zu.
	Local $iArcSin2 = $iRadToDeg * ASin(1)

	; Zeigt das Ergebnis.
	MsgBox($MB_SYSTEMMODAL, "", $iArcSin2 & " Grad.")
EndFunc   ;==>Example

#include <MsgBoxConstants.au3>
#include <Array.au3> ; wird nur f&uuml;r _ArrayDisplay() ben&ouml;tigt.

Example()

Func Example()
	; Konvertiert den String in ein Array.
	Local $aArray = StringToASCIIArray("This is a sentence with whitespace.")

	; Das Array anzeigen, um zu verdeutlichen, dass es die ASCII-Werte jedes Zeichens enth&auml;lt.
	_ArrayDisplay($aArray)

	; Jetzt das Array in einen String umwandeln.
	Local $sString = StringFromASCIIArray($aArray)

	; Anzeige des Strings, um die &Uuml;bereinstimmung mit der Originaleingabe zu belegen. Der String wurde urspr&uuml;nglich in ein Array umgewandelt.
	MsgBox($MB_SYSTEMMODAL, "", $sString)
EndFunc   ;==>Example

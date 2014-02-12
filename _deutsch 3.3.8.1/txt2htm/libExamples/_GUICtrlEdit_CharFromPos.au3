#include <GuiEdit.au3>
#include <GuiConstantsEx.au3>

$Debug_Ed = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Edit-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $aCharPos[2], $hEdit, $x = 100, $y = 20

	; Erstellt eine GUI
	GUICreate("Edit: Ermittelt Index und Zeile des Zeichens, das dem Fensterpunkt x,y am n&auml;chsten ist", 600, 300)
	$hEdit = GUICtrlCreateEdit("Dies ist ein Test." & @CRLF & "Eine andere Zeile.", 2, 2, 394, 268)
	GUISetState()

	_GUICtrlEdit_AppendText($hEdit, @CRLF & "An das Ende anh&auml;ngen?")

	$aCharPos = _GUICtrlEdit_CharFromPos($hEdit, $x, $y)

	MsgBox(4160, "Information (Alle Werte sind 0-basierend!)", StringFormat("Indes des Zeichens, das dem Punkt [%d,%d] am n&auml;chsten liegt: [%2d]", $x, $y, $aCharPos[0]) & @LF & _
			StringFormat("Zeile, die dem Punkt [%d,%d] am n&auml;chsten liegt: [%2d]", $x, $y, $aCharPos[1]))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

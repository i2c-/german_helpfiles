#include <GuiEdit.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $aCharPos[2], $hEdit, $x = 100, $y = 20

	; Erstellt eine GUI
	GUICreate("Edit: Ermittelt Index und Zeile des Zeichens, das dem Fensterpunkt x,y am n&auml;chsten ist", 600, 300)
	$hEdit = GUICtrlCreateEdit("Dies ist ein Test." & @CRLF & "Eine andere Zeile.", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	_GUICtrlEdit_AppendText($hEdit, @CRLF & "An das Ende anh&auml;ngen?")

	$aCharPos = _GUICtrlEdit_CharFromPos($hEdit, $x, $y)

	MsgBox($MB_SYSTEMMODAL, "Information (Alle Werte sind 0-basierend!)", StringFormat("Indes des Zeichens, das dem Punkt [%d,%d] am n&auml;chsten liegt: [%2d]", $x, $y, $aCharPos[0]) & @CRLF & _
			StringFormat("Zeile, die dem Punkt [%d,%d] am n&auml;chsten liegt: [%2d]", $x, $y, $aCharPos[1]))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

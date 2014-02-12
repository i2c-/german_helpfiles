#include <GuiEdit.au3>
#include <GuiConstantsEx.au3>

$Debug_Ed = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Edit-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hEdit

	; Erstellt eine GUI
	GUICreate("Edit: Ermittelt die erste sichtbare Zeile", 400, 300)
	$hEdit = GUICtrlCreateEdit("", 2, 2, 394, 268)
	GUISetState()

	For $x = 0 To 20
		_GUICtrlEdit_AppendText($hEdit, StringFormat("[%02d] An das Ende anh&auml;ngen?", $x) & @CRLF)
	Next

	MsgBox(4160, "Information", "Erste sichtbare Zeile: " & _GUICtrlEdit_GetFirstVisibleLine($hEdit))

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

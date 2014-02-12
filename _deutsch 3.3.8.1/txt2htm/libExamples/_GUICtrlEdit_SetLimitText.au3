#include <GuiEdit.au3>
#include <GuiConstantsEx.au3>

$Debug_Ed = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Edit-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hEdit

	; Erstellt eine GUI
	GUICreate("Edit: Setzt das Textlimit", 400, 300)
	$hEdit = GUICtrlCreateEdit("Dies ist ein Test" & @CRLF & "eine andere Zeile", 2, 2, 394, 268)
	GUISetState()

	MsgBox(4160, "Information", "Textlimit: " & _GUICtrlEdit_GetLimitText($hEdit))

	MsgBox(4160, "Information", "Setzt das Textlimit")
	_GUICtrlEdit_SetLimitText($hEdit, 64000)

	MsgBox(4160, "Information", "Textlimit: " & _GUICtrlEdit_GetLimitText($hEdit))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

#include <GuiEdit.au3>
#include <GuiConstantsEx.au3>

$Debug_Ed = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Edit-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hEdit

	; Erstellt eine GUI
	GUICreate("Edit: Text setzen", 400, 300)
	$hEdit = GUICtrlCreateEdit("", 2, 2, 394, 268)
	GUISetState()

	; Setzt den Text
	_GUICtrlEdit_SetText($hEdit, "Dies ist ein Test" & @CRLF & "Eine andere Zeile" & @CRLF & "An das Ende anh&auml;ngen?")

	; Ermittelt den Text
	MsgBox(4160, "Information", _GUICtrlEdit_GetText($hEdit))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

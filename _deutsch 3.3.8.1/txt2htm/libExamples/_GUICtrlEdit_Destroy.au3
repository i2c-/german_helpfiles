#include <GuiEdit.au3>
#include <GuiConstantsEx.au3>

$Debug_Ed = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Edit-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hGUI, $hEdit

	; Erstellt eine GUI
	$hGUI = GUICreate("Edit: l&ouml;schen", 400, 300)
	$hEdit = _GUICtrlEdit_Create($hGUI, "Dies ist ein Test" & @CRLF & "eine andere Zeile", 2, 2, 394, 268)
	GUISetState()

	_GUICtrlEdit_AppendText($hEdit, @CRLF & "An das Ende anh&auml;ngen?")

	MsgBox(4160, "Information", "Das Edit-Control wird gel&ouml;scht")
	_GUICtrlEdit_Destroy($hEdit)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

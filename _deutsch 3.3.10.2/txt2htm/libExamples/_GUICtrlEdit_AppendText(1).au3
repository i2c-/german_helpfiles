#include <GuiEdit.au3>
#include <GuiConstantsEx.au3>

Example()

Func Example()
	Local $hEdit

	; Erstellt eine GUI
	GUICreate("Edit: Einen Text anh&auml;ngen", 400, 300)
	$hEdit = GUICtrlCreateEdit("Dies ist ein Test" & @CRLF & "Eine andere Zeile", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	_GUICtrlEdit_AppendText($hEdit, @CRLF & "Zeile an das Ende anh&auml;ngen?")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

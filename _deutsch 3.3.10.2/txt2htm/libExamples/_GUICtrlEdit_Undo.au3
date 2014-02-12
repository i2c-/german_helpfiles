#include <GuiEdit.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hEdit

	; Erstellt eine GUI
	GUICreate("Edit: R&uuml;ckg&auml;ngig machen", 400, 300)
	$hEdit = GUICtrlCreateEdit("Dies ist ein Test" & @CRLF & "Eine andere Zeile", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	_GUICtrlEdit_AppendText($hEdit, @CRLF & "An das Ende anh&auml;ngen?")

	; R&uuml;ckg&auml;ngig machen
	MsgBox($MB_SYSTEMMODAL, "Information", "Die letzte Aktion wird nun r&uuml;ckg&auml;ngig gemacht")
	_GUICtrlEdit_Undo($hEdit)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

#include <GuiEdit.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hEdit

	; Erstellt eine GUI
	GUICreate("Edit: Undo aktivieren", 400, 300)
	$hEdit = GUICtrlCreateEdit("Dies ist ein Test" & @CRLF & "Eine andere Zeile", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	MsgBox($MB_SYSTEMMODAL, "Information", "Undo aktivieren: " & _GUICtrlEdit_CanUndo($hEdit))

	_GUICtrlEdit_AppendText($hEdit, @CRLF & "An das Ende anh&auml;ngen?")

	MsgBox($MB_SYSTEMMODAL, "Information", "Undo aktivieren: " & _GUICtrlEdit_CanUndo($hEdit))

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

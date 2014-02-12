#include <GuiEdit.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hEdit

	; Erstellt eine GUI
	GUICreate("Edit: Setzt das Undo-Flag zur&uuml;ck", 400, 300)
	$hEdit = GUICtrlCreateEdit("Dies ist ein Test" & @CRLF & "Eine andere Zeile", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	_GUICtrlEdit_AppendText($hEdit, @CRLF & "An das Ende anh&auml;ngen?")

	MsgBox($MB_SYSTEMMODAL, "Information", "R&uuml;ckg&auml;ngig m&ouml;glich?: " & _GUICtrlEdit_CanUndo($hEdit))

	_GUICtrlEdit_EmptyUndoBuffer($hEdit)

	MsgBox($MB_SYSTEMMODAL, "Information", "R&uuml;ckg&auml;ngig m&ouml;glich?: " & _GUICtrlEdit_CanUndo($hEdit))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

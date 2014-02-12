#include <GuiEdit.au3>
#include <GuiConstantsEx.au3>

$Debug_Ed = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Edit-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hEdit

	; Erstellt eine GUI
	GUICreate("Edit: Setzt das Undo-Flag zur&uuml;ck", 400, 300)
	$hEdit = GUICtrlCreateEdit("Dies ist ein Test" & @CRLF & "Eine andere Zeile", 2, 2, 394, 268)
	GUISetState()

	_GUICtrlEdit_AppendText($hEdit, @CRLF & "An das Ende anh&auml;ngen?")

	MsgBox(4160, "Information", "R&uuml;ckg&auml;ngig m&ouml;glich?: " & _GUICtrlEdit_CanUndo($hEdit))

	_GUICtrlEdit_EmptyUndoBuffer($hEdit)

	MsgBox(4160, "Information", "R&uuml;ckg&auml;ngig m&ouml;glich?: " & _GUICtrlEdit_CanUndo($hEdit))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

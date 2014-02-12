#include <GuiEdit.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGUI, $hEdit

	; Erstellt eine GUI
	$hGUI = GUICreate("Edit: l&ouml;schen", 400, 300)
	$hEdit = _GUICtrlEdit_Create($hGUI, "Dies ist ein Test" & @CRLF & "eine andere Zeile", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	_GUICtrlEdit_AppendText($hEdit, @CRLF & "An das Ende anh&auml;ngen?")

	MsgBox($MB_SYSTEMMODAL, "Information", "Das Edit-Control wird gel&ouml;scht")
	_GUICtrlEdit_Destroy($hEdit)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

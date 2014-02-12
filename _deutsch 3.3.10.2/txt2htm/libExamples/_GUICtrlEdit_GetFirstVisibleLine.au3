#include <GuiEdit.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hEdit

	; Erstellt eine GUI
	GUICreate("Edit: Ermittelt die erste sichtbare Zeile", 400, 300)
	$hEdit = GUICtrlCreateEdit("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	For $x = 0 To 20
		_GUICtrlEdit_AppendText($hEdit, StringFormat("[%02d] An das Ende anh&auml;ngen?", $x) & @CRLF)
	Next

	MsgBox($MB_SYSTEMMODAL, "Information", "Erste sichtbare Zeile: " & _GUICtrlEdit_GetFirstVisibleLine($hEdit))

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

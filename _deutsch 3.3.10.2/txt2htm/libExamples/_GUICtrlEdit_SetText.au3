#include <GuiEdit.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hEdit

	; Erstellt eine GUI
	GUICreate("Edit: Text setzen", 400, 300)
	$hEdit = GUICtrlCreateEdit("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Setzt den Text
	_GUICtrlEdit_SetText($hEdit, "Dies ist ein Test" & @CRLF & "Eine andere Zeile" & @CRLF & "An das Ende anh&auml;ngen?")

	; Ermittelt den Text
	MsgBox($MB_SYSTEMMODAL, "Information", _GUICtrlEdit_GetText($hEdit))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

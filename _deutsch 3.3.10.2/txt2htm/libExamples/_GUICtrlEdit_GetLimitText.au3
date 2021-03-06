#include <GuiEdit.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hEdit

	; Erstellt eine GUI
	GUICreate("Edit: Ermittelt das aktuelle Textlimit", 400, 300)
	$hEdit = GUICtrlCreateEdit("Dies ist ein Test" & @CRLF & "Eine andere Zeile", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	MsgBox($MB_SYSTEMMODAL, "Information", "Textlimit: " & _GUICtrlEdit_GetLimitText($hEdit))

	MsgBox($MB_SYSTEMMODAL, "Information", "Setzt das Textlimit")
	_GUICtrlEdit_SetLimitText($hEdit, 64000)

	MsgBox($MB_SYSTEMMODAL, "Information", "Textlimit: " & _GUICtrlEdit_GetLimitText($hEdit))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

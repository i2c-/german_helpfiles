#include <GUIConstantsEx.au3>
#include <GuiButton.au3>
#include <WindowsConstants.au3>

Global $iMemo

Example()

Func Example()
	Local $rdo1, $rdo2, $chk1, $chk2

	GUICreate("Buttons", 600, 300)
	$iMemo = GUICtrlCreateEdit("", 99, 10, 496, 274, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")

	$rdo1 = GUICtrlCreateRadio("Radiobutton 1", 5, 13, 90, 50)

	$rdo2 = GUICtrlCreateRadio("Radiobutton 2", 5, 58, 90, 50)
	_GUICtrlButton_SetCheck($rdo2)
	_GUICtrlButton_SetFocus($rdo2) ; Hier wird der Fokus auf den 2. Radiobutton gesetzt, um zu zeigen, dass das keine Auswirkungen auf _GUICtrlButton_GetCheck hat.

	$chk1 = GUICtrlCreateCheckbox("Checkbox 1", 5, 103, 90, 50, BitOR($BS_AUTO3STATE, $BS_NOTIFY))
	_GUICtrlButton_SetCheck($chk1, $BST_UNCHECKED)
	$chk2 = GUICtrlCreateCheckbox("Checkbox 2", 5, 148, 90, 50, BitOR($BS_AUTO3STATE, $BS_NOTIFY))
	_GUICtrlButton_SetCheck($chk2, $BST_INDETERMINATE)

	GUISetState(@SW_SHOW)

	MemoWrite(@CRLF) ; Zeilenumbruch einf&uuml;gen
	MemoWrite("Variable $rdo1 wurde gepr&uuml;ft." & @CRLF & " Zustand: " & _ExplainCheckState(_GUICtrlButton_GetCheck($rdo1)) & @CRLF)
	MemoWrite("Variable $rdo2 wurde gepr&uuml;ft." & @CRLF & " Zustand: " & _ExplainCheckState(_GUICtrlButton_GetCheck($rdo2)) & @CRLF)
	MemoWrite("Variable $chk1 wurde gepr&uuml;ft." & @CRLF & " Zustand: " & _ExplainCheckState(_GUICtrlButton_GetCheck($chk1)) & @CRLF)
	MemoWrite("Variable $chk2 wurde gepr&uuml;ft." & @CRLF & " Zustand: " & _ExplainCheckState(_GUICtrlButton_GetCheck($chk2)) & @CRLF)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	Exit
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

Func _ExplainCheckState($iState)
	Switch $iState
		Case $BST_CHECKED
			Return "Button ist gesetzt."
		Case $BST_INDETERMINATE
			Return "Button ist ausgegraut und zeigt damit an, dass sein" & @CRLF & "          Zustand unbestimmt ist (gilt nur, wenn der Button im" & @CRLF & "          Stil $BS_3STATE oder $BS_AUTO3STATE erstellt wurde)."
		Case $BST_UNCHECKED
			Return "Button ist nicht gesetzt"
	EndSwitch
EndFunc   ;==>_ExplainCheckState

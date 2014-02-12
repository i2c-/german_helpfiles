#include <GUIConstantsEx.au3>
#include <GuiButton.au3>
#include <WindowsConstants.au3>

Global $iMemo

_Main()

Func _Main()
	Local $rdo, $rdo2, $chk

	GUICreate("Buttons", 400, 400)
	$iMemo = GUICtrlCreateEdit("", 119, 10, 276, 374, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")

	$rdo = GUICtrlCreateRadio("Radio1", 10, 10, 90, 50)
	_GUICtrlButton_SetFocus($rdo)

	$rdo2 = GUICtrlCreateRadio("Radio2", 10, 60, 90, 50)
	_GUICtrlButton_SetCheck($rdo2)

	$chk = GUICtrlCreateCheckbox("Check1", 10, 120, 90, 50, BitOR($BS_AUTO3STATE, $BS_NOTIFY))
	_GUICtrlButton_SetCheck($chk, $BST_INDETERMINATE)

	GUISetState()

	MemoWrite(StringFormat("$rdo Fokus Status.: %s", _GUICtrlButton_GetFocus($rdo)))
	MemoWrite(StringFormat("$rdo2 Fokus Status: %s", _GUICtrlButton_GetFocus($rdo2)))
	MemoWrite(StringFormat("$chk Fokus Status.: %s", _GUICtrlButton_GetFocus($chk)))


	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	Exit
EndFunc   ;==>_Main

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

Func _ExplainCheckState($iState)
	Switch $iState
		Case $BST_CHECKED
			Return "Button ist gew&auml;hlt."
		Case $BST_INDETERMINATE
			Return "Button ist ausgegraut und zeigt damit an, dass sein" & @CRLF & "          Zustand unbestimmt ist (gilt nur, wenn der Button im" & @CRLF & "          Stil $BS_3STATE oder $BS_AUTO3STATE erstellt wurde)."
		Case $BST_UNCHECKED
			Return "Button ist nicht gew&auml;hlt"
	EndSwitch
EndFunc   ;==>_ExplainCheckState

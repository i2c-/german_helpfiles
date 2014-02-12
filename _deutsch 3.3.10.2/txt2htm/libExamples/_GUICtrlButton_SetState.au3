#include <GUIConstantsEx.au3>
#include <GuiButton.au3>
#include <WindowsConstants.au3>

Global $iMemo

Example()

Func Example()
	Local $rdo, $rdo2, $chk, $chk2, $chk3, $btn, $btn2

	GUICreate("Buttons", 800, 400)
	$iMemo = GUICtrlCreateEdit("", 119, 10, 676, 374, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")

	$btn = GUICtrlCreateButton("Button 1", 10, 10, 90, 25)
	_GUICtrlButton_SetState($btn)

	$btn2 = GUICtrlCreateButton("Button 2", 10, 60, 90, 25)

	$rdo = GUICtrlCreateRadio("Radio 1", 10, 110, 90, 25)
	_GUICtrlButton_SetFocus($rdo)

	$rdo2 = GUICtrlCreateRadio("Radio 2", 10, 150, 90, 25)
	_GUICtrlButton_SetCheck($rdo2)

	$chk = GUICtrlCreateCheckbox("Check 1", 10, 195, 90, 25, BitOR($BS_AUTO3STATE, $BS_NOTIFY))
	_GUICtrlButton_SetCheck($chk, $BST_INDETERMINATE)

	$chk2 = GUICtrlCreateCheckbox("Check 2", 10, 240, 90, 25, BitOR($BS_AUTO3STATE, $BS_NOTIFY))

	$chk3 = GUICtrlCreateCheckbox("Check 3", 10, 285, 90, 25, BitOR($BS_AUTO3STATE, $BS_NOTIFY))
	_GUICtrlButton_SetCheck($chk3, $BST_CHECKED)

	GUISetState(@SW_SHOW)

	MemoWrite("Button 1 Status:" & _
			_ExplainState(_GUICtrlButton_GetState($btn), True) & "--------------------------------")
	MemoWrite("Button 2 Status:" & _
			_ExplainState(_GUICtrlButton_GetState($btn2), True) & "--------------------------------")
	MemoWrite("Radio 1 Status: " & _
			_ExplainState(_GUICtrlButton_GetState($rdo)) & "--------------------------------")
	MemoWrite("Radio 2 Status: " & _
			_ExplainState(_GUICtrlButton_GetState($rdo2)) & "--------------------------------")
	MemoWrite("Check 1 Status: " & _
			_ExplainState(_GUICtrlButton_GetState($chk)) & "--------------------------------")
	MemoWrite("Check 2 Status: " & _
			_ExplainState(_GUICtrlButton_GetState($chk2)) & "--------------------------------")
	MemoWrite("Check 3 Status: " & _
			_ExplainState(_GUICtrlButton_GetState($chk3)) & "--------------------------------")

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

Func _ExplainState($iState, $fPushButton = False)
	Local $sText = ""
	If Not $fPushButton And Not $iState Then Return _
			@CRLF & "Der Button ist nicht markiert (gleiches Ergebnis wie R&uuml;ckgabewert 0)." & @CRLF
	If BitAND($iState, $BST_CHECKED) = $BST_CHECKED Then _
			$sText &= @CRLF & "Der Button ist markiert." & @CRLF
	If BitAND($iState, $BST_FOCUS) = $BST_FOCUS Then _
			$sText &= @CRLF & "Der Button ist fokussiert (ein Wert >< 0 besagt, dass der Button den Eingabefokus hat)." & @CRLF
	If BitAND($iState, $BST_INDETERMINATE) = $BST_INDETERMINATE Then _
			$sText &= @CRLF & "Der Button ist ausgegraut, weil der Status des Buttons unbestimmt ist." & @CRLF
	If $fPushButton Then
		If BitAND($iState, $BST_PUSHED) = $BST_PUSHED Then
			$sText &= @CRLF & "Der Button ist ausgew&auml;hlt." & @CRLF
		Else
			$sText &= @CRLF & "Der Button ist nicht ausgew&auml;hlt." & @CRLF
		EndIf
	EndIf
	Return $sText
EndFunc   ;==>_ExplainState

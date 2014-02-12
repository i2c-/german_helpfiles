#include <GUIConstantsEx.au3>
#include <GuiButton.au3>
#include <WindowsConstants.au3>

Global $iMemo

_Main()

Func _Main()
	Local $hGUI, $btn, $rdo, $chk

	$hGUI = GUICreate("Buttons", 400, 400)
	$iMemo = GUICtrlCreateEdit("", 119, 10, 276, 374, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")

	$btn = _GUICtrlButton_Create($hGUI, "Button 1", 10, 10, 90, 50)

	$rdo = _GUICtrlButton_Create($hGUI, "Radio 1", 10, 60, 90, 50, BitOR($BS_AUTORADIOBUTTON, $BS_NOTIFY))

	$chk = _GUICtrlButton_Create($hGUI, "Check 1", 10, 120, 90, 50, BitOR($BS_AUTO3STATE, $BS_NOTIFY))

	GUISetState()

	MemoWrite("$btn Handle: " & $btn)
	MemoWrite("$rdo Handle: " & $rdo)
	MemoWrite("$chk Handle: " & $chk & @CRLF)

	MsgBox(4096, "Information", "Dar&uuml;ber, wie Buttons zerst&ouml;rt werden")

	Send("^{END}")

	MemoWrite("Zerst&ouml;rt $btn: " & _GUICtrlButton_Destroy($btn))
	MemoWrite("Zerst&ouml;rt $rdo: " & _GUICtrlButton_Destroy($rdo))
	MemoWrite("Zerst&ouml;rt $chk: " & _GUICtrlButton_Destroy($chk) & @CRLF)

	MemoWrite("$btn Handle: " & $btn)
	MemoWrite("$rdo Handle: " & $rdo)
	MemoWrite("$chk Handle: " & $chk & @CRLF)

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

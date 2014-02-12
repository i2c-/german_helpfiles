#include <GUIConstantsEx.au3>
#include <GuiButton.au3>

Global $iMemo

_Main()

Func _Main()
	Local $y = 70, $btn[6], $iRand

	GUICreate("Buttons", 510, 400)
	$iMemo = GUICtrlCreateEdit("", 119, 10, 276, 374, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	$btn[0] = GUICtrlCreateButton("Button 1", 10, 10, 90, 50)

	For $x = 1 To 5
		$btn[$x] = GUICtrlCreateButton("Button " & $x + 1, 10, $y, 90, 50)
		$y += 60
	Next

	$iRand = Random(0, 5, 1)
	MsgBox(4096, "Information", "Setzt den Text von Button " & $iRand + 1)
	_GUICtrlButton_SetText($btn[$iRand], "Neuer Text " & $iRand + 1)

	For $x = 0 To 5
		MemoWrite("$btn[" & $x & "] Text: " & _GUICtrlButton_GetText($btn[$x]))
	Next

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

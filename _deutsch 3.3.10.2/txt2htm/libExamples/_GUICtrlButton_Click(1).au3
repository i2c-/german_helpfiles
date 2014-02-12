#include <GUIConstantsEx.au3>
#include <GuiButton.au3>

Global $btn[6], $iMemo, $iRand

HotKeySet("!b", "Clickit")

Example()

Func Example()
	Local $y = 70

	GUICreate("Buttons", 610, 400)
	$iMemo = GUICtrlCreateEdit("", 119, 10, 476, 374, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")

	MemoWrite("Dr&uuml;cke Alt+b, um einen zuf&auml;llig ausgew&auml;hlten Button zu dr&uuml;cken.")

	$btn[0] = GUICtrlCreateButton("Button1", 10, 10, 100, 50)

	For $x = 1 To 5
		$btn[$x] = GUICtrlCreateButton("Button" & $x + 1, 10, $y, 100, 50)
		$y += 60
	Next

	$iRand = Random(0, 5, 1)
	_GUICtrlButton_SetText($btn[$iRand], "Neuer Text " & $iRand + 1)

	GUISetState(@SW_SHOW)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $btn[$iRand]
				MemoWrite(_GUICtrlButton_GetText($btn[$iRand]) & " angeklickt")
		EndSwitch
	WEnd

	Exit
EndFunc   ;==>Example

Func Clickit()
	$iRand = Random(0, 5, 1)
	_GUICtrlButton_Click($btn[$iRand])
EndFunc   ;==>Clickit

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

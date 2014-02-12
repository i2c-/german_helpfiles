#include <GuiButton.au3>
#include <GUIConstantsEx.au3>
#include <GuiMenu.au3>
#include <WindowsConstants.au3>

Global $iMemo

; Es ist zu beachten, dass die Control-ID dieses Buttons NICHT mit GuiCtrlRead gelesen werden kann!
; Der Button erscheint nur unter Windows Vista!

Example()

Func Example()
	Local $hButton, $hGUI

	$hGUI = GUICreate("Buttons", 400, 400)
	$iMemo = GUICtrlCreateEdit("", 10, 75, 390, 315, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")

	$hButton = _GUICtrlButton_Create($hGUI, "Button 1", 10, 10, 210, 45, BitOR($BS_COMMANDLINK, $BS_DEFPUSHBUTTON, $BS_PUSHLIKE))
	_GUICtrlButton_SetNote($hButton, "Dies ist ein Test unter Vista!")

	GUISetState(@SW_SHOW)

	MemoWrite("Notiz: " & _GUICtrlButton_GetNote($hButton))
	MemoWrite("L&auml;nge der Notiz: " & _GUICtrlButton_GetNoteLength($hButton) & " Zeichen")
	MemoWrite("Buttontext: " & _GUICtrlButton_GetText($hButton))

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

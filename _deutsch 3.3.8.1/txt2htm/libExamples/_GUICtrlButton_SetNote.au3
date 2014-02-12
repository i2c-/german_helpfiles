#include <GUIConstantsEx.au3>
#include <GuiButton.au3>
#include <WindowsConstants.au3>
#include <GuiMenu.au3>

Global $btn, $iMemo

; Es ist zu beachten, dass die Control-ID dieses Buttons NICHT mit GuiCtrlRead gelesen werden kann!
; Der Button erscheint nur unter Windows Vista!

_Main()

Func _Main()
	Local $hGUI

	$hGUI = GUICreate("Buttons", 400, 400)
	$iMemo = GUICtrlCreateEdit("", 10, 65, 390, 325, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")

	$btn = _GUICtrlButton_Create($hGUI, "Button 1", 10, 10, 210, 45, BitOR($BS_COMMANDLINK, $BS_DEFPUSHBUTTON, $BS_PUSHLIKE))
	_GUICtrlButton_SetNote($btn, "Dies ist ein Test unter Vista!")

	GUISetState()

	MemoWrite("Notiz: " & _GUICtrlButton_GetNote($btn))
	MemoWrite("L&auml;nge der Notiz: " & _GUICtrlButton_GetNoteLength($btn) & " Zeichen")
	MemoWrite("Buttontext: " & _GUICtrlButton_GetText($btn))

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

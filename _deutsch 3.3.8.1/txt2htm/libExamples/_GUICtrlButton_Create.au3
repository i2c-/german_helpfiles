#include <GuiButton.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <ButtonConstants.au3>

Global $btn, $rdo, $chk, $iMemo

; Es ist zu beachten, dass die Control-ID dieses Buttons NICHT mit GuiCtrlRead gelesen werden kann!

_Main()

Func _Main()
	Local $hGUI

	$hGUI = GUICreate("Buttons", 400, 400)
	$iMemo = GUICtrlCreateEdit("", 119, 10, 276, 374, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")

	$btn = _GUICtrlButton_Create($hGUI, "Button1", 10, 10, 90, 50)

	$rdo = _GUICtrlButton_Create($hGUI, "Radio1", 10, 60, 90, 50, $BS_AUTORADIOBUTTON)

	$chk = _GUICtrlButton_Create($hGUI, "Check1", 10, 120, 90, 50, $BS_AUTO3STATE)

	GUIRegisterMsg($WM_COMMAND, "WM_COMMAND")
	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	GUISetState()

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

Func WM_NOTIFY($hWnd, $Msg, $wParam, $lParam)
	#forceref $hWnd, $Msg, $wParam
	Local Const $BCN_HOTITEMCHANGE = -1249
	Local $tNMBHOTITEM = DllStructCreate("hwnd hWndFrom;int IDFrom;int Code;dword dwFlags", $lParam)
	Local $nNotifyCode = DllStructGetData($tNMBHOTITEM, "Code")
	Local $nID = DllStructGetData($tNMBHOTITEM, "IDFrom")
	Local $hCtrl = DllStructGetData($tNMBHOTITEM, "hWndFrom")
	Local $dwFlags = DllStructGetData($tNMBHOTITEM, "dwFlags")
	Local $sText = ""

	Switch $nNotifyCode
		Case $BCN_HOTITEMCHANGE ; Windows XP und h&ouml;her
			If BitAND($dwFlags, 0x10) = 0x10 Then
				$sText = "$BCN_HOTITEMCHANGE - beim Ankommen: " & @CRLF

			ElseIf BitAND($dwFlags, 0x20) = 0x20 Then
				$sText = "$BCN_HOTITEMCHANGE - beim Verlassen: " & @CRLF
			EndIf
			MemoWrite($sText & _
					"-----------------------------" & @CRLF & _
					"WM_NOTIFY - Infos:" & @CRLF & _
					"-----------------------------" & @CRLF & _
					"Code" & @TAB & ":" & $nNotifyCode & @CRLF & _
					"CtrlID" & @TAB & ":" & $nID & @CRLF & _
					"CtrlHWnd:" & $hCtrl & @CRLF & _
					_GUICtrlButton_GetText($hCtrl) & @CRLF)
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY

; Reaktion auf einen Button-Klick
Func WM_COMMAND($hWnd, $Msg, $wParam, $lParam)
	#forceref $hWnd, $Msg
	Local $nNotifyCode = BitShift($wParam, 16)
	Local $nID = BitAND($wParam, 0x0000FFFF)
	Local $hCtrl = $lParam
	Local $sText = ""

	Switch $hCtrl
		Case $btn, $rdo, $chk
			Switch $nNotifyCode
				Case $BN_CLICKED
					$sText = "$BN_CLICKED" & @CRLF
				Case $BN_PAINT
					$sText = "$BN_PAINT" & @CRLF
				Case $BN_PUSHED, $BN_HILITE
					$sText = "$BN_PUSHED, $BN_HILITE" & @CRLF
				Case $BN_UNPUSHED, $BN_UNHILITE
					$sText = "$BN_UNPUSHED" & @CRLF
				Case $BN_DISABLE
					$sText = "$BN_DISABLE" & @CRLF
				Case $BN_DBLCLK, $BN_DOUBLECLICKED
					$sText = "$BN_DBLCLK, $BN_DOUBLECLICKED" & @CRLF
				Case $BN_SETFOCUS
					$sText = "$BN_SETFOCUS" & @CRLF
				Case $BN_KILLFOCUS
					$sText = "$BN_KILLFOCUS" & @CRLF
			EndSwitch
			MemoWrite($sText & _
					"-----------------------------" & @CRLF & _
					"WM_COMMAND - Infos:" & @CRLF & _
					"-----------------------------" & @CRLF & _
					"Code" & @TAB & ":" & $nNotifyCode & @CRLF & _
					"CtrlID" & @TAB & ":" & $nID & @CRLF & _
					"CtrlHWnd:" & $hCtrl & @CRLF & _
					_GUICtrlButton_GetText($hCtrl) & @CRLF)
			Return 0 ; Nur bei Klick auf den Button
	EndSwitch
	; Setzt die Standardverarbeitung der Autoit3-internen Nachrichtenkommandos fort.
	; Man kann die Zeile auch weglassen.
	; !!! Aber nur 'Return' (ohne jegliche Variable) wird die Verarbeitung der Standardnachrichten unterbinden !!!
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_COMMAND

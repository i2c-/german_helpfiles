#include <WinAPI.au3>
#include <WindowsConstants.au3>
#include <StructureConstants.au3>
#include <MsgBoxConstants.au3>

Global $hHook, $hStub_KeyProc, $buffer = ""

Example()

Func Example()
	OnAutoItExitRegister("Cleanup")

	Local $hmod

	$hStub_KeyProc = DllCallbackRegister("_KeyProc", "long", "int;wparam;lparam")
	$hmod = _WinAPI_GetModuleHandle(0)
	$hHook = _WinAPI_SetWindowsHookEx($WH_KEYBOARD_LL, DllCallbackGetPtr($hStub_KeyProc), $hmod)

	MsgBox($MB_SYSTEMMODAL, "", "Klicke OK, dann gib im Editor (Notepad) ein:" & _
			@CRLF & @CRLF & "Jon" & @CRLF & "AutoIt" & @CRLF & @CRLF & "Dr&uuml;cke ESC zum Beenden des Skripts." & @CRLF & "(Das Editorfenster darfst du selber schlie&szlig;en!)")

	Run("notepad.exe")
	WinWait("[CLASS:Notepad]")
	WinActivate("[CLASS:Notepad]")

	While 1
		Sleep(10)
	WEnd
EndFunc   ;==>Example

Func EvaluateKey($keycode)
	If (($keycode > 64) And ($keycode < 91)) _ ; A - z
			Or (($keycode > 96) And ($keycode < 123)) _ ; A - Z
			Or (($keycode > 47) And ($keycode < 58)) Then ; 0 - 9
		$buffer &= Chr($keycode)
		Switch $buffer
			Case "Jon"
				ToolTip("Was w&uuml;rdest du sagen?")
			Case "AutoIt"
				ToolTip("AutoIt ist genial!")
		EndSwitch
	ElseIf ($keycode > 159) And ($keycode < 164) Then
		Return
	ElseIf ($keycode = 27) Then ; ESC-Taste
		Exit
	Else
		$buffer = ""
	EndIf
EndFunc   ;==>EvaluateKey

;===========================================================
; Callback-Funktion
;===========================================================
Func _KeyProc($nCode, $wParam, $lParam)
	Local $tKEYHOOKS
	$tKEYHOOKS = DllStructCreate($tagKBDLLHOOKSTRUCT, $lParam)
	If $nCode < 0 Then
		Return _WinAPI_CallNextHookEx($hHook, $nCode, $wParam, $lParam)
	EndIf
	If $wParam = $WM_KEYDOWN Then
		EvaluateKey(DllStructGetData($tKEYHOOKS, "vkCode"))
	Else
		Local $flags = DllStructGetData($tKEYHOOKS, "flags")
		Switch $flags
			Case $LLKHF_ALTDOWN
				ConsoleWrite("$LLKHF_ALTDOWN" & @CRLF)
			Case $LLKHF_EXTENDED
				ConsoleWrite("$LLKHF_EXTENDED" & @CRLF)
			Case $LLKHF_INJECTED
				ConsoleWrite("$LLKHF_INJECTED" & @CRLF)
			Case $LLKHF_UP
				ConsoleWrite("$LLKHF_UP: Tastencode (scanCode) - " & DllStructGetData($tKEYHOOKS, "scanCode") & @TAB & " Virtueller Tastencode (vkCode) - " & DllStructGetData($tKEYHOOKS, "vkCode") & @CRLF)
		EndSwitch
	EndIf
	Return _WinAPI_CallNextHookEx($hHook, $nCode, $wParam, $lParam)
EndFunc   ;==>_KeyProc

Func Cleanup()
	_WinAPI_UnhookWindowsHookEx($hHook)
	DllCallbackFree($hStub_KeyProc)
EndFunc   ;==>Cleanup

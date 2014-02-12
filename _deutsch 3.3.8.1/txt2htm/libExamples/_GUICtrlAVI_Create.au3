#include <GuiConstantsEx.au3>
#include <GuiAVI.au3>
#include <WindowsConstants.au3>

$Debug_AVI = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die AVI-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $hAVI

_Beispiel1()
_Beispiel2()

Func _Beispiel1()
	Local $Wow64 = ""
	If @AutoItX64 Then $Wow64 = "\Wow6432Node"
	Local $hGUI, $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $Wow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\Examples\GUI\SampleAVI.avi"

	; Erstellt eine GUI
	$hGUI = GUICreate("AVI: Erstellen (Extern 1)", 300, 100)
	$hAVI = _GUICtrlAVI_Create($hGUI, $sFile, -1, 10, 10)
	GUISetState()

	GUIRegisterMsg($WM_COMMAND, "WM_COMMAND")

	; Spielt das AutoIt Beispiel-AVI ab
	_GUICtrlAVI_Play($hAVI)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Schlie&szlig;t AVI-Clip und GUI
	_GUICtrlAVI_Close($hAVI)
	GUIDelete()
EndFunc   ;==>_Beispiel1

Func _Beispiel2()
	Local $hGUI

	; Erstellt eine GUI
	$hGUI = GUICreate("AVI: Erstellen (Extern 2)", 300, 100)
	$hAVI = _GUICtrlAVI_Create($hGUI, @SystemDir & "\Shell32.dll", 150, 10, 10)
	GUISetState()

	GUIRegisterMsg($WM_COMMAND, "WM_COMMAND")

	; Spielt das AutoIt Beispiel-AVI ab
	_GUICtrlAVI_Play($hAVI)

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Schlie&szlig;t AVI-Clip und GUI
	_GUICtrlAVI_Close($hAVI)
	GUIDelete()
EndFunc   ;==>_Beispiel2

Func WM_COMMAND($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg
	Local $hWndFrom, $iIDFrom, $iCode
	$hWndFrom = $ilParam
	$iIDFrom = BitAND($iwParam, 0xFFFF) ; Low Word
	$iCode = BitShift($iwParam, 16) ; Hi Word
	Switch $hWndFrom
		Case $hAVI
			Switch $iCode
				Case $ACN_START ; Benachrichtigt das Parent-Fenster eines AnimationsControls, dass der verkn&uuml;pfte AVI-Clip gestartet wurde
					_DebugPrint("$ACN_START" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
				Case $ACN_STOP ; Benachrichtigt das Parent Fenster eines AnimationsControls, dass der verkn&uuml;pfte AVI-Clip gestoppt wurde
					_DebugPrint("$ACN_STOP" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_COMMAND

Func _DebugPrint($s_text, $line = @ScriptLineNumber)
	ConsoleWrite( _
			"!===========================================================" & @LF & _
			"+======================================================" & @LF & _
			"-->Zeile(" & StringFormat("%04d", $line) & "):" & @TAB & $s_text & @LF & _
			"+======================================================" & @LF)
EndFunc   ;==>_DebugPrint

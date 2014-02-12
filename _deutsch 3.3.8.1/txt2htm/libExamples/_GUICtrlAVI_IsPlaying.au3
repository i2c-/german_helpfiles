#include <GuiConstantsEx.au3>
#include <GuiAVI.au3>
#include <WindowsConstants.au3>

$Debug_AVI = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die AVI-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $hAVI, $iMemo

_Main()

Func _Main()
	Local $Wow64 = ""
	If @AutoItX64 Then $Wow64 = "\Wow6432Node"
	Local $hGUI, $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $Wow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\Examples\GUI\SampleAVI.avi"
	Local $btn_StartStop

	; Erstellt eine GUI
	$hGUI = GUICreate("AVI: &Ouml;ffnen (Extern)", 300, 200)
	$hAVI = _GUICtrlAVI_Create($hGUI, "", -1, 10, 10)
	$btn_StartStop = GUICtrlCreateButton("Start", 50, 10, 75, 25)
	$iMemo = GUICtrlCreateEdit("", 10, 50, 276, 144, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; Spielt das Beispiel AutoIt AVI ab
	_GUICtrlAVI_Open($hAVI, $sFile)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		Switch GUIGetMsg()
			Case $btn_StartStop
				If GUICtrlRead($btn_StartStop) = "Start" Then
					_GUICtrlAVI_Play($hAVI)
					GUICtrlSetData($btn_StartStop, "Stopp")
				Else
					_GUICtrlAVI_Stop($hAVI)
					GUICtrlSetData($btn_StartStop, "Start")
				EndIf
				MemoWrite("Es wird abgespielt: " & _GUICtrlAVI_IsPlaying($hAVI))

			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	; Schlie&szlig;t den AVI Clip
	_GUICtrlAVI_Close($hAVI)


	GUIDelete()
EndFunc   ;==>_Main

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

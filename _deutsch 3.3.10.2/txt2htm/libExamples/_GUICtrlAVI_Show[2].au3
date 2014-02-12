#include <GuiConstantsEx.au3>
#include <GuiAVI.au3>

Global $hAVI

_Beispiel_External()

Func _Beispiel_External()
	Local $hGUI, $btn_start, $btn_stop, $btn_show

	; Erstellt eine GUI
	$hGUI = GUICreate("AVI: Abspielen (Extern)", 350, 200)
	$hAVI = _GUICtrlAVI_Create($hGUI, @SystemDir & "\Shell32.dll", 160, 10, 10)
	$btn_start = GUICtrlCreateButton("Start", 25, 150, 70, 22)
	$btn_stop = GUICtrlCreateButton("Stopp", 125, 150, 70, 22)
	$btn_show = GUICtrlCreateButton("Verstecken", 225, 150, 70, 22)
	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $btn_start
				; Spielt einen Teil des AVI Clips
				_GUICtrlAVI_Play($hAVI)
			Case $btn_stop
				; Stoppt den AVI Clip
				_GUICtrlAVI_Stop($hAVI)
			Case $btn_show
				If GUICtrlRead($btn_show) = "Verstecken" Then
					_GUICtrlAVI_Show($hAVI, @SW_HIDE)
					GUICtrlSetData($btn_show, "Zeigen")
				Else
					_GUICtrlAVI_Show($hAVI, @SW_SHOW)
					GUICtrlSetData($btn_show, "Verstecken")
				EndIf
		EndSwitch
	WEnd

	; Schlie&szlig;t den AVI Clip
	_GUICtrlAVI_Close($hAVI)

	GUIDelete()
EndFunc   ;==>_Beispiel_External

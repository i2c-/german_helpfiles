#include <GuiConstantsEx.au3>
#include <GuiAVI.au3>

; verwendet die AuotIt-Funktion

Global $hAVI

_Example_Internal()

Func _Example_Internal()
	Local $btn_start, $btn_stop

	; Erstellt eine GUI
	GUICreate("AVI: Abspielen (Intern)", 300, 200)
	$hAVI = GUICtrlCreateAvi(@SystemDir & "\shell32.dll", 160, 10, 10)
	$btn_start = GUICtrlCreateButton("Start", 50, 150, 70, 22)
	$btn_stop = GUICtrlCreateButton("Stopp", 150, 150, 70, 22)
	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $btn_start
				; Spielt einen Tel des AVI Clips ab
				_GUICtrlAVI_Play($hAVI)
			Case $btn_stop
				; Stoppt den AVI Clip
				_GUICtrlAVI_Stop($hAVI)
		EndSwitch
	WEnd

	; Schlie&szlig;t den AVI Clip
	_GUICtrlAVI_Close($hAVI)

	GUIDelete()
EndFunc   ;==>_Example_Internal

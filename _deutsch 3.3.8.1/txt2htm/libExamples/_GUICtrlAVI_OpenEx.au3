#include <GuiConstantsEx.au3>
#include <GuiAVI.au3>

$Debug_AVI = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die AVI-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $hAVI

_Main()

Func _Main()
	Local $hGUI

	; Erstellt eine GUI
	$hGUI = GUICreate("AVI: &Ouml;ffnen (Extern)", 300, 100)
	$hAVI = _GUICtrlAVI_Create($hGUI, "", -1, 10, 10)
	GUISetState()

	; Spielt das Beispiel AutoIt AVI ab
	_GUICtrlAVI_OpenEx($hAVI, @SystemDir & "\Shell32.dll", 150)

	; Spielt das Beispiel AutoIt AVI ab
	_GUICtrlAVI_Play($hAVI)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Schlie&szlig;t den AVI Clip
	_GUICtrlAVI_Close($hAVI)


	GUIDelete()
EndFunc   ;==>_Main

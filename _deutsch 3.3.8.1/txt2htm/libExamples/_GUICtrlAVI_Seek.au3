#include <GuiConstantsEx.au3>
#include <GuiAVI.au3>

$Debug_AVI = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die AVI-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $hAVI

_Beispiel_Internal()
_Beispiel_External()

Func _Beispiel_Internal()
	; Erstellt eine GUI
	GUICreate("AVI: Spulen (Intern)", 300, 100)
	$hAVI = GUICtrlCreateAvi(@SystemDir & "\shell32.dll", 160, 10, 10)
	GUISetState()

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
		Sleep(100)
		; Spult zu einem Zufallsframe des AVI Clips
		_GUICtrlAVI_Seek($hAVI, Random(1, 30, 1))
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Schlie&szlig;t den AVI Clip
	_GUICtrlAVI_Close($hAVI)


	GUIDelete()
EndFunc   ;==>_Beispiel_Internal

Func _Beispiel_External()
	Local $hGUI

	; Erstellt eine GUI
	$hGUI = GUICreate("AVI: Spulen (Extern)", 300, 100)
	$hAVI = _GUICtrlAVI_Create($hGUI, @SystemDir & "\Shell32.dll", 160, 10, 10)
	GUISetState()

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
		Sleep(100)
		; Spult zu einem Zufallsframe des AVI Clips
		_GUICtrlAVI_Seek($hAVI, Random(1, 30, 1))
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Schlie&szlig;t den AVI Clip
	_GUICtrlAVI_Close($hAVI)


	GUIDelete()
EndFunc   ;==>_Beispiel_External

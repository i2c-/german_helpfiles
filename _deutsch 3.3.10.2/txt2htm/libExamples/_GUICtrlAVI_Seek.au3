#include <GuiConstantsEx.au3>
#include <GuiAVI.au3>

; verwendet die AutoIt-Funktion

Global $hAVI

_Example_Internal()

Func _Example_Internal()
	; Erstellt eine GUI
	GUICreate("AVI: Spulen (Intern)", 300, 100)
	$hAVI = GUICtrlCreateAvi(@SystemDir & "\shell32.dll", 160, 10, 10)
	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
		Sleep(100)
		; Spult zu einem Zufallsframe des AVI Clips
		_GUICtrlAVI_Seek($hAVI, Random(1, 30, 1))
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Schlie&szlig;t den AVI Clip
	_GUICtrlAVI_Close($hAVI)

	GUIDelete()
EndFunc   ;==>_Example_Internal

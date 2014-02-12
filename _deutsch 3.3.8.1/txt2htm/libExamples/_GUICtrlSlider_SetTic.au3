#include <GuiConstantsEx.au3>
#include <GuiSlider.au3>

$Debug_S = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Slider-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $iTic = Random(0, 100, 1), $hSlider

	; Erstellt eine GUI
	GUICreate("Slider: Setzt die logische Position des Skalenstriches", 500, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState()

	; Setzt die logische Position des Skalenstriches
	_GUICtrlSlider_SetTic($hSlider, $iTic)

	; Ermittelt die logische Position des Skalenstriches
	MsgBox(4160, "Information", "Logische Position des Skalenstriches: " & _GUICtrlSlider_GetTic($hSlider, $iTic))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

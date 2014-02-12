#include <GuiConstantsEx.au3>
#include <GuiSlider.au3>

$Debug_S = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Slider-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $aSel, $hSlider

	; Erstellt eine GUI
	GUICreate("Slider: Setzt die Start- und Endposition", 400, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState()

	; Setzt die Start- und Endposition
	_GUICtrlSlider_SetSel($hSlider, 10, 50)

	; Ermittelt die Start- und Endposition
	$aSel = _GUICtrlSlider_GetSel($hSlider)
	MsgBox(4160, "Information", StringFormat("Start- und Endposition: %d - %d", $aSel[0], $aSel[1]))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

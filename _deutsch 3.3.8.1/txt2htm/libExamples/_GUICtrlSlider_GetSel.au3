#include <GuiConstantsEx.au3>
#include <GuiSlider.au3>

$Debug_S = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Slider-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $aSel, $hSlider

	; Erstellt eine GUI
	GUICreate("Slider: Ermittelt Anfang und Ende des aktuell markierten Bereichs", 590, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 486, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState()

	; Setzt die Start- und Endposition des aktuellen markierten Bereichs
	_GUICtrlSlider_SetSel($hSlider, 10, 50)

	; Ermittelt die Start- und Endposition des aktuellen markierten Bereichs
	$aSel = _GUICtrlSlider_GetSel($hSlider)
	MsgBox(8256, "Information", StringFormat("Markierung: %d - %d", $aSel[0], $aSel[1]))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

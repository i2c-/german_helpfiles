#include <GuiConstantsEx.au3>
#include <GuiSlider.au3>

$Debug_S = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Slider-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hSlider

	; Erstellt eine GUI
	GUICreate("Slider: Ermittelt die logische Startposition des aktuell markierten Bereiches", 600, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState()

	; Setzt die logische Startposition des aktuell markierten Bereiches
	_GUICtrlSlider_SetSelStart($hSlider, 10)

	; Ermittelt die logische Startposition des aktuell markierten Bereiches
	MsgBox(4160, "Information", "logische Startposition des aktuell markierten Bereiches: " & _GUICtrlSlider_GetSelStart($hSlider))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

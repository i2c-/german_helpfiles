#include <GuiConstantsEx.au3>
#include <GuiSlider.au3>

$Debug_S = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Slider-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hSlider

	; Erstellt eine GUI
	GUICreate("Slider: Ermittelt die Endposition", 400, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState()

	; Setzt die Endposition
	_GUICtrlSlider_SetSelEnd($hSlider, 50)

	; Ermittelt die Endposition
	MsgBox(4160, "Information", "Ermittelt die Endposition: " & _GUICtrlSlider_GetSelEnd($hSlider))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hSlider

	; Erstellt eine GUI
	GUICreate("Slider: Setzt die Skalenteilung", 400, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState(@SW_SHOW)

	; Ermittelt die Anzahl der Skalenstriche in einem Slider
	MsgBox(8256, "Information", "Skalenstriche: " & _GUICtrlSlider_GetNumTics($hSlider))

	; Setzt die Anzahl der Skalenstriche in einem Slider
	_GUICtrlSlider_SetTicFreq($hSlider, 1)

	; Ermittelt die Anzahl der Skalenstriche in einem Slider
	MsgBox(8256, "Information", "Skalenstriche: " & _GUICtrlSlider_GetNumTics($hSlider))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

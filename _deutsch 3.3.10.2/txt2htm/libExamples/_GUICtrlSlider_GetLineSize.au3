#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hSlider

	; Erstellt eine GUI
	GUICreate("Slider: Ermittelt die Anzahl von logischen Positionen in der sich der Slider bewegen l&auml;sst", 400, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState(@SW_SHOW)

	; Ermittelt die Anzahl von logischen Positionen in der sich der Slider bewegen l&auml;sst
	MsgBox($MB_SYSTEMMODAL, "Information", "Anzahl von logischen Positionen: " & _GUICtrlSlider_GetLineSize($hSlider))

	; Setzt die Anzahl von logischen Positionen in der sich der Slider bewegen l&auml;sst
	_GUICtrlSlider_SetLineSize($hSlider, 4)

	; Ermittelt die Anzahl von logischen Positionen in der sich der Slider bewegen l&auml;sst
	MsgBox($MB_SYSTEMMODAL, "Information", "Anzahl von logischen Positionen: " & _GUICtrlSlider_GetLineSize($hSlider))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

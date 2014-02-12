#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hSlider

	; Erstellt eine GUI
	GUICreate("Slider: Setzt die Anzahl von logischen Positionen", 450, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState(@SW_SHOW)

	; Ermittelt die Anzahl von logischen Positionen
	MsgBox($MB_SYSTEMMODAL, "Information", "Anzahl von logischen Positionen: " & _GUICtrlSlider_GetLineSize($hSlider))

	; Setzt die Anzahl von logischen Positionen
	_GUICtrlSlider_SetLineSize($hSlider, 4)

	; Ermittelt die Anzahl von logischen Positionen
	MsgBox($MB_SYSTEMMODAL, "Information", "Anzahl von logischen Positionen: " & _GUICtrlSlider_GetLineSize($hSlider))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

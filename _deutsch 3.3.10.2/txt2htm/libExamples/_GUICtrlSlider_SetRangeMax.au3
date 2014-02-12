#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hSlider

	; Erstellt eine GUI
	GUICreate("Slider: Setzt die maximale Position", 400, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState(@SW_SHOW)

	; Ermittelt die maximale Position
	MsgBox($MB_SYSTEMMODAL, "Information", "maximale Position: " & _GUICtrlSlider_GetRangeMax($hSlider))

	; Setzt die maximale Position
	_GUICtrlSlider_SetRangeMax($hSlider, 50)

	; Ermittelt die maximale Position
	MsgBox($MB_SYSTEMMODAL, "Information", "maximale Position: " & _GUICtrlSlider_GetRangeMax($hSlider))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

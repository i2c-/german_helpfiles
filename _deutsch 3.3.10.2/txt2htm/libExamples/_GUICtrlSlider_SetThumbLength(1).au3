#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hSlider

	; Erstellt eine GUI
	GUICreate("Slider: Setzt die L&auml;nge des Sliders", 400, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 25, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_FIXEDLENGTH))
	GUISetState(@SW_SHOW)

	; Ermittelt die L&auml;nge des Sliders
	MsgBox($MB_SYSTEMMODAL, "Information", "L&auml;nge des Sliders: " & _GUICtrlSlider_GetThumbLength($hSlider))

	; Setzt die L&auml;nge des Sliders
	_GUICtrlSlider_SetThumbLength($hSlider, 10)

	; Ermittelt die L&auml;nge des Sliders
	MsgBox($MB_SYSTEMMODAL, "Information", "L&auml;nge des Sliders: " & _GUICtrlSlider_GetThumbLength($hSlider))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

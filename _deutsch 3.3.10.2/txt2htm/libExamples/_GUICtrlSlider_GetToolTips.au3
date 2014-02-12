#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hWndTT, $hSlider

	; Erstellt eine GUI
	GUICreate("Slider: Ermittelt das Handle zum ToolTip-Control", 500, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState(@SW_SHOW)

	; Ermittelt das Handle zum ToolTip-Control
	$hWndTT = _GUICtrlSlider_GetToolTips($hSlider)
	MsgBox($MB_SYSTEMMODAL, "Information", "Handle des ToolTips: " & $hWndTT)

	; Weist dem Slider-Control ein ToolTip-Control zu
	_GUICtrlSlider_SetToolTips($hSlider, $hWndTT)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

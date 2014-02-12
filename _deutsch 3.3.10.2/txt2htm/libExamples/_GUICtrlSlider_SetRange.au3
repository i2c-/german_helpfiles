#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $aRange, $hSlider

	; Erstellt eine GUI
	GUICreate("Slider: Setzt den Bereich der minimalen und maximalen logischen Position", 600, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState(@SW_SHOW)

	; Ermittelt den Bereich der minimalen und maximalen logischen Position
	$aRange = _GUICtrlSlider_GetRange($hSlider)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Bereich: %d - %d", $aRange[0], $aRange[1]))

	; Setzt den Bereich der minimalen und maximalen logischen Position
	_GUICtrlSlider_SetRange($hSlider, 20, 50)

	; Ermittelt den Bereich der minimalen und maximalen logischen Position
	$aRange = _GUICtrlSlider_GetRange($hSlider)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Bereich: %d - %d", $aRange[0], $aRange[1]))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

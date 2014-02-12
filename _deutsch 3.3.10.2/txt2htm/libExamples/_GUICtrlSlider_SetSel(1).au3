#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $aSel, $hSlider

	; Erstellt eine GUI
	GUICreate("Slider: Setzt die Start- und Endposition", 400, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState(@SW_SHOW)

	; Setzt die Start- und Endposition
	_GUICtrlSlider_SetSel($hSlider, 10, 50)

	; Ermittelt die Start- und Endposition
	$aSel = _GUICtrlSlider_GetSel($hSlider)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Start- und Endposition: %d - %d", $aSel[0], $aSel[1]))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

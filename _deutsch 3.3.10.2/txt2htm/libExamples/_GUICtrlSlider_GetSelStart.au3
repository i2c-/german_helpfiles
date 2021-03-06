#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hSlider

	; Erstellt eine GUI
	GUICreate("Slider: Ermittelt die logische Startposition des aktuell markierten Bereiches", 600, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState(@SW_SHOW)

	; Setzt die logische Startposition des aktuell markierten Bereiches
	_GUICtrlSlider_SetSelStart($hSlider, 10)

	; Ermittelt die logische Startposition des aktuell markierten Bereiches
	MsgBox($MB_SYSTEMMODAL, "Information", "logische Startposition des aktuell markierten Bereiches: " & _GUICtrlSlider_GetSelStart($hSlider))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

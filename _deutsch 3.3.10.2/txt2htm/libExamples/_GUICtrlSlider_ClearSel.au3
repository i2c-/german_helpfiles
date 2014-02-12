#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hSlider

	; Erstellt eine GUI
	GUICreate("Slider: Gesetzten Bereich l&ouml;schen (Intern)", 400, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState(@SW_SHOW)

	; Setzt den Bereich
	_GUICtrlSlider_SetSel($hSlider, 10, 50)

	MsgBox(8192 + 64, "Information", "L&ouml;scht den gesetzten Bereich")
	; L&ouml;scht den Bereich
	_GUICtrlSlider_ClearSel($hSlider)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

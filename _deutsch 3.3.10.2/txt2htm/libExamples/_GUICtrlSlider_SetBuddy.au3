#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hInput, $hInput2, $hSlider

	; Erstellt eine GUI
	GUICreate("Slider: Setzt das Handle zu einem Buddy ", 400, 296)
	$hSlider = GUICtrlCreateSlider(95, 2, 205, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	$hInput = GUICtrlCreateInput("0", 2, 25, 90, 20)
	$hInput2 = GUICtrlCreateInput("0", 2, 25, 90, 20)
	GUISetState(@SW_SHOW)

	; Setzt das Handle zu einem Buddy (links))
	_GUICtrlSlider_SetBuddy($hSlider, True, $hInput)
	; Setzt das Handle zu einem Buddy (rechts)
	_GUICtrlSlider_SetBuddy($hSlider, False, $hInput2)

	; Ermittelt das Handle zu einem Buddy (links))
	MsgBox($MB_SYSTEMMODAL, "Information", "Buddy Handle: " & _GUICtrlSlider_GetBuddy($hSlider, True))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

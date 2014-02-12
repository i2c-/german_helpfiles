#include <GuiConstantsEx.au3>
#include <GuiSlider.au3>

$Debug_S = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Slider-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hInput, $hInput2, $hSlider

	; Erstellt eine GUI
	GUICreate("Slider: Ermittelt das Handle zu einem Buddy ", 400, 296)
	$hSlider = GUICtrlCreateSlider(95, 2, 205, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	$hInput = GUICtrlCreateInput("0", 2, 25, 90, 20)
	$hInput2 = GUICtrlCreateInput("0", 2, 25, 90, 20)
	GUISetState()

	; Setzt das Handle zu einem Buddy (links))
	_GUICtrlSlider_SetBuddy($hSlider, True, $hInput)
	; Setzt das Handle zu einem Buddy (rechts)
	_GUICtrlSlider_SetBuddy($hSlider, False, $hInput2)

	; Ermittelt das Handle zu einem Buddy (links))
	MsgBox(4160, "Information", "Buddy Handle: " & _GUICtrlSlider_GetBuddy($hSlider, True))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

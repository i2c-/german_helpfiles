#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGUI, $hSlider

	; Erstellt eine GUI
	$hGUI = GUICreate("Slider: L&ouml;schen (UDF)", 400, 296)
	$hSlider = _GUICtrlSlider_Create($hGUI, 2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS))
	GUISetState(@SW_SHOW)

	MsgBox(8192 + 64, "Information", "Der Slider wird gel&ouml;scht")
	_GUICtrlSlider_Destroy($hSlider)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

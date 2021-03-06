#include <GuiConstantsEx.au3>
#include <GuiSlider.au3>

$Debug_S = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Slider-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hSlider

	; Erstellt eine GUI
	GUICreate("Slider: Ermittelt das Unicode Format", 400, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState()

	; Ermittelt das Unicode Format
	MsgBox(4160, "Information", "Unicode Format: " & _GUICtrlSlider_GetUnicodeFormat($hSlider))

	; Setzt das Unicode Format
	MsgBox(4160, "Information", "Vorheriges Unicode Format: " & _GUICtrlSlider_SetUnicodeFormat($hSlider, False))

	; Ermittelt das Unicode Format
	MsgBox(4160, "Information", "Unicode Format: " & _GUICtrlSlider_GetUnicodeFormat($hSlider))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

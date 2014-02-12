#include <GuiConstantsEx.au3>
#include <GuiSlider.au3>

$Debug_S = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Slider-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $rdoBottom, $rdoLeft, $rdoRight, $rdoTop, $hSlider, $hSlider2

	; Erstellt eine GUI
	GUICreate("Slider: Positioniert ein ToolTip-Control", 400, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 375, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS))
	$hSlider2 = GUICtrlCreateSlider(380, 2, 20, 292, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_VERT))
	GUISetState()

	GUICtrlCreateGroup("ToolTip horizontal", 2, 25, 120, 120)
	$rdoBottom = GUICtrlCreateRadio("Unten", 5, 40, 108, 20)
	$rdoTop = GUICtrlCreateRadio("Oben", 5, 115, 108, 20)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	GUICtrlSetState($rdoTop, $GUI_CHECKED)

	GUICtrlCreateGroup("ToolTip vertikal", 130, 25, 120, 120)
	$rdoLeft = GUICtrlCreateRadio("Links", 132, 65, 108, 20)
	$rdoRight = GUICtrlCreateRadio("Rechts", 132, 90, 108, 20)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	GUICtrlSetState($rdoLeft, $GUI_CHECKED)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $rdoBottom
				_GUICtrlSlider_SetTipSide($hSlider, $TBTS_BOTTOM)
			Case $rdoLeft
				_GUICtrlSlider_SetTipSide($hSlider2, $TBTS_LEFT)
			Case $rdoRight
				_GUICtrlSlider_SetTipSide($hSlider2, $TBTS_RIGHT)
			Case $rdoTop
				_GUICtrlSlider_SetTipSide($hSlider, $TBTS_TOP)
		EndSwitch
	WEnd
	GUIDelete()
EndFunc   ;==>_Main

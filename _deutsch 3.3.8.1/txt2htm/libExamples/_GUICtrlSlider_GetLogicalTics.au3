#include <GuiConstantsEx.au3>
#include <WindowsConstants.au3>
#include <GuiSlider.au3>

$Debug_S = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Slider-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $iMemo

_Main()

Func _Main()
	Local $hSlider, $aTics

	; Erstellt eine GUI
	GUICreate("Slider: Ermittelt die logischen Positionen f&uuml;r die Skalenstriche", 550, 296)
	$hSlider = GUICtrlCreateSlider(2, 2, 300, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS))
	$iMemo = GUICtrlCreateEdit("", 2, 32, 546, 266, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	$aTics = _GUICtrlSlider_GetLogicalTics($hSlider)
	MemoWrite("Anzahl der Skalenstriche inklusive dem ersten und letzten : " & UBound($aTics))
	For $x = 0 To UBound($aTics) - 1
		MemoWrite(StringFormat("(%02d) logischen Positionen f&uuml;r die Skalenstriche ..........: %d", $x, $aTics[$x]))
	Next

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

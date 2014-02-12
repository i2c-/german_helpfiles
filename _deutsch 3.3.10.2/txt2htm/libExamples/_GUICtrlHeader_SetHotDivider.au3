#include <GuiConstantsEx.au3>
#include <GuiHeader.au3>

Example()

Func Example()
	Local $hGUI, $hHeader, $iTicks, $iIndex, $begin

	; Erstellt eine GUI
	$hGUI = GUICreate("Header", 400, 300)
	$hHeader = _GUICtrlHeader_Create($hGUI)
	GUISetState(@SW_SHOW)

	; F&uuml;gt die Spalten hinzu
	_GUICtrlHeader_AddItem($hHeader, "Spalte 1", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 2", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 3", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 4", 100)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
		If TimerDiff($begin) > 500 Then
			$iIndex = Mod($iIndex + 1, 4)
			_GUICtrlHeader_SetHotDivider($hHeader, False, $iIndex)
			$begin = TimerInit()
		EndIf
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

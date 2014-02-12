#include <GuiConstantsEx.au3>
#include <GuiHeader.au3>
#include <WindowsConstants.au3>

$Debug_HDR = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Header-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $hHeader

_Main()

Func _Main()
	Local $hGUI

	; Erstellt eine GUI
	$hGUI = GUICreate("Header: Zerst&ouml;ren", 400, 300)
	$hHeader = _GUICtrlHeader_Create($hGUI)
	GUISetState()

	; F&uuml;gt die Spalten hinzu
	_GUICtrlHeader_AddItem($hHeader, "Spalte 1", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 2", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 3", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 4", 100)

	; L&ouml;scht alle Filter
	_GUICtrlHeader_ClearFilterAll($hHeader)

	MsgBox(4096, "Information", "Das Header-Control wird gleich zerst&ouml;rt!")

	_GUICtrlHeader_Destroy($hHeader)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>_Main

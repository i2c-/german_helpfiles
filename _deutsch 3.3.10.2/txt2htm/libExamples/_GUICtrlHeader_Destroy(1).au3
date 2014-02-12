#include <GUIConstantsEx.au3>
#include <GuiHeader.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Global $hHeader

Example()

Func Example()
	Local $hGUI

	; Erstellt eine GUI
	$hGUI = GUICreate("Header: Zerst&ouml;ren", 400, 300)
	$hHeader = _GUICtrlHeader_Create($hGUI)
	_GUICtrlHeader_SetUnicodeFormat($hHeader, True)
	GUISetState(@SW_SHOW)

	; F&uuml;gt die Spalten hinzu
	_GUICtrlHeader_AddItem($hHeader, "Spalte 1", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 2", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 3", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 4", 100)

	; L&ouml;scht alle Filter
	_GUICtrlHeader_ClearFilterAll($hHeader)

	MsgBox($MB_SYSTEMMODAL, "Information", "Das Header-Control wird gleich zerst&ouml;rt!")

	_GUICtrlHeader_Destroy($hHeader)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

#include <GUIConstantsEx.au3>
#include <GuiHeader.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGUI, $hHeader

	; Erstellt eine GUI
	$hGUI = GUICreate("Header", 400, 300)
	$hHeader = _GUICtrlHeader_Create($hGUI)
	_GUICtrlHeader_SetUnicodeFormat($hHeader, True)
	GUISetState(@SW_SHOW)

	; F&uuml;gt die Spalten hinzu
	_GUICtrlHeader_AddItem($hHeader, "Spalte 1", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 2", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 3", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 4", 100)

	; L&ouml;scht Spalte 3
	MsgBox($MB_SYSTEMMODAL, "Information", "L&ouml;schen von Spalte 3")
	_GUICtrlHeader_DeleteItem($hHeader, 2)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

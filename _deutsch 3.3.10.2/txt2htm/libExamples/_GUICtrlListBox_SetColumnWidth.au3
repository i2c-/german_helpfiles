#include <GUIListBox.au3>
#include <GuiConstantsEx.au3>

Example()

Func Example()
	Local $hListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Spaltenbreite setzen", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296, BitOR($LBS_STANDARD, $LBS_MULTICOLUMN))
	GUISetState(@SW_SHOW)

	; Setzt die Breite der Spalten
	_GUICtrlListBox_SetColumnWidth($hListBox, 100)

	; F&uuml;gt Strings hinzu
	_GUICtrlListBox_BeginUpdate($hListBox)
	For $iI = 1 To 50
		_GUICtrlListBox_AddString($hListBox, StringFormat("Item %03d", $iI))
	Next
	_GUICtrlListBox_EndUpdate($hListBox)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

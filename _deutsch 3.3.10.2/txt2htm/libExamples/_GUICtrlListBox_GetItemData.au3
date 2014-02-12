#include <GuiListBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

; Warnung! Diese Funktion sollte nicht bei Items, die mit einer in AutoIT eingebauten Funktion erstellt wurden, angewendet werden!
; Die Item Daten sind die Control-ID f&uuml;r jeden String.

Example()

Func Example()
	Local $hListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Ermittelt Item Daten", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; F&uuml;gt Strings hinzu
	_GUICtrlListBox_BeginUpdate($hListBox)
	For $iI = 1 To 9
		_GUICtrlListBox_AddString($hListBox, StringFormat("%03d : Zufallstring", Random(1, 100, 1)))
	Next
	_GUICtrlListBox_EndUpdate($hListBox)

	; Setzt die Item Daten
	_GUICtrlListBox_SetItemData($hListBox, 4, 1234)

	; Ermittelt die Item Daten
	MsgBox($MB_SYSTEMMODAL, "Information", "Item 5 Daten: " & _GUICtrlListBox_GetItemData($hListBox, 4))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

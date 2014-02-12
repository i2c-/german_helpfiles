#include <GUIListBox.au3>
#include <GuiConstantsEx.au3>

$Debug_LB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ListBox-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

; Warnung! Diese Funktion sollte nicht bei Items, die mit einer in AutoIT eingebauten Funktion erstellt wurden, angewendet werden!
; Die Item Daten sind die Control-ID f&uuml;r jeden String.

_Main()

Func _Main()
	Local $hListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Ermittelt Item Daten", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296)
	GUISetState()

	; F&uuml;gt Strings hinzu
	_GUICtrlListBox_BeginUpdate($hListBox)
	For $iI = 1 To 9
		_GUICtrlListBox_AddString($hListBox, StringFormat("%03d : Zufallstring", Random(1, 100, 1)))
	Next
	_GUICtrlListBox_EndUpdate($hListBox)

	; Setzt die Item Daten
	_GUICtrlListBox_SetItemData($hListBox, 4, 1234)

	; Ermittelt die Item Daten
	MsgBox(4160, "Information", "Item 5 Daten: " & _GUICtrlListBox_GetItemData($hListBox, 4))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

#include <GUIListBox.au3>
#include <GuiConstantsEx.au3>

$Debug_LB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ListBox-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Beispiel()
Beispiel2()

Func Beispiel()
	Local $iIndex, $hListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Sucht einen String", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296)

	GUISetState()

	; F&uuml;gt Strings hinzu
	_GUICtrlListBox_BeginUpdate($hListBox)
	For $iI = 1 To 9
		_GUICtrlListBox_AddString($hListBox, StringFormat("%03d : Zufallstring", Random(1, 100, 1)))
	Next
	_GUICtrlListBox_InsertString($hListBox, "eXaCt tExT", 3)
	_GUICtrlListBox_EndUpdate($hListBox)

	; Sucht nach einem Item
	$iIndex = _GUICtrlListBox_FindString($hListBox, "exa")
	_GUICtrlListBox_SetCurSel($hListBox, $iIndex)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Beispiel

Func Beispiel2()
	Local $iIndex, $hListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Sucht einen exakten String", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296)

	GUISetState()

	; F&uuml;gt Strings hinzu
	_GUICtrlListBox_BeginUpdate($hListBox)
	For $iI = 1 To 9
		_GUICtrlListBox_AddString($hListBox, StringFormat("%03d : Zufallstring", Random(1, 100, 1)))
	Next
	_GUICtrlListBox_InsertString($hListBox, "eXa", 2)
	_GUICtrlListBox_InsertString($hListBox, "eXaCt tExT", 3)
	_GUICtrlListBox_EndUpdate($hListBox)

	; Sucht nach einem Item
	$iIndex = _GUICtrlListBox_FindString($hListBox, "exact text", True)
	_GUICtrlListBox_SetCurSel($hListBox, $iIndex)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Beispiel2

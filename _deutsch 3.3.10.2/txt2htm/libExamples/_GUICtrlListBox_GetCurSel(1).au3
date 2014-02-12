#include <GUIListBox.au3>
#include <GuiConstantsEx.au3>

Example()

Func Example()
	Local $hListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Ermittelt die momentane Auswahl", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; F&uuml;gt Strings hinzu
	_GUICtrlListBox_BeginUpdate($hListBox)
	For $iI = 1 To 9
		_GUICtrlListBox_AddString($hListBox, StringFormat("%03d : Zufallstring", Random(1, 100, 1)))
	Next
	_GUICtrlListBox_EndUpdate($hListBox)

	; W&auml;hlt ein Item aus
	_GUICtrlListBox_SetCurSel($hListBox, 4)

	; Ermittelt das ausgew&auml;hlte Item
	_WinAPI_ShowMsg("Momentane Auswahl: " & _GUICtrlListBox_GetCurSel($hListBox))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

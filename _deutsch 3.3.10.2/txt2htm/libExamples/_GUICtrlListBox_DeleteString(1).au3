#include <GUIListBox.au3>
#include <GuiConstantsEx.au3>

Example()

Func Example()
	Local $hListBox

	; Erstellt eine GUI
	GUICreate("ListBox: String l&ouml;schen", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296)

	GUISetState(@SW_SHOW)

	; F&uuml;gt Strings hinzu
	_GUICtrlListBox_BeginUpdate($hListBox)
	For $iI = 1 To 9
		_GUICtrlListBox_AddString($hListBox, StringFormat("%d : ListBox String", $iI))
	Next
	_GUICtrlListBox_EndUpdate($hListBox)

	; L&ouml;scht den mittleren String
	_GUICtrlListBox_DeleteString($hListBox, 4)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

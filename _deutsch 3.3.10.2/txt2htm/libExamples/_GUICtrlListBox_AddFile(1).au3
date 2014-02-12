#include <GUIListBox.au3>
#include <GuiConstantsEx.au3>

Example()

Func Example()
	Local $hListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Datei hinzuf&uuml;gen", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Datei hinzuf&uuml;gen
	_GUICtrlListBox_AddFile($hListBox, @WindowsDir & "\Notepad.exe")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

#include <GUIListBox.au3>
#include <GuiConstantsEx.au3>

Example()

Func Example()
	Local $aTabs[4] = [3, 100, 200, 300], $hListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Setzt die Tabstops", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296, BitOR($LBS_STANDARD, $LBS_USETABSTOPS))
	GUISetState(@SW_SHOW)

	; Setzt die Tabstops
	_GUICtrlListBox_SetTabStops($hListBox, $aTabs)

	; F&uuml;gt einen String hinzu um den Tabstop zu testen
	_GUICtrlListBox_AddString($hListBox, "Spalte 1" & @TAB & "Spalte 2" & @TAB & "Spalte 3")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

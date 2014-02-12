#include <GUIListBox.au3>
#include <GuiConstantsEx.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $hListBox

	; Erstellt eine GUI
	GUICreate("ListBox: F&uuml;gt einen String ein", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296, BitOR($WS_BORDER, $LBS_NOTIFY, $LBS_DISABLENOSCROLL, $WS_HSCROLL))
	GUISetState(@SW_SHOW)

	; F&uuml;gt Strings hinzu
	_GUICtrlListBox_BeginUpdate($hListBox)
	For $iI = 1 To 9
		_GUICtrlListBox_AddString($hListBox, StringFormat("%03d : Zufallstring", Random(1, 100, 1)))
	Next
	_GUICtrlListBox_InsertString($hListBox, "F&uuml;gt einen langen String hinzu, so das die horizontale Scrollbar erscheint und " & _
			"der ganze Text angezeigt werden kann.", 4)
	_GUICtrlListBox_UpdateHScroll($hListBox)
	_GUICtrlListBox_EndUpdate($hListBox)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

#include <GUIListBox.au3>
#include <GuiConstantsEx.au3>
#include <WindowsConstants.au3>

$Debug_LB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ListBox-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hListBox

	; Erstellt eine GUI
	GUICreate("ListBox: F&uuml;gt einen String hinzu", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296, BitOR($WS_BORDER, $WS_VSCROLL, $LBS_NOTIFY, $LBS_DISABLENOSCROLL, $WS_HSCROLL))

	GUISetState()

	; F&uuml;gt Strings hinzu
	_GUICtrlListBox_BeginUpdate($hListBox)
	For $iI = 1 To 9
		_GUICtrlListBox_AddString($hListBox, StringFormat("%03d : Zufallstring", Random(1, 100, 1)))
	Next
	_GUICtrlListBox_InsertString($hListBox, "Exakter teXt", 3)
	_GUICtrlListBox_InsertString($hListBox, "Dies ist der String nach dem wir suchen", 6)
	_GUICtrlListBox_InsertString($hListBox, _
			"F&uuml;gt einen langen String hinzu, so das die horizontale Scrollbar erscheint und " & _
			"der ganze Text angezeigt werden kann.", 9)
	_GUICtrlListBox_UpdateHScroll($hListBox)
	_GUICtrlListBox_EndUpdate($hListBox)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

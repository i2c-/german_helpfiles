#include <GuiListBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Setzt die Itemh&ouml;he", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; F&uuml;gt Strings hinzu
	_GUICtrlListBox_BeginUpdate($hListBox)
	For $iI = 1 To 9
		_GUICtrlListBox_AddString($hListBox, StringFormat("%03d : Zufallstring", Random(1, 100, 1)))
	Next
	_GUICtrlListBox_EndUpdate($hListBox)

	; Zeigt die Itemh&ouml;he
	MsgBox($MB_SYSTEMMODAL, "Information", "Itemh&ouml;he: " & _GUICtrlListBox_GetItemHeight($hListBox))

	; Setzt die Itemh&ouml;he
	_GUICtrlListBox_SetItemHeight($hListBox, 26)

	; Zeigt die Itemh&ouml;he
	MsgBox($MB_SYSTEMMODAL, "Information", "Itemh&ouml;he: " & _GUICtrlListBox_GetItemHeight($hListBox))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

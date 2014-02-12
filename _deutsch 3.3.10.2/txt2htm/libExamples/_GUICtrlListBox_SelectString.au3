#include <GuiListBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $sText, $hListBox

	; Erstellt eine GUI
	GUICreate("ListBox: String ausw&auml;hlen", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; F&uuml;gt Strings hinzu
	_GUICtrlListBox_BeginUpdate($hListBox)
	For $iI = 1 To 10
		$sText = StringFormat("%03d : Zufallstring ", Random(1, 100, 1))
		For $iX = 1 To Random(1, 20, 1)
			$sText &= Chr(Random(65, 90, 1))
		Next
		_GUICtrlListBox_AddString($hListBox, $sText)
	Next
	_GUICtrlListBox_AddString($hListBox, "020 : Zielstring")
	_GUICtrlListBox_EndUpdate($hListBox)

	; String ausw&auml;hlen
	MsgBox($MB_SYSTEMMODAL, "Information", "Index des Zielstrings: " & _GUICtrlListBox_SelectString($hListBox, "020 : Z"));

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

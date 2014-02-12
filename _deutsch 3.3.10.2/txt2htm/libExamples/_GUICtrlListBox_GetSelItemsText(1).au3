#include <GuiListBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $sItems, $aItems, $hListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Ermittelt den Text, der ausgew&auml;hlten Items", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296, BitOR($LBS_STANDARD, $LBS_EXTENDEDSEL))
	GUISetState(@SW_SHOW)

	; F&uuml;gt Strings hinzu
	_GUICtrlListBox_BeginUpdate($hListBox)
	For $iI = 1 To 9
		_GUICtrlListBox_AddString($hListBox, StringFormat("%03d : Zufallstring", Random(1, 100, 1)))
	Next
	_GUICtrlListBox_EndUpdate($hListBox)

	; W&auml;hlt einige Items aus
	_GUICtrlListBox_SetSel($hListBox, 3)
	_GUICtrlListBox_SetSel($hListBox, 4)
	_GUICtrlListBox_SetSel($hListBox, 5)

	; Ermittelt die Indizes der ausgew&auml;hlten Items
	$aItems = _GUICtrlListBox_GetSelItemsText($hListBox)
	For $iI = 1 To $aItems[0]
		$sItems &= @CRLF & $aItems[$iI]
	Next
	MsgBox($MB_SYSTEMMODAL, "Information", "Ausgew&auml;hlte Items: " & $sItems)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

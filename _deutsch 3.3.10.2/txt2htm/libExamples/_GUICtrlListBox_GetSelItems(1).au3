#include <GuiListBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $sItems, $aItems, $hListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Ermittelt die ausgew&auml;hlten Items", 400, 296)
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

	; Ermittelt die Idizes der ausgew&auml;hlten Items
	$aItems = _GUICtrlListBox_GetSelItems($hListBox)
	For $iI = 1 To $aItems[0]
		If $iI > 1 Then $sItems &= ", "
		$sItems &= $aItems[$iI]
	Next
	MsgBox($MB_SYSTEMMODAL, "Information", "Ausgew&auml;hlte Items: " & $sItems)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

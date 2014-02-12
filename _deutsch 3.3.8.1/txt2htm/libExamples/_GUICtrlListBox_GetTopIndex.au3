#include <GUIListBox.au3>
#include <GuiConstantsEx.au3>

$Debug_LB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ListBox-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $sText, $hListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Ermittelt den Index des ersten sichtbaren Items", 500, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 496, 296)
	GUISetState()

	; F&uuml;gt Strings hinzu
	_GUICtrlListBox_BeginUpdate($hListBox)
	For $iI = 1 To 100
		$sText = StringFormat("%03d : Zufallstring ", $iI)
		For $iX = 1 To Random(1, 20, 1)
			$sText &= Chr(Random(65, 90, 1))
		Next
		_GUICtrlListBox_AddString($hListBox, $sText)
	Next
	_GUICtrlListBox_EndUpdate($hListBox)

	; Ermittelt den Index des ersten sichtbaren Items
	MsgBox(8256, "Information", "Index des ersten sichtbaren Items: " & _GUICtrlListBox_GetTopIndex($hListBox))

	; Stellt sicher, dass ein bestimmtes Item sichtbar ist
	_GUICtrlListBox_SetTopIndex($hListBox, 50)

	; Ermittelt den Index des ersten sichtbaren Items
	MsgBox(8256, "Information", "Index des ersten sichtbaren Items: " & _GUICtrlListBox_GetTopIndex($hListBox))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

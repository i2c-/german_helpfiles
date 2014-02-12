#include <GUIListBox.au3>
#include <GuiConstantsEx.au3>
#include <WindowsConstants.au3>

$Debug_LB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ListBox-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $sText, $hListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Sortieren", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296, BitOR($WS_BORDER, $WS_VSCROLL, $LBS_NOTIFY, $LBS_MULTIPLESEL, $LBS_SORT))
	GUISetState()

	; F&uuml;gt Strings hinzu
	_GUICtrlListBox_BeginUpdate($hListBox)
	For $iI = 1 To 9
		$sText = StringFormat("%03d : Zufallstring ", Random(1, 100, 1))
		For $iX = 1 To Random(1, 20, 1)
			$sText &= Chr(Random(65, 90, 1))
		Next
		_GUICtrlListBox_AddString($hListBox, $sText)
	Next
	_GUICtrlListBox_InsertString($hListBox, "Dies ist ein Test", 0) ; Autosortieren funktioniert nicht, wenn ein String eingef&uuml;gt wird
	_GUICtrlListBox_EndUpdate($hListBox)

	; Sortiert eine Listbox
	MsgBox(4160, "Information", "Daten sortieren")
	_GUICtrlListBox_Sort($hListBox)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

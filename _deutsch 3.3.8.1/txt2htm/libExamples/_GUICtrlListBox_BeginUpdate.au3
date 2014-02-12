#include <GUIListBox.au3>
#include <GuiConstantsEx.au3>
#include <Constants.au3>

$Debug_LB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ListBox-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Aktualisierung deaktivieren", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296)
	GUISetState()

	; F&uuml;gt Dateien hinzu
	_GUICtrlListBox_BeginUpdate($hListBox)
	_GUICtrlListBox_ResetContent($hListBox)
	_GUICtrlListBox_InitStorage($hListBox, 100, 4096)
	_GUICtrlListBox_Dir($hListBox, @WindowsDir & "\win*.exe")
	_GUICtrlListBox_AddFile($hListBox, @WindowsDir & "\notepad.exe")
	_GUICtrlListBox_Dir($hListBox, "", $DDL_DRIVES)
	_GUICtrlListBox_Dir($hListBox, "", $DDL_DRIVES, False)
	_GUICtrlListBox_EndUpdate($hListBox)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

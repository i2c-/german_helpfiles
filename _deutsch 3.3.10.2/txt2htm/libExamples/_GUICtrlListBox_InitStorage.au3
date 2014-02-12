#include <GuiListBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Speicher f&uuml;r die Items reservieren", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; F&uuml;gt Dateien hinzu
	_GUICtrlListBox_BeginUpdate($hListBox)
	_GUICtrlListBox_ResetContent($hListBox)
	MsgBox($MB_SYSTEMMODAL, "Information", "Speicher reserviert f&uuml;r: " & _GUICtrlListBox_InitStorage($hListBox, 100, 4096) & " Items")
	_GUICtrlListBox_Dir($hListBox, @WindowsDir & "\win*.exe")
	_GUICtrlListBox_AddFile($hListBox, @WindowsDir & "\notepad.exe")
	_GUICtrlListBox_EndUpdate($hListBox)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

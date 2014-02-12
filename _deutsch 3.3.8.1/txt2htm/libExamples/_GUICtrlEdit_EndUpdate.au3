#include <GuiEdit.au3>
#include <GuiStatusBar.au3>
#include <GuiConstantsEx.au3>

$Debug_Ed = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Edit-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $StatusBar, $hEdit, $hGUI
	Local $Wow64 = ""
	If @AutoItX64 Then $Wow64 = "\Wow6432Node"
	Local $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $Wow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\include\changelog.txt"

	; Erstellt eine GUI
	$hGUI = GUICreate("Edit: Aktualisierung wieder aktivieren", 400, 300)
	$hEdit = GUICtrlCreateEdit("", 2, 2, 394, 268)
	$StatusBar = _GUICtrlStatusBar_Create($hGUI, -1)
	GUISetState()

	_GUICtrlEdit_BeginUpdate($hEdit)
	_GUICtrlEdit_SetText($hEdit, FileRead($sFile))
	_GUICtrlEdit_EndUpdate($hEdit)

	_GUICtrlStatusBar_SetIcon($StatusBar, 0, 97, "shell32.dll")
	_GUICtrlStatusBar_SetText($StatusBar, @TAB & "Zeilen: " & _GUICtrlEdit_GetLineCount($hEdit))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

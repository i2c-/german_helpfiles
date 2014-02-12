#include <GuiEdit.au3>
#include <GuiConstantsEx.au3>

Example()

Func Example()
	Local $hEdit, $StatusBar, $hGUI
	Local $Wow64 = ""
	If @AutoItX64 Then $Wow64 = "\Wow6432Node"
	Local $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $Wow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\include\changelog.txt"

	; Erstellt eine GUI
	$hGUI = GUICreate("Edit: Update beginnen", 400, 300)
	$hEdit = GUICtrlCreateEdit("", 2, 2, 394, 268)
	$StatusBar = _GUICtrlStatusBar_Create($hGUI, -1)
	GUISetState(@SW_SHOW)

	_GUICtrlEdit_BeginUpdate($hEdit)
	_GUICtrlEdit_SetText($hEdit, FileRead($sFile))
	_GUICtrlEdit_EndUpdate($hEdit)

	_GUICtrlStatusBar_SetIcon($StatusBar, 0, 97, "shell32.dll")
	_GUICtrlStatusBar_SetText($StatusBar, @TAB & "Zeilen: " & _GUICtrlEdit_GetLineCount($hEdit))

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

#include <GuiEdit.au3>
#include <GuiStatusBar.au3>
#include <GuiConstantsEx.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $StatusBar, $hEdit, $hGUI
	Local $Wow64 = ""
	If @AutoItX64 Then $Wow64 = "\Wow6432Node"
	Local $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $Wow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\include\changelog.txt"
	Local $aPartRightSide[2] = [378, -1], $iRandom

	; Erstellt eine GUI
	$hGUI = GUICreate("Edit: Ermittelt die Zeile, welche den angegebenen Zeichenindex enth&auml;lt", 600, 300)
	$hEdit = GUICtrlCreateEdit("", 2, 2, 594, 268, BitOR($ES_WANTRETURN, $WS_VSCROLL))
	$StatusBar = _GUICtrlStatusBar_Create($hGUI, $aPartRightSide)
	_GUICtrlStatusBar_SetIcon($StatusBar, 1, 97, "shell32.dll")
	GUISetState(@SW_SHOW)

	; Setzt den Text
	_GUICtrlEdit_SetText($hEdit, FileRead($sFile))

	; Ermittelt den Index der Zeile, welche den festgelegten Zeichenindex enth&auml;lt
	$iRandom = Random(0, _GUICtrlEdit_GetTextLen($hEdit) - 1, 1)
	_GUICtrlEdit_SetSel($hEdit, $iRandom - 1, $iRandom)
	_GUICtrlStatusBar_SetText($StatusBar, "Das " & $iRandom & ". Zeichen befindet sich in Zeile " & _GUICtrlEdit_LineFromChar($hEdit, $iRandom))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

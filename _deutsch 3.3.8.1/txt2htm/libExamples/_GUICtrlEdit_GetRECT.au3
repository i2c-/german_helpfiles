#include <GuiEdit.au3>
#include <GuiStatusBar.au3>
#include <GuiConstantsEx.au3>
#include <WindowsConstants.au3>

$Debug_Ed = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Edit-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $StatusBar, $hEdit, $hGUI
	Local $Wow64 = ""
	If @AutoItX64 Then $Wow64 = "\Wow6432Node"
	Local $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $Wow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\include\changelog.txt"
	Local $aPartRightSide[6] = [50, 130, 210, 290, 378, -1], $aRect

	; Erstellt eine GUI
	$hGUI = GUICreate("Edit: Ermittelt das formatierte Rechteck", 400, 300)
	$hEdit = GUICtrlCreateEdit("", 2, 2, 394, 268, BitOR($ES_WANTRETURN, $WS_VSCROLL))
	$StatusBar = _GUICtrlStatusBar_Create($hGUI, $aPartRightSide)
	_GUICtrlStatusBar_SetIcon($StatusBar, 5, 97, "shell32.dll")
	_GUICtrlStatusBar_SetText($StatusBar, "Rect")
	GUISetState()

	; Ermittelt das formatierte Rechteck
	$aRect = _GUICtrlEdit_GetRECT($hEdit)
	$aRect[0] += 10
	$aRect[1] += 10
	$aRect[2] -= 10
	$aRect[3] -= 10

	; Setzt das formatierte Rechteck
	_GUICtrlEdit_SetRECT($hEdit, $aRect)

	; F&uuml;gt den Text hinzu
	_GUICtrlEdit_AppendText($hEdit, FileRead($sFile))
	_GUICtrlEdit_LineScroll($hEdit, 0, _GUICtrlEdit_GetLineCount($hEdit) * - 1)

	; Ermittelt das formatierte Rechteck
	$aRect = _GUICtrlEdit_GetRECT($hEdit)
	_GUICtrlStatusBar_SetText($StatusBar, "Links : " & $aRect[0], 1)
	_GUICtrlStatusBar_SetText($StatusBar, "Oben  : " & $aRect[1], 2)
	_GUICtrlStatusBar_SetText($StatusBar, "Rechts: " & $aRect[2], 3)
	_GUICtrlStatusBar_SetText($StatusBar, "Unten : " & $aRect[3], 4)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

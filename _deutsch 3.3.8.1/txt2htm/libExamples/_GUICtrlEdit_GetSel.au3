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
	Local $aPartRightSide[3] = [190, 378, -1], $aSel

	; Erstellt eine GUI
	$hGUI = GUICreate("Edit: Ermittelt die Markierung", 400, 300)
	$hEdit = GUICtrlCreateEdit("", 2, 2, 394, 268, BitOR($ES_WANTRETURN, $WS_VSCROLL))
	$StatusBar = _GUICtrlStatusBar_Create($hGUI, $aPartRightSide)
	_GUICtrlStatusBar_SetIcon($StatusBar, 2, 97, "shell32.dll")
	GUISetState()

	; Setzt die R&auml;nder
	_GUICtrlEdit_SetMargins($hEdit, BitOR($EC_LEFTMARGIN, $EC_RIGHTMARGIN), 10, 10)

	; Setzt den Text
	_GUICtrlEdit_SetText($hEdit, FileRead($sFile))

	; Setzt die Markierung
	_GUICtrlEdit_SetSel($hEdit, 15, 20)

	; Ermittelt die Markierung
	$aSel = _GUICtrlEdit_GetSel($hEdit)
	_GUICtrlStatusBar_SetText($StatusBar, "Start: " & $aSel[0])
	_GUICtrlStatusBar_SetText($StatusBar, "Ende: " & $aSel[1], 1)

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

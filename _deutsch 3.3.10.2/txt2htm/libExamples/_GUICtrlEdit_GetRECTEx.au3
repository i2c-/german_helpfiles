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
	Local $aPartRightSide[6] = [50, 130, 210, 290, 378, -1], $tRect

	; Erstellt eine GUI
	$hGUI = GUICreate("Edit: Ermittelt das formatierte Rechteck", 400, 300)
	$hEdit = GUICtrlCreateEdit("", 2, 2, 394, 268, BitOR($ES_WANTRETURN, $WS_VSCROLL))
	$StatusBar = _GUICtrlStatusBar_Create($hGUI, $aPartRightSide)
	_GUICtrlStatusBar_SetIcon($StatusBar, 5, 97, "shell32.dll")
	_GUICtrlStatusBar_SetText($StatusBar, "Rechteck:")
	GUISetState(@SW_SHOW)

	; Ermittelt das formatierte Rechteck
	$tRect = _GUICtrlEdit_GetRECTEx($hEdit)
	DllStructSetData($tRect, "Left", DllStructGetData($tRect, "Left") + 10)
	DllStructSetData($tRect, "Top", DllStructGetData($tRect, "Top") + 10)
	DllStructSetData($tRect, "Right", DllStructGetData($tRect, "Right") - 10)
	DllStructSetData($tRect, "Bottom", DllStructGetData($tRect, "Bottom") - 10)

	; Setzt das formatierte Rechteck
	_GUICtrlEdit_SetRECTEx($hEdit, $tRect)

	; F&uuml;gt den Text hinzu
	_GUICtrlEdit_AppendText($hEdit, FileRead($sFile))
	_GUICtrlEdit_LineScroll($hEdit, 0, _GUICtrlEdit_GetLineCount($hEdit) * - 1)

	; Ermittelt das formatierte Rechteck
	$tRect = _GUICtrlEdit_GetRECTEx($hEdit)
	_GUICtrlStatusBar_SetText($StatusBar, "Links: " & DllStructGetData($tRect, "Left"), 1)
	_GUICtrlStatusBar_SetText($StatusBar, "Oben: " & DllStructGetData($tRect, "Top"), 2)
	_GUICtrlStatusBar_SetText($StatusBar, "Rechts: " & DllStructGetData($tRect, "Right"), 3)
	_GUICtrlStatusBar_SetText($StatusBar, "Unten: " & DllStructGetData($tRect, "Bottom"), 4)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

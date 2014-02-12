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
	Local $aPartRightSide[3] = [200, 378, -1], $aPos

	; Erstellt eine GUI
	$hGUI = GUICreate("Edit: Ermittelt die Fensterkoordinaten des angegebenen Zeichens", 550, 300)
	$hEdit = GUICtrlCreateEdit("", 2, 2, 546, 268, BitOR($ES_WANTRETURN, $WS_VSCROLL))
	$StatusBar = _GUICtrlStatusBar_Create($hGUI, $aPartRightSide)
	_GUICtrlStatusBar_SetIcon($StatusBar, 2, 97, "shell32.dll")
	GUISetState(@SW_SHOW)

	; Setzt die R&auml;nder
	_GUICtrlEdit_SetMargins($hEdit, BitOR($EC_LEFTMARGIN, $EC_RIGHTMARGIN), 10, 10)

	; Setzt den Text
	_GUICtrlEdit_SetText($hEdit, FileRead($sFile))

	; Ermittelt die Fensterkoordinaten des 300. Zeichens
	$aPos = _GUICtrlEdit_PosFromChar($hEdit, 300)
	_GUICtrlStatusBar_SetText($StatusBar, "Horizontale Koordinate (x): " & $aPos[0])
	_GUICtrlStatusBar_SetText($StatusBar, "Vertikale Koordinate (y): " & $aPos[1], 1)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

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
	Local $aPartRightSide[2] = [378, -1]

	; Erstellt eine GUI
	$hGUI = GUICreate("Edit: Scrollt den Text", 400, 300)
	$hEdit = GUICtrlCreateEdit("", 2, 2, 394, 268, BitOR($ES_WANTRETURN, $WS_VSCROLL))
	$StatusBar = _GUICtrlStatusBar_Create($hGUI, $aPartRightSide)
	_GUICtrlStatusBar_SetIcon($StatusBar, 1, 97, "shell32.dll")
	GUISetState(@SW_SHOW)

	; Setzt den Text
	For $i = 1 To 50
		$sText &= $i & @CRLF
	Next
	_GUICtrlEdit_SetText($hEdit, $sText)

	; Scrollt
	Sleep(1000)
	_GUICtrlStatusBar_SetText($StatusBar, "Gescrollt: " & _GUICtrlEdit_LineScroll($hEdit, 0, _GUICtrlEdit_GetLineCount($hEdit)))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

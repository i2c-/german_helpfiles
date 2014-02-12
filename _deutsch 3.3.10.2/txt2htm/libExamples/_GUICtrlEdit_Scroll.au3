#include <GuiEdit.au3>
#include <GuiStatusBar.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <ScrollBarsConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $StatusBar, $hEdit, $hGUI
	Local $Wow64 = ""
	If @AutoItX64 Then $Wow64 = "\Wow6432Node"
	Local $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $Wow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\include\changelog.txt"
	Local $aPartRightSide[3] = [200, 378, -1], $iLen

	; Erstellt eine GUI
	$hGUI = GUICreate("Edit: Scrollen", 400, 300)
	$hEdit = GUICtrlCreateEdit("", 2, 2, 394, 268, BitOR($ES_WANTRETURN, $WS_VSCROLL))
	$StatusBar = _GUICtrlStatusBar_Create($hGUI, $aPartRightSide)
	_GUICtrlStatusBar_SetIcon($StatusBar, 2, 97, "shell32.dll")
	GUISetState(@SW_SHOW)

	; Setzt den Text
	For $i = 1 To 50
		$sText &= $i & @CRLF
	Next
	_GUICtrlEdit_SetText($hEdit, $sText)

	MsgBox($MB_SYSTEMMODAL, "Information", "Scrollt eine Zeile runter")
	_GUICtrlEdit_Scroll($hEdit, $SB_LINEDOWN)

	MsgBox($MB_SYSTEMMODAL, "Information", "Scrollt eine Zeile hoch")
	_GUICtrlEdit_Scroll($hEdit, $SB_LINEUP)

	MsgBox($MB_SYSTEMMODAL, "Information", "Scrollt eine Seite runter")
	_GUICtrlEdit_Scroll($hEdit, $SB_PAGEDOWN)

	MsgBox($MB_SYSTEMMODAL, "Information", "Scrollt eine Seite hoch")
	_GUICtrlEdit_Scroll($hEdit, $SB_PAGEUP)

	$iLen = _GUICtrlEdit_GetTextLen($hEdit)
	_GUICtrlEdit_SetSel($hEdit, $iLen, $iLen)

	MsgBox($MB_SYSTEMMODAL, "Information", "Scrollt den blinkenden Balken in die Ansicht")
	_GUICtrlEdit_Scroll($hEdit, $SB_SCROLLCARET)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

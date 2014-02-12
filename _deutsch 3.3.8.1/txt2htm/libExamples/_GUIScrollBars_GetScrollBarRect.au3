#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <GUIScrollBars.au3>
#include <ScrollBarConstants.au3>

Global $iMemo

_Main()

Func _Main()
	Local $GUIMsg, $hGUI, $aRect

	$hGUI = GUICreate("ScrollBar: Beispiel", 400, 400, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU, $WS_SIZEBOX))
	$iMemo = GUICtrlCreateEdit("", 2, 2, 380, 360, BitOR($WS_HSCROLL, $WS_VSCROLL))
	GUICtrlSetResizing($iMemo, $GUI_DOCKALL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetBkColor(0x88AABB)

	GUISetState()

	_GUIScrollBars_Init($hGUI)

	$aRect = _GUIScrollBars_GetScrollBarRect($hGUI, $OBJID_HSCROLL)
	MemoWrite("Horizontal" & @CRLF & "--------------------------------------")
	MemoWrite("Links.........: " & $aRect[0])
	MemoWrite("Oben..........: " & $aRect[1])
	MemoWrite("Rechts........: " & $aRect[2])
	MemoWrite("Unten.......: " & $aRect[3])

	$aRect = _GUIScrollBars_GetScrollBarRect($hGUI, $OBJID_VSCROLL)
	MemoWrite(@CRLF & "--------------------------------------" & @CRLF & "Vertikal" & @CRLF & "--------------------------------------")
	MemoWrite("Links........: " & $aRect[0])
	MemoWrite("Oben.........: " & $aRect[1])
	MemoWrite("Rechts.......: " & $aRect[2])
	MemoWrite("Unten......: " & $aRect[3])


	While 1
		$GUIMsg = GUIGetMsg()

		Switch $GUIMsg
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	Exit
EndFunc   ;==>_Main

; Schreibt eine Zeile in das Memo Control
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

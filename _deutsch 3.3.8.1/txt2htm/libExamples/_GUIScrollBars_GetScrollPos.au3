#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <StructureConstants.au3>
#include <GUIScrollBars.au3>
#include <ScrollBarConstants.au3>

Global $iMemo

_Main()

Func _Main()
	Local $GUIMsg, $hGUI

	$hGUI = GUICreate("ScrollBar: Beispiel", 400, 400, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU, $WS_SIZEBOX))
	$iMemo = GUICtrlCreateEdit("", 2, 2, 380, 380, BitOR($WS_HSCROLL, $WS_VSCROLL))
	GUICtrlSetResizing($iMemo, $GUI_DOCKALL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetBkColor(0x88AABB)

	GUISetState()

	_GUIScrollBars_Init($hGUI)

	_GUIScrollBars_SetScrollInfoPos($hGUI, $SB_HORZ, 10)
	MemoWrite("Scrollposition horizontal: " & _GUIScrollBars_GetScrollPos($hGUI, $SB_HORZ))
	Sleep(1000)
	_GUIScrollBars_SetScrollInfoPos($hGUI, $SB_HORZ, 0)
	MemoWrite("Scrollposition horizontal: " & _GUIScrollBars_GetScrollPos($hGUI, $SB_HORZ))
	Sleep(1000)
	_GUIScrollBars_SetScrollInfoPos($hGUI, $SB_VERT, 20)
	MemoWrite("Scrollposition vertikal: " & _GUIScrollBars_GetScrollPos($hGUI, $SB_VERT))
	Sleep(1000)
	_GUIScrollBars_SetScrollInfoPos($hGUI, $SB_VERT, 0)
	MemoWrite("Scrollposition vertikal: " & _GUIScrollBars_GetScrollPos($hGUI, $SB_VERT))

	While 1
		$GUIMsg = GUIGetMsg()

		Switch $GUIMsg
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	Exit
EndFunc   ;==>_Main

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

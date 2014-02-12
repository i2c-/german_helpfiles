#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <StructureConstants.au3>
#include <GuiScrollBars.au3>

Global $iMemo

Example()

Func Example()
	Local $GUIMsg, $hGUI

	$hGUI = GUICreate("ScrollBar: Beispiel", 400, 400, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU, $WS_SIZEBOX))
	$iMemo = GUICtrlCreateEdit("", 2, 2, 380, 380, BitOR($WS_HSCROLL, $WS_VSCROLL))
	GUICtrlSetResizing($iMemo, $GUI_DOCKALL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetBkColor(0x88AABB)

	GUISetState(@SW_SHOW)

	_GUIScrollBars_Init($hGUI)

	MemoWrite("Horizontal" & @CRLF & "--------------------------------------")
	MemoWrite("Linke Kante der Scrollbox: " & _GUIScrollBars_GetScrollBarXYThumbTop($hGUI, $OBJID_HSCROLL))
	MemoWrite("Rechte Kante der Scrollbox: " & _GUIScrollBars_GetScrollBarXYThumbBottom($hGUI, $OBJID_HSCROLL) & @CRLF)

	MemoWrite("Vertikal" & @CRLF & "--------------------------------------")
	MemoWrite("Obere Kante der Scrollbox: " & _GUIScrollBars_GetScrollBarXYLineButton($hGUI, $OBJID_VSCROLL))
	MemoWrite("Untere Kante der Scrollbox: " & _GUIScrollBars_GetScrollBarXYThumbBottom($hGUI, $OBJID_VSCROLL))

	While 1
		$GUIMsg = GUIGetMsg()

		Switch $GUIMsg
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	Exit
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

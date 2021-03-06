#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <StructureConstants.au3>
#include <GuiScrollBars.au3>

Global $iMemo

Example()

Func Example()
	Local $GUIMsg, $hGUI, $tSCROLLBARINFO

	$hGUI = GUICreate("ScrollBar: Beispiel", 400, 400, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU, $WS_SIZEBOX))
	$iMemo = GUICtrlCreateEdit("", 2, 2, 380, 360, BitOR($WS_HSCROLL, $WS_VSCROLL))
	GUICtrlSetResizing($iMemo, $GUI_DOCKALL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetBkColor(0x88AABB)

	GUISetState(@SW_SHOW)

	_GUIScrollBars_Init($hGUI)

	$tSCROLLBARINFO = _GUIScrollBars_GetScrollBarInfoEx($hGUI, $OBJID_HSCROLL)
	MemoWrite("Horizontal" & @CRLF & "--------------------------------------")
	MemoWrite("Links.........: " & DllStructGetData($tSCROLLBARINFO, "Left"))
	MemoWrite("Oben..........: " & DllStructGetData($tSCROLLBARINFO, "Top"))
	MemoWrite("Rechts........: " & DllStructGetData($tSCROLLBARINFO, "Right"))
	MemoWrite("Unten.......: " & DllStructGetData($tSCROLLBARINFO, "Bottom"))
	MemoWrite("dxyLineButton: " & DllStructGetData($tSCROLLBARINFO, "dxyLineButton"))
	MemoWrite("xyThumbTop...: " & DllStructGetData($tSCROLLBARINFO, "xyThumbTop"))
	MemoWrite("xyThumbBottom: " & DllStructGetData($tSCROLLBARINFO, "xyThumbBottom"))
	For $x = 0 To 5
		MemoWrite("rgstate[" & $x & "]...: " & DllStructGetData($tSCROLLBARINFO, "rgstate", $x + 1))
	Next

	While 1
		$GUIMsg = GUIGetMsg()

		Switch $GUIMsg
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	Exit
EndFunc   ;==>Example

; Schreibt eine Zeile in das Memo Control
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <GUIScrollBars.au3>
#include <ScrollBarConstants.au3>

_Main()

Func _Main()
	Local $GUIMsg, $hGUI

	$hGUI = GUICreate("ScrollBar: Beispiel", 400, 400, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU, $WS_SIZEBOX))
	GUISetBkColor(0x88AABB)

	GUISetState()

	_GUIScrollBars_Init($hGUI)

	Sleep(1000)
	; Vertikale Scrollbar verstecken
	_GUIScrollBars_ShowScrollBar($hGUI, $SB_HORZ, False)
	Sleep(1000)
	; Vertikale Scrollbar anzeigen
	_GUIScrollBars_ShowScrollBar($hGUI, $SB_HORZ)
	Sleep(1000)
	; Horizontale Scrollbar verstecken
	_GUIScrollBars_ShowScrollBar($hGUI, $SB_VERT, False)
	Sleep(1000)
	; Horizontale Scrollbar anzeigen
	_GUIScrollBars_ShowScrollBar($hGUI, $SB_VERT)

	While 1
		$GUIMsg = GUIGetMsg()

		Switch $GUIMsg
			Case $GUI_EVENT_CLOSE;, $nExititem
				ExitLoop
		EndSwitch
	WEnd

	Exit
EndFunc   ;==>_Main

#include <WinAPI.au3>
#include <GUIConstantsEx.au3>

_Main()

Func _Main()
	Local $msg, $btnFocus, $win, $text
	GUICreate("__WinAPI_GetFocus Beispiel", 300, 200)
	$btnFocus = GUICtrlCreateButton("Fokus ermitteln", 50, 85, 100, 30)
	GUISetState(@SW_SHOW)
	While 1
		$msg = GUIGetMsg()
		Select
			Case $msg = $GUI_EVENT_CLOSE
				Exit
			Case $msg = $btnFocus
				$win = _WinAPI_GetFocus()
				$text = "Kompletter Titel: " & WinGetTitle($win) & @LF
				$text &= "Kompletter Text: " & WinGetText($win) & @LF
				$text &= "Handle: " & WinGetHandle($win) & @LF
				$text &= "Prozess: " & WinGetProcess($win) & @LF
				MsgBox(0, "", $text)
		EndSelect
	WEnd
EndFunc   ;==>_Main

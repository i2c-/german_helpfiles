#include <WinAPI.au3>
#include <WindowsConstants.au3>
#include <FontConstants.au3>

Global $tRECT, $hFont, $hOldFont, $hDC

HotKeySet("{ESC}", "_Exit")

$tRECT = DllStructCreate($tagRect)
DllStructSetData($tRECT, "Left", 5)
DllStructSetData($tRECT, "Top", 5)
DllStructSetData($tRECT, "Right", 300)
DllStructSetData($tRECT, "Bottom", 50)

$hDC = _WinAPI_GetDC(0)
$hFont = _WinAPI_CreateFont(50, 0, 0, 0, 400, False, False, False, $DEFAULT_CHARSET, _
		$OUT_DEFAULT_PRECIS, $CLIP_DEFAULT_PRECIS, $DEFAULT_QUALITY, 0, 'Arial')
$hOldFont = _WinAPI_SelectObject($hDC, $hFont)

_WinAPI_SetTextColor($hDC, 0x0000FF)
_WinAPI_SetBkColor($hDC, 0x000000)
; Kommentiere die n&auml;chste Zeile aus, um einen schwarzen statt transparenten Hintergrund zu erhalten.
_WinAPI_SetBkMode($hDC, $TRANSPARENT)

While 1
	_WinAPI_DrawText($hDC, "www.autoit.de", $tRECT, $DT_CENTER)
	Sleep(7000)
	_Exit()
WEnd

Func _Exit()
	_WinAPI_SelectObject($hDC, $hOldFont)
	_WinAPI_DeleteObject($hFont)
	_WinAPI_ReleaseDC(0, $hDC)
	_WinAPI_InvalidateRect(0, 0)
	$tRECT = 0
	Exit
EndFunc   ;==>_Exit

#include <WinAPI.au3>

_Main()

Func _Main()
	Local $aWindows, $i, $text
	$aWindows = _WinAPI_EnumWindowsPopup()
	For $i = 1 To $aWindows[0][0]
		$text = "Fenster-Handle: " & $aWindows[$i][0] & @LF
		$text &= "Fensterklasse: " & $aWindows[$i][1] & @LF
		$text &= "Fenstertitel: " & WinGetTitle($aWindows[$i][0]) & @LF
		$text &= "Fenstertext: " & WinGetText($aWindows[$i][0]) & @LF
		$text &= "Fensterprozess: " & WinGetProcess($aWindows[$i][0])
		MsgBox(0, "Item " & $i & " of " & $aWindows[0][0], $text)
	Next
EndFunc   ;==>_Main

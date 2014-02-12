#include <WinAPI.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $aWindows, $i, $text
	$aWindows = _WinAPI_EnumWindowsTop()
	For $i = 1 To $aWindows[0][0]
		$text = "Fenster-Handle: " & $aWindows[$i][0] & @CRLF
		$text &= "Fensterklasse: " & $aWindows[$i][1] & @CRLF
		$text &= "Fenstertitel: " & WinGetTitle($aWindows[$i][0]) & @CRLF
		$text &= "Fenstertext: " & WinGetText($aWindows[$i][0]) & @CRLF
		$text &= "Fensterprozess: " & WinGetProcess($aWindows[$i][0])
		MsgBox($MB_SYSTEMMODAL, "Item " & $i & " of " & $aWindows[0][0], $text)
	Next
EndFunc   ;==>Example

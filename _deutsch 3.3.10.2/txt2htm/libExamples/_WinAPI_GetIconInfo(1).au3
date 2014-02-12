#include <WinAPI.au3>
#include <Constants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $aInfo, $sInfo = ""
	$aInfo = _WinAPI_GetIconInfo($IDC_WAIT)
	For $x = 0 To UBound($aInfo) - 1
		$sInfo &= $aInfo[$x] & @CRLF
	Next
	MsgBox($MB_SYSTEMMODAL, "GetIconInfo", "Icon-Informationen: " & @CRLF & $sInfo)
EndFunc   ;==>Example

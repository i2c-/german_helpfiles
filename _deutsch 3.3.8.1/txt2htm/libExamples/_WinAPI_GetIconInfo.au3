#include <WinAPI.au3>
#include <Constants.au3>

_Main()

Func _Main()
	Local $aInfo, $sInfo = ""
	$aInfo = _WinAPI_GetIconInfo($IDC_WAIT)
	For $x = 0 To UBound($aInfo) - 1
		$sInfo &= $aInfo[$x] & @LF
	Next
	MsgBox(4096, "GetIconInfo", "Icon-Informationen: " & @LF & $sInfo)
EndFunc   ;==>_Main

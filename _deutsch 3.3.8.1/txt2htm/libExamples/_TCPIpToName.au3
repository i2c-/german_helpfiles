#include <array.au3>
#include <inet.au3>

Global $aResult, $sResult, $sIP

; Beispiel 1
TCPStartup()
$sIP = TCPNameToIP("hiddensoft.com")
$sResult = _TCPIpToName($sIP)
If @error Then
	MsgBox(0, "_TCPIpToName()", "@error = " & @error & @LF & "@extended = " & @extended)
Else
	MsgBox(0, "hiddensoft.com ist wirklich:", $sResult)
EndIf

; Beispiel 2
TCPStartup()
$sIP = _GetIP()
$aResult = _TCPIpToName($sIP, 1)
If @error Then
	MsgBox(0, "_TCPIpToName()", "@error = " & @error & @LF & "@extended = " & @extended)
Else
	_ArrayDisplay($aResult, "Lokale(r) Hostname(n)")
EndIf

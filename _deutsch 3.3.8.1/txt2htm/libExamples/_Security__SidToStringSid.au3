#include <Security.au3>

Local $sAccount = @UserName
Local $tSID = _Security__GetAccountSid($sAccount)
Local $sStringSID = _Security__SidToStringSid(DllStructGetPtr($tSID, 1))
MsgBox(0, "SID", "User = " & $sAccount & @CRLF & "SID = " & $sStringSID)

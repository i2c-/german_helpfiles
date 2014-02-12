#include <MsgBoxConstants.au3>

Local $sSubKey = ""

For $i = 1 To 10
	$sSubKey = RegEnumKey("HKEY_LOCAL_MACHINE\SOFTWARE", $i)
	If @error <> 0 Then ExitLoop
	MsgBox($MB_SYSTEMMODAL, "Unterschl&uuml;ssel #" & $i & " unter HKLM\Software: ", $var)
Next

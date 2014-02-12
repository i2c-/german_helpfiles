#include <WinAPI.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hwnd = GUICreate("Beispiel", 200, 200)
	Local $tpoint = DllStructCreate("int X;int Y")
	DllStructSetData($tpoint, "X", 641)
	DllStructSetData($tpoint, "Y", 459)
	GUISetState(@SW_SHOW)
	Sleep(1000)
	_WinAPI_ScreenToClient($hwnd, $tpoint)
	MsgBox($MB_SYSTEMMODAL, "_WINAPI_ClientToScreen-Beispiel", "Die Bildschirmkoordinaten [x = 641, y = 459]" & @CRLF & _
			"entsprechen folgender Position im Client-Bereich:" & @CRLF & @CRLF & _
			@TAB & @TAB & "X: " & DllStructGetData($tpoint, "X") & @CRLF & _
			@TAB & @TAB & "Y: " & DllStructGetData($tpoint, "Y") & @CRLF)
EndFunc   ;==>Example

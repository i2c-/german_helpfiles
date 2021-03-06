#include <MsgBoxConstants.au3>

; Erstellt Callback Funktion
Local $hHandle = DllCallbackRegister("_EnumWindowsProc", "int", "hwnd;lparam")

; EnumWindows aufrufen
DllCall("user32.dll", "int", "EnumWindows", "ptr", DllCallbackGetPtr($hHandle), "lparam", 10)

; L&ouml;scht Callback-Funktion
DllCallbackFree($hHandle)

; Callback Verfahren
Func _EnumWindowsProc($hWnd, $lParam)
	; Falls der Titel leer ist oder das Fenster nicht sichtbar ist, so wird die Aufz&auml;hlung fortgesetzt.
	If WinGetTitle($hWnd) = "" Or BitAND(WinGetState($hWnd), 2) = 0 Then Return 1

	Local $iRes = MsgBox(BitOR($MB_SYSTEMMODAL, $MB_OKCANCEL), _
			WinGetTitle($hWnd), "$hWnd=" & $hWnd & @CRLF & _
			"$lParam=" & $lParam & @CRLF & _
			"$hWnd(type)=" & VarGetType($hWnd))

	If $iRes <> $IDOK Then Return 0 ; Wenn Abbrechen geklickt, R&uuml;ckgabe 0 zum Stoppen der Aufz&auml;hlung

	Return 1 ; R&uuml;ckgabe 1 um die Aufz&auml;hlung fortzusetzten
EndFunc   ;==>_EnumWindowsProc

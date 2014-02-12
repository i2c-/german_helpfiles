#include <MsgBoxConstants.au3>

;Aufrufen einer Funktion, die Parameter ver&auml;ndert
Local $iPID = Run("notepad")

Local $hWnd = WinWait("[CLASS:Notepad]", "", 2000)

If $hWnd = 0 Then
	; Wartezeit abgelaufen.
	Exit MsgBox($MB_SYSTEMMODAL, Default, "Es ist nicht m&ouml;glich den Editor zu starten!")
EndIf

Local $aResult = DllCall("user32.dll", "int", "GetWindowText", "hwnd", $hWnd, "str", "", "int", 32768)
MsgBox($MB_SYSTEMMODAL, Default, "Anzahl zur&uuml;ckgegebener Zeichen: " & $aResult[0])
MsgBox($MB_SYSTEMMODAL, Default, "Text (zur&uuml;ckgegeben in Parameter 2): '" & $aResult[2] & "'")

WinClose($hWnd)

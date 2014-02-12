#include <WinAPI.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $aDevice, $i = 0, $text
	While 1
		$aDevice = _WinAPI_EnumDisplayDevices("", $i)
		If Not $aDevice[0] Then ExitLoop
		$text = "Erfolgreich? " & $aDevice[0] & @CRLF
		$text &= "Ger&auml;t (Adapter oder Monitor): " & $aDevice[1] & @CRLF
		$text &= "Beschreibung (Adapter oder Monitor): " & $aDevice[2] & @CRLF
		$text &= "Ger&auml;testatus-Flag: " & $aDevice[3] & @CRLF
		If BitAND($aDevice[3], 32) Then $text &= @TAB & "- Das Ger&auml;t hat mehr Bildschirm-Modi, als das an seinem Ausgang angeschlossene Ger&auml;t unterst&uuml;tzt." & @CRLF
		If BitAND($aDevice[3], 16) Then $text &= @TAB & "- Das Ger&auml;t ist austauschbar; Es kann nicht das prim&auml;re Anzeigeger&auml;t sein!" & @CRLF
		If BitAND($aDevice[3], 8) Then $text &= @TAB & "- Das Ger&auml;t ist VGA-kompatibel." & @CRLF
		If BitAND($aDevice[3], 4 Then $text &= @TAB & "- Stellt ein Pseudo-Ger&auml;t dar, um Anwendungsausgaben f&uuml;r Fernsteuerzwecke zu spiegeln." & @CRLF
		If BitAND($aDevice[3], 2) Then $text &= @TAB & "- Der prim&auml;re Desktop befindet sich auf diesem Ger&auml;t." & @CRLF
		If BitAND($aDevice[3], 1) Then $text &= @TAB & "- Das Ger&auml;t ist Teil des Desktops." & @CRLF
		$text &= "Plug&Play ID (String): " & $aDevice[4] & @CRLF
		MsgBox($MB_SYSTEMMODAL, "", $text)
		$i += 1
	WEnd
EndFunc   ;==>Example

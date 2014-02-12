#include <WinAPI.au3>

_Main()

Func _Main()
	Local $aDevice, $i = 0, $text
	While 1
		$aDevice = _WinAPI_EnumDisplayDevices("", $i)
		If Not $aDevice[0] Then ExitLoop
		$text = "Erfolgreich? " & $aDevice[0] & @LF
		$text &= "Ger&auml;t (Adapter oder Monitor): " & $aDevice[1] & @LF
		$text &= "Beschreibung (Adapter oder Monitor): " & $aDevice[2] & @LF
		$text &= "Ger&auml;testatus-Flag: " & $aDevice[3] & @LF
		If BitAND($aDevice[3], 32) Then $text &= @TAB & "- Das Ger&auml;t hat mehr Bildschirm-Modi, als das an seinem Ausgang angeschlossene Ger&auml;t unterst&uuml;tzt." & @LF
		If BitAND($aDevice[3], 16) Then $text &= @TAB & "- Das Ger&auml;t ist austauschbar; Es kann nicht das prim&auml;re Anzeigeger&auml;t sein!" & @LF
		If BitAND($aDevice[3], 8) Then $text &= @TAB & "- Das Ger&auml;t ist VGA-kompatibel." & @LF
		If BitAND($aDevice[3], 4 Then $text &= @TAB & "- Stellt ein Pseudo-Ger&auml;t dar, um Anwendungsausgaben f&uuml;r Fernsteuerzwecke zu spiegeln." & @LF
		If BitAND($aDevice[3], 2) Then $text &= @TAB & "- Der prim&auml;re Desktop befindet sich auf diesem Ger&auml;t." & @LF
		If BitAND($aDevice[3], 1) Then $text &= @TAB & "- Das Ger&auml;t ist Teil des Desktops." & @LF
		$text &= "Plug&Play ID (String): " & $aDevice[4] & @LF
		MsgBox(0, "", $text)
		$i += 1
	WEnd
EndFunc   ;==>_Main

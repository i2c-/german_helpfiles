; *******************************************************
; Beispiel 1 - Erstellt eine Internet-Explorer-Instanz und l&auml;dt eine Internetseite,
;				anschlie&szlig;end wird 5 Sekunden gewartet und eine andere Internetseite geladen
;				anschlie&szlig;end wird 5 Sekunden gewartet und eine andere Internetseite geladen
; *******************************************************

#include <IE.au3>

Local $oIE = _IECreate("www.autoitscript.com")
Sleep(5000)
_IENavigate($oIE, "http://www.autoitscript.com/forum/index.php?")
Sleep(5000)
_IENavigate($oIE, "http://www.autoitscript.com/forum/index.php?showforum=9")

; *******************************************************
; Beispiel 2 - Erstellt eine Internet-Explorer-Instanz und l&auml;dt eine Internetseite,
;				es wird nicht gewartet bis die Internetseite geladen wurde, sondern sofort mit der n&auml;chsten Zeile im Skript fortgefahren
; *******************************************************

#include <IE.au3>

$oIE = _IECreate("www.autoitscript.com", 0)
MsgBox(0, "_IENavigate()", "Diese Code-Zeile wird sofort ausgef&uuml;hrt")

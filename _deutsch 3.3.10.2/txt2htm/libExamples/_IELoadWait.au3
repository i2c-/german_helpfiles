#include <IE.au3>

; &Ouml;ffnet das AutoIt-Forum und springt per Tab zu "Neue Beitr&auml;ge" startet den Link durch dr&uuml;cken der Enter-Taste
; Dann wird gewartet bis die Seite komplett geladen wurde, bevor das Skript weiterl&auml;uft.

Local $oIE = _IECreate("http://www.autoitscript.com/forum/index.php")
Send("{TAB 12}")
Send("{ENTER}")
_IELoadWait($oIE)

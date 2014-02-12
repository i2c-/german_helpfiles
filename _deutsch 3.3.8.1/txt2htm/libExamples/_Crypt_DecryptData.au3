#include <Crypt.au3>

Local Const $sUserKey = "CryptPassword" ; Deklariert eine Passwort-Zeichenfolge um die Daten zu ver- und entschl&uuml;sseln.
Local $sData = "...vor einer Zeit gab es eine Sprache mit nicht-standardisierten Kryptographie-Funktionen. Diese Sprache gibt es nicht mehr." ; Dieser Text wird verschl&uuml;sselt werden.

Local $bEncrypted = _Crypt_EncryptData($sData, $sUserKey, $CALG_RC4) ; Verschl&uuml;sselt den Text mit Hilfe der generischen Passwort-Zeichenfolge.

$bEncrypted = _Crypt_DecryptData($bEncrypted, $sUserKey, $CALG_RC4) ; Entschl&uuml;sselt den Text mit Hilfe der generischen Passwort-Zeichenfolge. Der R&uuml;ckgabewert ist ein Bin&auml;rstring.
MsgBox(0, "Entschl&uuml;sselter Text", BinaryToString($bEncrypted)) ; Konvertiert den Bin&auml;rstring mit Hilfe BinaryToString um den Ausgangstext anzuzeigen, den wir verschl&uuml;sselten.

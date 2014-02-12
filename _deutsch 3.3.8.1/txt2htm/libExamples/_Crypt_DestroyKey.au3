#include <Crypt.au3>

Local $aStringsToEncrypt[6] = ["AutoIt", "SciTE", "Crypt", ".au3", 42, "42"]
Local $sOutput = ""

Local $hKey = _Crypt_DeriveKey("CryptPassword", $CALG_RC4) ; Ein Passwort und eine Verschl&uuml;sselungsmethode angeben um den kryptografischen Schl&uuml;ssel zu generieren.

For $iWord In $aStringsToEncrypt
	$sOutput &= $iWord & @TAB & " = " & _Crypt_EncryptData($iWord, $hKey, $CALG_USERKEY) & @CRLF ; Text mit dem erzeugten Schl&uuml;ssel verschl&uuml;sseln.
Next

MsgBox(0, "Verschl&uuml;sselte Daten", $sOutput)

_Crypt_DestroyKey($hKey) ; L&ouml;schen des Schl&uuml;ssels.

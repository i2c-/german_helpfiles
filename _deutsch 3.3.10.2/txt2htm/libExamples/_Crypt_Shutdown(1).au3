#include <Crypt.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	_Crypt_Startup() ; Vorheriges Starten der Crypt-Bibliothek f&uuml;r mehr Performance.

	Local $sData = "...war einmal eine Programmiersprache ohne kryptografische Funktionen. Jetzt gibt es sie nicht mehr." ; Datenstring zum hashen.

	Local $sOutput = "Im Folgenden sind die Ergebnisse von allen verf&uuml;gbaren Algorithmen aufgeslistet: " & @CRLF & @CRLF & _
			"Text: " & $sData & @CRLF & _
			"MD2: " & _Crypt_HashData($sData, $CALG_MD2) & @CRLF & _
			"MD4: " & _Crypt_HashData($sData, $CALG_MD4) & @CRLF & _
			"MD5: " & _Crypt_HashData($sData, $CALG_MD5) & @CRLF & _
			"SHA1: " & _Crypt_HashData($sData, $CALG_SHA1)

	MsgBox($MB_SYSTEMMODAL, "Ergebnisse", $sOutput)

	_Crypt_Shutdown() ; Beenden der Crypt-Bibliothek
EndFunc   ;==>Example

#include <Crypt.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WinAPI.au3>
#include <WindowsConstants.au3>

Global $hKey = -1, $iInputEdit = -1, $iOutputEdit = -1

GUICreate("Echtzeit Verschl&uuml;sselung", 400, 320)
$iInputEdit = GUICtrlCreateEdit("", 0, 0, 400, 150, $ES_WANTRETURN)
$iOutputEdit = GUICtrlCreateEdit("", 0, 150, 400, 150, $ES_READONLY)
Local $iCombo = GUICtrlCreateCombo("", 0, 300, 100, 20, $CBS_DROPDOWNLIST)
GUICtrlSetData(-1, "3DES|AES (128bit)|AES (192bit)|AES (256bit)|DES|RC2|RC4", "RC4")
GUIRegisterMsg($WM_COMMAND, "WM_COMMAND")
GUISetState(@SW_SHOW)

_Crypt_Startup() ; Startet die Crypt-Bibliothek um die Performance zu optimieren.

Local $bAlgorithm = $CALG_RC4
$hKey = _Crypt_DeriveKey("CryptPassword", $bAlgorithm) ; Deklariert eine Passwort-Zeichenkette und einen Algorithmus um einen kryptographischen Schl&uuml;ssel zu erzeugen.

While 1
	Switch GUIGetMsg()
		Case $GUI_EVENT_CLOSE
			Exit

		Case $iCombo ; Pr&uuml;ft, wann die Combobox ausgew&auml;hlt ist und ruft den richtigen Algorithmus ab.
			Switch GUICtrlRead($iCombo) ; Liest das ausgew&auml;hlte Element der Combobox aus.
				Case "3DES"
					$bAlgorithm = $CALG_3DES

				Case "AES (128bit)"
					If @OSVersion = "WIN_2000" Then
						MsgBox(16, "Fehler", "Sorry, dieser Algorithmus ist unter Windows 2000 nicht verf&uuml;gbar.") ; Zeigt einen Fehler, falls das verwendete Betriebssystem Windows 2000 ist.
						ContinueLoop
					EndIf
					$bAlgorithm = $CALG_AES_128

				Case "AES (192bit)"
					If @OSVersion = "WIN_2000" Then
						MsgBox(16, "Fehler", "Sorry, dieser Algorithmus ist unter Windows 2000 nicht verf&uuml;gbar.")
						ContinueLoop
					EndIf
					$bAlgorithm = $CALG_AES_192

				Case "AES (256bit)"
					If @OSVersion = "WIN_2000" Then
						MsgBox(16, "Fehler", "Sorry, dieser Algorithmus ist unter Windows 2000 nicht verf&uuml;gbar.")
						ContinueLoop
					EndIf
					$bAlgorithm = $CALG_AES_256

				Case "DES"
					$bAlgorithm = $CALG_DES

				Case "RC2"
					$bAlgorithm = $CALG_RC2

				Case "RC4"
					$bAlgorithm = $CALG_RC4

			EndSwitch

			_Crypt_DestroyKey($hKey) ; Zerst&ouml;rt den kryptographischen Schl&uuml;ssel.
			$hKey = _Crypt_DeriveKey("CryptPassword", $bAlgorithm) ; Deklariert wieder eine Passwort-Zeichenkette und einen Algorithmus um einen neuen kryptographischen Schl&uuml;ssel zu erzeugen.

			Local $sRead = GUICtrlRead($iInputEdit)
			If StringStripWS($sRead, 8) <> "" Then ; Pr&uuml;ft, ob ein Text zum Verschl&uuml;ssen vorhanden ist.
				Local $bEncrypted = _Crypt_EncryptData($sRead, $hKey, $CALG_USERKEY) ; Verschl&uuml;sselt den Text mit dem neuen kryptographischen Schl&uuml;ssel.
				GUICtrlSetData($iOutputEdit, $bEncrypted) ; Gibt den verschl&uuml;sselten Text in dem Ausgabe-Editfeld aus.
			EndIf
	EndSwitch
WEnd

_Crypt_DestroyKey($hKey) ; Zerst&ouml;rt den kryptographischen Schl&uuml;ssel.
_Crypt_Shutdown() ; Beendet die Crypt-Bibliothek.

Func WM_COMMAND($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $lParam

	Switch _WinAPI_LoWord($wParam)
		Case $iInputEdit
			Switch _WinAPI_HiWord($wParam)
				Case $EN_CHANGE
					Local $bEncrypted = _Crypt_EncryptData(GUICtrlRead($iInputEdit), $hKey, $CALG_USERKEY) ; Verschl&uuml;sselt den Text mit dem kryptographischem Schl&uuml;ssel.
					GUICtrlSetData($iOutputEdit, $bEncrypted) ; Gibt den verschl&uuml;sselten Text in dem Ausgabe-Editfeld aus.
			EndSwitch
	EndSwitch
EndFunc   ;==>WM_COMMAND

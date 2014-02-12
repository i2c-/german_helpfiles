#include <Crypt.au3>
#include <ComboConstants.au3>
#include <GUIConstantsEx.au3>

Local $bAlgorithm = $CALG_SHA1

GUICreate("Datei Hash", 425, 70)
Local $iInput = GUICtrlCreateInput(@ScriptFullPath, 5, 5, 200, 20)
Local $iBrowse = GUICtrlCreateButton("...", 210, 5, 35, 20)
Local $iCombo = GUICtrlCreateCombo("", 250, 5, 100, 20, $CBS_DROPDOWNLIST)
GUICtrlSetData(-1, "MD2|MD4|MD5|SHA1", "SHA1")
Local $iCalculate = GUICtrlCreateButton("Berechnen", 355, 40, 65, 25)
Local $iHashLabel = GUICtrlCreateLabel("Hash", 5, 50, 350, 25)
GUISetState(@SW_SHOW)

_Crypt_Startup() ; Vorheriges Starten der Crypt-Bibliothek f&uuml;r mehr Performance.

While 1
	Switch GUIGetMsg()
		Case $GUI_EVENT_CLOSE
			Exit

		Case $iBrowse
			Local $sFilePath = FileOpenDialog("&Ouml;ffnen...", "", "Alle Dateien (*.*)") ; Datei zum hashen ausw&auml;hlen.
			If @error Then
				ContinueLoop
			EndIf
			GUICtrlSetData($iInput, $sFilePath) ; Dateipfad in Inputbox ausgeben.
			GUICtrlSetData($iHashLabel, "Hash") ; Label f&uuml;r Hash-Ouput zur&uuml;cksetzen.

		Case $iCombo ; Status der Combobox abfragen und gew&auml;hlte Methode empfangen.
			Switch GUICtrlRead($iCombo) ; Combobox auslesen.
				Case "MD2"
					$bAlgorithm = $CALG_MD2

				Case "MD4"
					$bAlgorithm = $CALG_MD4

				Case "MD5"
					$bAlgorithm = $CALG_MD5

				Case "SHA1"
					$bAlgorithm = $CALG_SHA1

			EndSwitch

		Case $iCalculate
			Local $sRead = GUICtrlRead($iInput)
			If StringStripWS($sRead, 8) <> "" And FileExists($sRead) Then ; Pr&uuml;fen ob eine Datei angegeben ist.
				Local $bHash = _Crypt_HashFile($sRead, $bAlgorithm) ; Hash der Datei erstellen.
				GUICtrlSetData($iHashLabel, $bHash) ; Hash im Label ausgeben.
			EndIf
	EndSwitch
WEnd

_Crypt_Shutdown() ; Beenden

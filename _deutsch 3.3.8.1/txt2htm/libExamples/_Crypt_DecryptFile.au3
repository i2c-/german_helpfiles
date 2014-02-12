#include <Crypt.au3>
#include <ComboConstants.au3>
#include <GUIConstantsEx.au3>

Local $bAlgorithm = $CALG_RC4
Local $sFilePath = ""

GUICreate("Datei Entschl&uuml;sseln", 425, 100)
Local $iSourceInput = GUICtrlCreateInput("", 5, 5, 200, 20)
Local $iSourceBrowse = GUICtrlCreateButton("...", 210, 5, 35, 20)

Local $iDestinationInput = GUICtrlCreateInput("", 5, 30, 200, 20)
Local $iDestinationBrowse = GUICtrlCreateButton("...", 210, 30, 35, 20)

GUICtrlCreateLabel("Passwort:", 5, 60, 200, 20)
Local $iPasswordInput = GUICtrlCreateInput("", 5, 75, 200, 20)

Local $iCombo = GUICtrlCreateCombo("", 210, 75, 100, 20, $CBS_DROPDOWNLIST)
GUICtrlSetData(-1, "3DES|AES (128bit)|AES (192bit)|AES (256bit)|DES|RC2|RC4", "RC4")
Local $iDecrypt = GUICtrlCreateButton("Entschl&uuml;sseln", 345, 70, 75, 25)
GUISetState(@SW_SHOW)

While 1
	Switch GUIGetMsg()
		Case $GUI_EVENT_CLOSE
			Exit

		Case $iSourceBrowse
			$sFilePath = FileOpenDialog("Select a file to decrypt.", "", "All files (*.*)") ; Datei zum Entschl&uuml;sseln ausw&auml;hlen.
			If @error Then
				ContinueLoop
			EndIf
			GUICtrlSetData($iSourceInput, $sFilePath) ; Pfad in der Inputbox anzeigen.

		Case $iDestinationBrowse
			$sFilePath = FileSaveDialog("Save the file as ...", "", "All files (*.*)") ; Datei ausw&auml;hlen, um die entschl&uuml;sselten Daten zu speichern.
			If @error Then
				ContinueLoop
			EndIf
			GUICtrlSetData($iDestinationInput, $sFilePath) ; Pfad in der 2. Inputbox anzeigen.

		Case $iCombo ; Status der Combobox abfragen und die ausgew&auml;hlte Verschl&uuml;sselungsmethode empfangen.
			Switch GUICtrlRead($iCombo) ; Auslesen der Combobox.
				Case "3DES"
					$bAlgorithm = $CALG_3DES

				Case "AES (128bit)"
					If @OSVersion = "WIN_2000" Then
						MsgBox(16, "Error", "Diese Methode ist unter Windows 2000 nicht verf&uuml;gbar.") ; Error ausgeben, wenn Windows 2000 verwendet wird.
						ContinueLoop
					EndIf
					$bAlgorithm = $CALG_AES_128

				Case "AES (192bit)"
					If @OSVersion = "WIN_2000" Then
						MsgBox(16, "Error", "Diese Methode ist unter Windows 2000 nicht verf&uuml;gbar.")
						ContinueLoop
					EndIf
					$bAlgorithm = $CALG_AES_192

				Case "AES (256bit)"
					If @OSVersion = "WIN_2000" Then
						MsgBox(16, "Error", "Diese Methode ist unter Windows 2000 nicht verf&uuml;gbar.")
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

		Case $iDecrypt
			Local $sSourceRead = GUICtrlRead($iSourceInput) ; Quelldateipfad einlesen.
			Local $sDestinationRead = GUICtrlRead($iDestinationInput) ; Zieldateipfad einlesen.
			Local $sPasswordRead = GUICtrlRead($iPasswordInput) ; Passwort-Input auslesen.
			If StringStripWS($sSourceRead, 8) <> "" And StringStripWS($sDestinationRead, 8) <> "" And StringStripWS($sPasswordRead, 8) <> "" And FileExists($sSourceRead) Then ; Pr&uuml;fen ob eine Datei und ein Passwort gegeben sind.
				Local $iSuccess = _Crypt_DecryptFile($sSourceRead, $sDestinationRead, $sPasswordRead, $bAlgorithm) ; Entschl&uuml;sseln der Datei.
				If $iSuccess Then
					MsgBox(0, "Success", "Operation succeeded.")
				Else
					Switch @error
						Case 1
							MsgBox(16, "Error", "Erstellen des Schl&uuml;ssels fehlgeschlagen.")
						Case 2
							MsgBox(16, "Error", "Quelldatei konnte nicht ge&ouml;ffnet werden.")
						Case 3
							MsgBox(16, "Error", "Zieldatei konnte nicht ge&ouml;ffnet werden.")
						Case 4 Or 5
							MsgBox(16, "Error", "Allgemeiner Entschl&uuml;sselungsfehler.")
					EndSwitch
				EndIf
			Else
				MsgBox(16, "Error", "Die angegebenen Information sind fehlerhaft.")
			EndIf
	EndSwitch
WEnd

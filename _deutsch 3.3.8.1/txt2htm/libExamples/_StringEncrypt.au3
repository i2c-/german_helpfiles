#include <GuiConstantsEx.au3>
#include <String.au3>

_Main()

Func _Main()
	Local $WinMain, $EditText, $InputPass, $InputLevel, $EncryptButton, $DecryptButton, $string
	; GUI und String Sachen
	$WinMain = GUICreate('Verschl&uuml;sselungsprogramm', 400, 400)
	; Erstellt ein Fenster
	$EditText = GUICtrlCreateEdit('', 5, 5, 380, 350)
	; Erstellt das Haupt-Edit-Feld
	$InputPass = GUICtrlCreateInput('', 5, 360, 100, 20, 0x21)
	; Erstellt das Passwortfeld mit der versteckten zentrierten Eingabe
	$InputLevel = GUICtrlCreateInput(1, 110, 360, 50, 20, 0x2001)
	GUICtrlSetLimit(GUICtrlCreateUpdown($InputLevel), 10, 1)
	; Dies erstellt die Stufeneingabe mit Hoch|Runter-F&auml;higkeit
	$EncryptButton = GUICtrlCreateButton('Verschl&uuml;sseln', 170, 360, 105, 35)
	; Encryptbutton
	$DecryptButton = GUICtrlCreateButton('Entschl&uuml;sseln', 285, 360, 105, 35)
	; Decryptbutton
	GUICtrlCreateLabel('Passwort', 5, 385)
	GUICtrlCreateLabel('Stufe', 110, 385)
	; Einfache Textlabels
	GUISetState()
	; Zeigt das Fenster

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $EncryptButton
				GUISetState(@SW_DISABLE, $WinMain) ; Bewahrt vor jeglichen &Auml;nderungen
				$string = GUICtrlRead($EditText) ; Speichert den Inhalt der Editbox f&uuml;r sp&auml;ter
				GUICtrlSetData($EditText, "Bitte warten w&auml;hrend der Text verschl&uuml;sselt bzw. entschl&uuml;sselt wird.") ; Freundliche Nachricht
				GUICtrlSetData($EditText, _StringEncrypt(1, $string, GUICtrlRead($InputPass), GUICtrlRead($InputLevel)))
				; Ruft das Verschl&uuml;sseln auf. Setzt die Daten der Editbox mit dem verschl&uuml;sselten String
				; Das Verschl&uuml;sseln beginnt mit 1/0 um mitzuteilen ob es verschl&uuml;sselt/entschl&uuml;sselt wird
				; Das Verschl&uuml;sseln hat dann den String welchen man f&uuml;r sp&auml;ter von der Editbox gespeichert hat
				; Dann wird die Passwort-Box und die Levelbox gelesen
				GUISetState(@SW_ENABLE, $WinMain) ; Dies holt das Fenster zur&uuml;ck
			Case $DecryptButton
				GUISetState(@SW_DISABLE, $WinMain) ; Bewahrt vor jeglichen &Auml;nderung
				$string = GUICtrlRead($EditText) ; Speichert den Inhalt der Editbox f&uuml;r sp&auml;ter
				GUICtrlSetData($EditText, "Bitte warten w&auml;hrend der Text verschl&uuml;sselt bzw. entschl&uuml;sselt wird.") ; Freundliche Nachricht
				GUICtrlSetData($EditText, _StringEncrypt(0, $string, GUICtrlRead($InputPass), GUICtrlRead($InputLevel)))
				; Ruft das Entschl&uuml;sseln auf. Setzt die Daten der Editbox mit dem entschl&uuml;sselten String
				; Das Entschl&uuml;sseln beginnt mit 1/0 um mitzuteilen ob es verschl&uuml;sselt/entschl&uuml;sselt wird
				; Das Entschl&uuml;sseln hat dann den String welchen man f&uuml;r sp&auml;ter von der Editbox gespeichert hat
				; Dann wird die Passwort-Box und die Stufen-Box gelesen
				GUISetState(@SW_ENABLE, $WinMain) ; Dies holt das Fenster zur&uuml;ck
		EndSwitch
	WEnd ; L&auml;uft, bis das Fenster geschlossen wird
	Exit
EndFunc   ;==>_Main

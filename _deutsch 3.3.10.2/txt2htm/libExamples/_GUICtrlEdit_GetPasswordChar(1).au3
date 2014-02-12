#include <GuiEdit.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hEdit

	; Erstellt eine GUI
	GUICreate("Edit: Ermittelt das Passwortzeichen", 400, 300)
	$hEdit = GUICtrlCreateInput("Test des eingebauten PW-Eingabe-Controls", 2, 2, 394, 25, $ES_PASSWORD)
	GUISetState(@SW_SHOW)

	MsgBox(8192 + 64, "Information", "Passwortzeichen: " & _GUICtrlEdit_GetPasswordChar($hEdit))

	_GUICtrlEdit_SetPasswordChar($hEdit, "$") ; &Auml;ndert das Passwortzeichen in $

	MsgBox(8192 + 64, "Information", "Passwortzeichen: " & _GUICtrlEdit_GetPasswordChar($hEdit))

	_GUICtrlEdit_SetPasswordChar($hEdit) ; Zeigt die eingegebenen Zeichen im Klartext an

	MsgBox(8192 + 64, "Information", "Passwortzeichen: " & _GUICtrlEdit_GetPasswordChar($hEdit))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

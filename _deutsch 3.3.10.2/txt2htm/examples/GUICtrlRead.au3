#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $menu1, $n1, $n2, $msg, $menustate, $menutext

	GUICreate("Mein GUICtrlRead") ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	$menu1 = GUICtrlCreateMenu("Datei")

	$n1 = GUICtrlCreateList("", 10, 10, -1, 100)
	GUICtrlSetData(-1, "Eintrag1|Eintrag2|Eintrag3", "Eintrag2")

	$n2 = GUICtrlCreateButton("Lesen", 10, 150, 50)
	GUICtrlSetState(-1, $GUI_FOCUS) ; Der Fokus liegt auf diesem Button

	GUISetState(@SW_SHOW) ; Zeigt das leere GUI-Fenster

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
		$msg = GUIGetMsg()
		If $msg = $n2 Then
			MsgBox($MB_SYSTEMMODAL, "Ausgew&auml;hlter Listbox-Eintrag", GUICtrlRead($n1)) ; Zeigt den ausgew&auml;hlten Listbox-Eintrag an
			$menustate = GUICtrlRead($menu1) ; R&uuml;ckgabe des Zustandes des Men&uuml;punktes
			$menutext = GUICtrlRead($menu1, 1) ; R&uuml;ckgabe des Textes des Men&uuml;punktes
			MsgBox($MB_SYSTEMMODAL, "Status und Text des Men&uuml;punktes", "Status:" & $menustate & @CRLF & "Text:" & $menutext)
		EndIf
	Until $msg = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

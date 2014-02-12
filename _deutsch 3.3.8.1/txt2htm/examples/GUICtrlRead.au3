#include <GUIConstantsEx.au3>

Example()
Example2()

Func Example()
	Local $menu1, $n1, $n2, $msg, $menustate, $menutext

	GUICreate("Mein GUICtrlRead") ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	$menu1 = GUICtrlCreateMenu("Datei")

	$n1 = GUICtrlCreateList("", 10, 10, -1, 100)
	GUICtrlSetData(-1, "Eintrag1|Eintrag2|Eintrag3", "Eintrag2")

	$n2 = GUICtrlCreateButton("Lesen", 10, 150, 50)
	GUICtrlSetState(-1, $GUI_FOCUS) ; Der Fokus liegt auf diesem Button

	GUISetState() ; Zeigt das leere GUI-Fenster
	; F&uuml;hrt das GUI aus, bis der Dialog geschlossen wird
	Do
		$msg = GUIGetMsg()
		If $msg = $n2 Then
			MsgBox(0, "Ausgew&auml;hlter Listbox-Eintrag", GUICtrlRead($n1)) ; Zeigt den ausgew&auml;hlten Listbox-Eintrag an
			$menustate = GUICtrlRead($menu1) ; R&uuml;ckgabe des Zustandes des Men&uuml;punktes
			$menutext = GUICtrlRead($menu1, 1) ; R&uuml;ckgabe des Textes des Men&uuml;punktes
			MsgBox(0, "Status und Text des Men&uuml;punktes", "Status:" & $menustate & @LF & "Text:" & $menutext)
		EndIf
	Until $msg = $GUI_EVENT_CLOSE
EndFunc   ;==>Example




Func Example2()
	GUICreate("Mein GUICtrlRead 2", 200, 50) ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird
	$checkbox1 = GUICtrlCreateCheckbox("Text 1", 10, 10)

	$label1 = GUICtrlCreateLabel("", 100, 13, 100, 20)

	GUISetState() ; Zeigt das leere GUI-Fenster

	Do
		$msg = GUIGetMsg()
		If $msg = $checkbox1 Then
			$status = BitAND(GUICtrlRead($checkbox1), $GUI_CHECKED)
			If $status = 1 Then $status &= "   (checked)"
			If $status = 0 Then $status &= "   (unchecked)"
			GUICtrlSetData($label1, $status)
		EndIf
	Until $msg = $GUI_EVENT_CLOSE
EndFunc   ;==>Example2

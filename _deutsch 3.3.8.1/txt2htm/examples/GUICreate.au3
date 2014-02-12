#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Example1()
Example2()

; Beispiel 1
Func Example1()
	Local $msg

	GUICreate("Meine GUI") ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird
	GUISetState(@SW_SHOW) ; Zeigt das leere GUI-Fenster

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		$msg = GUIGetMsg()

		If $msg = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd
	GUIDelete()
EndFunc   ;==>Example1

; Beispiel 2
Func Example2()
	Local $sFile = "..\GUI\logo4.gif"

	Local $gui = GUICreate("Hintergrund", 400, 100)

	; Hintergrundbild
	GUICtrlCreatePic("..\GUI\msoobe.jpg", 0, 0, 400, 100)

	; Transparentes MDI Child Fenster
	GUICreate("", 169, 68, 20, 20, $WS_POPUP, BitOR($WS_EX_LAYERED, $WS_EX_MDICHILD), $gui)

	; Transparentes Bild
	GUICtrlCreatePic($sFile, 0, 0, 169, 68)
	GUISetState(@SW_SHOW)

	Do
		Local $msg = GUIGetMsg()

	Until $msg = $GUI_EVENT_CLOSE
EndFunc   ;==>Example2

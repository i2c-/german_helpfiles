#include <GUIConstantsEx.au3>
#include <ButtonConstants.au3>
#include <MsgBoxConstants.au3>

; Rechtsklick im Anwendungsbereich, um Kontextmen&uuml; anzuzeigen.
; Rechtsklick auf den "OK" Button, um ein Control-spezifisches Kontextmen&uuml; anzuzeigen.

Example()

Func Example()
	GUICreate("Mein GUI Kontextmen&uuml;", 300, 200)

	Local $contextmenu = GUICtrlCreateContextMenu()

	Local $newsubmenu = GUICtrlCreateMenu("Neu", $contextmenu)
	GUICtrlCreateMenuitem("Text", $newsubmenu)

	Local $button = GUICtrlCreateButton("OK", 100, 100, 70, 20)
	Local $buttoncontext = GUICtrlCreateContextMenu($button)
	Local $MenuAbout = GUICtrlCreateMenuitem("&Uuml;ber Button", $buttoncontext)

	Local $MenuOpen = GUICtrlCreateMenuitem("&Ouml;ffnen", $contextmenu)
	Local $MenuSave = GUICtrlCreateMenuitem("Speichern", $contextmenu)
	GUICtrlCreateMenuitem("", $contextmenu) ; Trennstrich

	Local $MenuInfo = GUICtrlCreateMenuitem("Info", $contextmenu)

	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Local $iMsg = 0
	While 1
		$iMsg = GUIGetMsg()

		If $iMsg = $GUI_EVENT_CLOSE Then ExitLoop
		If $iMsg = $MenuAbout Then MsgBox($MB_SYSTEMMODAL, "Men&uuml; ausgew&auml;hlt", '&Uuml;ber')
		If $iMsg = $MenuOpen Then MsgBox($MB_SYSTEMMODAL, "Men&uuml; ausgew&auml;hlt", '&Ouml;ffnen')
		If $iMsg = $MenuSave Then MsgBox($MB_SYSTEMMODAL, "Men&uuml; ausgew&auml;hlt", 'Speichern')
		If $iMsg = $MenuInfo Then MsgBox($MB_SYSTEMMODAL, "Men&uuml; ausgew&auml;hlt", 'Info')
	WEnd
	GUIDelete()
EndFunc   ;==>Example

; Eine einfache benutzerdefinierte Nachrichtenbox, welche den MessageLoop-Modus verwendet

#include <GUIConstantsEx.au3>

GUICreate("Benutzerdefinierte Msgbox", 270, 80)

GUICtrlCreateLabel("Bitte klicke einen Button an!", 70, 10)
Local $YesID = GUICtrlCreateButton("Ja", 40, 50, 50, 20)
Local $NoID = GUICtrlCreateButton("Nein", 110, 50, 50, 20)
Local $ExitID = GUICtrlCreateButton("Beenden", 180, 50, 50, 20)

; Weist bestimmten Buttons Schnellzugriffstasten zu (f&uuml;r Strg+y und Strg+n)
Local $AccelKeys[2][2] = [["^y", $YesID],["^n", $NoID]]
GUISetAccelerators($AccelKeys)

GUISetState() ; Zeigt die GUI an

Do
	Local $msg = GUIGetMsg()

	Select
		Case $msg = $YesID
			MsgBox(0, "Bet&auml;tigter Button", "Ja")
		Case $msg = $NoID
			MsgBox(0, "Bet&auml;tigter Button", "Nein")
		Case $msg = $ExitID
			MsgBox(0, "Bet&auml;tigter Button", "Beenden")
		Case $msg = $GUI_EVENT_CLOSE
			MsgBox(0, "Bet&auml;tigter Button", "Schlie&szlig;en")
	EndSelect
Until $msg = $GUI_EVENT_CLOSE Or $msg = $ExitID

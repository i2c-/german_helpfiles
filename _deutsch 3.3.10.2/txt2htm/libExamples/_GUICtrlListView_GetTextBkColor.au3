#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <ColorConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hListView

	GUICreate("ListView: Ermittelt die Texthintergrundfarbe", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Setzt die Farben
	_GUICtrlListView_SetBkColor($hListView, $CLR_MONEYGREEN)
	_GUICtrlListView_SetTextColor($hListView, $CLR_BLACK)
	_GUICtrlListView_SetTextBkColor($hListView, $CLR_MONEYGREEN)

	; F&uuml;gt die Spalten hinzu
	_GUICtrlListView_AddColumn($hListView, "Items", 100)

	; F&uuml;gt die Items hinzu
	_GUICtrlListView_BeginUpdate($hListView)
	For $iI = 1 To 10
		_GUICtrlListView_AddItem($hListView, "Item " & $iI)
	Next
	_GUICtrlListView_EndUpdate($hListView)

	; Zeigt die Farben
	MsgBox($MB_SYSTEMMODAL, "Information", "Hintergrundfarbe ....: " & _GUICtrlListView_GetBkColor($hListView) & @CRLF & _
			"Textfarbe .............: " & _GUICtrlListView_GetTextColor($hListView) & @CRLF & _
			"Texthintergrundfarbe: " & _GUICtrlListView_GetTextBkColor($hListView))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

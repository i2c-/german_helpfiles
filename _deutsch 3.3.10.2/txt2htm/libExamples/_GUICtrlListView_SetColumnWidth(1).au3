#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hListView

	GUICreate("ListView: Setzt die Spaltenbreite", 400, 300)
	$hListView = GUICtrlCreateListView("Spalte 1|Spalte 2|Spalte 3|Spalte 4", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; &Auml;ndert die Breite von Spalte 1
	MsgBox($MB_SYSTEMMODAL, "Information", "Spalte 1 Breite: " & _GUICtrlListView_GetColumnWidth($hListView, 0))
	_GUICtrlListView_SetColumnWidth($hListView, 0, 150)
	MsgBox($MB_SYSTEMMODAL, "Information", "Spalte 1 Breite: " & _GUICtrlListView_GetColumnWidth($hListView, 0))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	GUIDelete()
EndFunc   ;==>Example

#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>



Func Example()
	Local $hListView

	GUICreate("ListView: Ermittelt die ausgew&auml;hlte Spalte", 400, 300)
	$hListView = GUICtrlCreateListView("Spalte 1|Spalte 2|Spalte 3", 2, 2, 394, 268)
	GUICtrlCreateListViewItem("Zeile1|Daten1|mehr1", $hListView)
	GUICtrlCreateListViewItem("Zeile2|Daten2|mehr2", $hListView)
	GUICtrlCreateListViewItem("Zeile3|Daten3|mehr3", $hListView)
	GUICtrlCreateListViewItem("Zeile4|Daten4|mehr4", $hListView)
	GUICtrlCreateListViewItem("Zeile5|Daten5|mehr5", $hListView)
	GUISetState(@SW_SHOW)

	; W&auml;hlt Spalte 2 aus
	_GUICtrlListView_SetSelectedColumn($hListView, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", "Ausgew&auml;hlte Spalte: " & _GUICtrlListView_GetSelectedColumn($hListView))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

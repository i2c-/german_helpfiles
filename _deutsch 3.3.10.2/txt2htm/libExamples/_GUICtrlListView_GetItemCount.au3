#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hListView

	GUICreate("ListView: Ermittelt die Anzahl der Items", 400, 300)
	$hListView = GUICtrlCreateListView("Spalte1|Spalte2|Spalte3", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	GUICtrlCreateListViewItem("Zeile1|Daten1|mehr1", $hListView)
	GUICtrlCreateListViewItem("Zeile2|Daten2|mehr2", $hListView)
	GUICtrlCreateListViewItem("Zeile3|Daten3|mehr3", $hListView)
	GUICtrlCreateListViewItem("Zeile4|Daten4|mehr4", $hListView)
	GUICtrlCreateListViewItem("Zeile5|Daten5|mehr5", $hListView)

	MsgBox($MB_SYSTEMMODAL, "Information", "Anzahl der Items: " & _GUICtrlListView_GetItemCount($hListView))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	GUIDelete()
EndFunc   ;==>Example

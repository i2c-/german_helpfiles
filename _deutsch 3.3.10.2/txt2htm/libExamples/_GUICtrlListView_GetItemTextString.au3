#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hListView

	GUICreate("ListView: Ermittelt den Itemtext (String)", 400, 300)

	$hListView = GUICtrlCreateListView("Spalte1|Spalte2|Spalte3", 2, 2, 394, 268)
	GUICtrlCreateListViewItem("Zeile1|Daten1|mehr1", $hListView)
	GUICtrlCreateListViewItem("Zeile2|Daten2|mehr2", $hListView)
	GUICtrlCreateListViewItem("Zeile3|Daten3|mehr3", $hListView)
	GUICtrlCreateListViewItem("Zeile4|Daten4|mehr4", $hListView)
	GUICtrlCreateListViewItem("Zeile5|Daten5|mehr5", $hListView)
	GUISetState(@SW_SHOW)

	MsgBox($MB_SYSTEMMODAL, "Information", "Text von Item 2: " & @CRLF & @CRLF & _GUICtrlListView_GetItemTextString($hListView, 1))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

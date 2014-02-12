#include <GuiConstantsEx.au3>
#include <GuiListView.au3>

$Debug_LV = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ListView-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hListView

	GUICreate("ListView: L&ouml;scht eine Spalte", 400, 300)

	$hListView = GUICtrlCreateListView("Spalte1|Spalte2|Spalte3", 2, 2, 394, 268)
	GUICtrlCreateListViewItem("Zeile1|Daten1|mehr1", $hListView)
	GUICtrlCreateListViewItem("Zeile2|Daten2|mehr2", $hListView)
	GUICtrlCreateListViewItem("Zeile3|Daten3|mehr3", $hListView)
	GUICtrlCreateListViewItem("Zeile4|Daten4|mehr4", $hListView)
	GUICtrlCreateListViewItem("Zeile5|Datena5|mehr5", $hListView)
	GUISetState()

	MsgBox(4160, "Information", "Eine Spalte l&ouml;schen")
	_GUICtrlListView_DeleteColumn($hListView, 1)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

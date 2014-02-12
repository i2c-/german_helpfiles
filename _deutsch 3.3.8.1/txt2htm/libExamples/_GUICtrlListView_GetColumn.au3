#include <GuiConstantsEx.au3>
#include <GuiListView.au3>

$Debug_LV = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ListView-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $aInfo, $hListView

	GUICreate("ListView: Attribute der Spalte ermitteln", 400, 300)
	$hListView = GUICtrlCreateListView("Spalte1|Spalte2|Spalte3", 2, 2, 394, 268)
	_GUICtrlListView_SetExtendedListViewStyle($hListView, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_CHECKBOXES))
	_GUICtrlListView_SetColumnWidth($hListView, 0, 100)
	GUISetState()

	GUICtrlCreateListViewItem("Index0|Daten1|mehr1", $hListView)
	GUICtrlCreateListViewItem("Index1|Daten2|mehr2", $hListView)
	GUICtrlCreateListViewItem("Index2|Daten3|mehr3", $hListView)
	GUICtrlCreateListViewItem("Index3|Daten4|mehr4", $hListView)
	GUICtrlCreateListViewItem("Index4|Daten5|mehr5", $hListView)

	; &Auml;ndert die Attribute einer Spalte
	$aInfo = _GUICtrlListView_GetColumn($hListView, 0)
	MsgBox(4160, "Information", "Spalte 1 Breite: " & $aInfo[4])
	_GUICtrlListView_SetColumn($hListView, 0, "New Spalte 1", 150)
	$aInfo = _GUICtrlListView_GetColumn($hListView, 0)
	MsgBox(4160, "Information", "Spalte 1 Breite: " & $aInfo[4])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	GUIDelete()
EndFunc   ;==>_Main

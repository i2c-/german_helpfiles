#include <GuiConstantsEx.au3>
#include <GuiListView.au3>

$Debug_LV = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ListView-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $aItem, $sText, $hListView

	GUICreate("ListView: Ermittelt den Itemtext (Array)", 400, 300)

	$hListView = GUICtrlCreateListView("Spalte1|Spalte2|Spalte3", 2, 2, 394, 268)
	GUICtrlCreateListViewItem("Zeile1|Daten1|mehr1", $hListView)
	GUICtrlCreateListViewItem("Zeile2|Daten2|mehr2", $hListView)
	GUICtrlCreateListViewItem("Zeile3|Daten3|mehr3", $hListView)
	GUICtrlCreateListViewItem("Zeile4|Daten4|mehr4", $hListView)
	GUICtrlCreateListViewItem("Zeile5|Daten5|mehr5", $hListView)

	GUISetState()

	; Ermittelt den Text von Item 2
	$aItem = _GUICtrlListView_GetItemTextArray($hListView, 1)
	For $i = 1 To $aItem[0]
		$sText &= StringFormat("spalte[%2d] %s", $i, $aItem[$i]) & @LF
	Next

	MsgBox(4160, "Information", "Text von Item 2 (alle Spalten): " & @LF & @LF & $sText)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

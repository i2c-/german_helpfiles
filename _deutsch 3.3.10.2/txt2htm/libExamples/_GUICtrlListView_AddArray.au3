#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $iI, $iTimer, $hListView

	; Erstellt eine GUI
	GUICreate("ListView: F&uuml;gt ein Item aus einem Array hinzu", 500, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; F&uuml;gt eine Spalte hinzu
	_GUICtrlListView_AddColumn($hListView, "Items", 100)
	_GUICtrlListView_AddColumn($hListView, "SubItems 1", 100)
	_GUICtrlListView_AddColumn($hListView, "SubItems 2", 100)
	_GUICtrlListView_AddColumn($hListView, "SubItems 3", 100)

	_GUICtrlListView_SetItemCount($hListView, 5000)

	; 1. Spalte wird bef&uuml;llt
	Local $aItems[5000][1]
	For $iI = 0 To UBound($aItems) - 1
		$aItems[$iI][0] = "Item " & $iI
	Next
	$iTimer = TimerInit()
	_GUICtrlListView_AddArray($hListView, $aItems)
	MsgBox($MB_SYSTEMMODAL, "Information", "F&uuml;llzeit: " & TimerDiff($iTimer) / 1000 & " Sekunden")

	_GUICtrlListView_DeleteAllItems(GUICtrlGetHandle($hListView)) ; Items die mit UDF Funktionen hinzugef&uuml;gt wurden k&ouml;nnen auch mit UDF Funktionen wieder gel&ouml;scht werden

	; 4. Spalte wird bef&uuml;llt
	Dim $aItems[5000][4]
	For $iI = 0 To UBound($aItems) - 1
		$aItems[$iI][0] = "Item " & $iI
		$aItems[$iI][1] = "Item " & $iI & "-1"
		$aItems[$iI][2] = "Item " & $iI & "-2"
		$aItems[$iI][3] = "Item " & $iI & "-3"
	Next
	$iTimer = TimerInit()
	_GUICtrlListView_AddArray($hListView, $aItems)
	MsgBox($MB_SYSTEMMODAL, "Information", "F&uuml;llzeit: " & TimerDiff($iTimer) / 1000 & " Sekunden")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

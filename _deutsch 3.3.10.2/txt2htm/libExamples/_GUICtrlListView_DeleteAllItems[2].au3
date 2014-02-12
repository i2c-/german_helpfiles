#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example() ; Ein ListView Control erstellt mit der ListView UDF.

Func Example()
	Local $aItems[10][3]

	Local $GUI = GUICreate("ListView: L&ouml;scht alle Items (UDF)", 400, 300)
	Local $hListView = _GUICtrlListView_Create($GUI, "Spalte1|Spalte2|Spalte3", 2, 2, 394, 268)

	; Zeigt die GUI
	GUISetState(@SW_SHOW)

	; 3 Spalten laden
	For $iI = 0 To UBound($aItems) - 1
		$aItems[$iI][0] = "Item " & $iI
		$aItems[$iI][1] = "Item " & $iI & "-1"
		$aItems[$iI][2] = "Item " & $iI & "-2"
	Next

	_GUICtrlListView_AddArray($hListView, $aItems)

	MsgBox($MB_SYSTEMMODAL, "Information", "L&ouml;scht alle Items")

	; Verwendet das Handle eines mit der UDF erstellen ListViews
	_GUICtrlListView_DeleteAllItems($hListView)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; L&ouml;scht die GUI und alle Controls
	GUIDelete()
EndFunc   ;==>Example_UDF_Created

#include <GuiConstantsEx.au3>
#include <GuiListView.au3>

$Debug_LV = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ListView-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Example1()
Example2()
Example_UDF_Created()

Func Example1()
	Local $hListView

	GUICreate("ListView: L&ouml;scht alle Items", 400, 300)

	$hListView = GUICtrlCreateListView("Spalte1|Spalte2|Spalte3", 2, 2, 394, 268)
	GUISetState()

	; 3 Spalten laden
	For $iI = 0 To 9
		GUICtrlCreateListViewItem("Item " & $iI & "|Item " & $iI & "-1|Item " & $iI & "-2", $hListView)
	Next

	MsgBox(4160, "Information", "L&ouml;scht alle Items")
	; Die Items wurden mit Hilfe der Grundfunktionen erstellt. Die Control-ID ist an die Funktion zu &uuml;bergeben
	MsgBox(4160, "L&ouml;schen?", _GUICtrlListView_DeleteAllItems($hListView))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example1

Func Example2()
	Local $hListView, $aItems[10][3]

	GUICreate("ListView: L&ouml;scht alle Items", 400, 300)

	$hListView = GUICtrlCreateListView("Spalte1|Spalte2|Spalte3", 2, 2, 394, 268)
	GUISetState()

	; 3 Spalten laden
	For $iI = 0 To UBound($aItems) - 1
		$aItems[$iI][0] = "Item " & $iI
		$aItems[$iI][1] = "Item " & $iI & "-1"
		$aItems[$iI][2] = "Item " & $iI & "-2"
	Next

	_GUICtrlListView_AddArray($hListView, $aItems)

	MsgBox(4160, "Information", "L&ouml;scht alle Items")
	; Die Items wurden mit Hilfe von UDF Funktionen erstellt. Das Handle ist an das Control zu &uuml;bergeben
	MsgBox(4160, "L&ouml;schen?", _GUICtrlListView_DeleteAllItems(GUICtrlGetHandle($hListView)))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example2

Func Example_UDF_Created()
	Local $GUI, $hListView, $aItems[10][3]

	$GUI = GUICreate("ListView: L&ouml;scht alle Items (UDF)", 400, 300)

	$hListView = _GUICtrlListView_Create($GUI, "Spalte1|Spalte2|Spalte3", 2, 2, 394, 268)
	GUISetState()

	; 3 Spalten laden
	For $iI = 0 To UBound($aItems) - 1
		$aItems[$iI][0] = "Item " & $iI
		$aItems[$iI][1] = "Item " & $iI & "-1"
		$aItems[$iI][2] = "Item " & $iI & "-2"
	Next

	_GUICtrlListView_AddArray($hListView, $aItems)

	MsgBox(4160, "Information", "L&ouml;scht alle Items")
	; Dies ist auch ein Handle
	MsgBox(4160, "L&ouml;schen?", _GUICtrlListView_DeleteAllItems($hListView))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example_UDF_Created

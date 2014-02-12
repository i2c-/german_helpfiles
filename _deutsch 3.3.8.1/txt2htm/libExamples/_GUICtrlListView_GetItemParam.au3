#include <GuiConstantsEx.au3>
#include <GuiListView.au3>

$Debug_LV = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ListView-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

; Achtung SetItemParam darf nicht auf Items angewendet werden, welche mit GuiCtrlCreateListViewItem erstellt wurden
; Param ist die ID f&uuml;r Items die mit der Build-in Funktion erstellt wurden

Example_UDF_Created()

Func Example_UDF_Created()
	Local $GUI, $hListView

	$GUI = GUICreate("(UDF) ListView: Ermittelt den anwendungsspezifischen Wert eines Items", 550, 300)
	$hListView = _GUICtrlListView_Create($GUI, "", 2, 2, 544, 268)
	GUISetState()

	; F&uuml;gt die Spalten hinzu
	_GUICtrlListView_AddColumn($hListView, "Items", 100)

	; F&uuml;gt die Items hinzu
	_GUICtrlListView_AddItem($hListView, "Item 1")
	_GUICtrlListView_AddItem($hListView, "Item 2")
	_GUICtrlListView_AddItem($hListView, "Item 3")

	; Setzt den Parameter von Item 2
	_GUICtrlListView_SetItemParam($hListView, 1, 1234)
	; Ermittelt den Parameter von Item 2 und zeigt ihn an
	MsgBox(8256, "Information", "Parameter von Item 2: " & _GUICtrlListView_GetItemParam($hListView, 1))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example_UDF_Created

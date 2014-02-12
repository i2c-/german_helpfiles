#include <GuiConstantsEx.au3>
#include <GuiListView.au3>

$Debug_LV = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ListView-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hListView

	GUICreate("ListView: Setzt die Itemposition", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState()

	; F&uuml;gt die Spalten hinzu
	_GUICtrlListView_AddColumn($hListView, "Items", 100)

	; F&uuml;gt die Items hinzu
	_GUICtrlListView_BeginUpdate($hListView)
	For $iI = 1 To 10
		_GUICtrlListView_AddItem($hListView, "Item " & $iI)
	Next
	_GUICtrlListView_EndUpdate($hListView)

	; Setzt die Ansicht "Kleine Icons"
	_GUICtrlListView_SetView($hListView, 3)
	MsgBox(4160, "Information", "Verschiebt Item 2")
	_GUICtrlListView_SetItemPosition($hListView, 1, 100, 100)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

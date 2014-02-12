#include <GuiConstantsEx.au3>
#include <GuiListView.au3>

$Debug_LV = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ListView-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $iI, $hListView

	GUICreate("ListView: Sucht nach dem Zielitem", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState()

	; F&uuml;gt die Spalten hinzu
	_GUICtrlListView_InsertColumn($hListView, 0, "Items", 100)

	; F&uuml;gt die Items hinzu
	_GUICtrlListView_BeginUpdate($hListView)
	For $iI = 1 To 49
		_GUICtrlListView_AddItem($hListView, "Item " & $iI)
	Next
	_GUICtrlListView_AddItem($hListView, "Zielitem")
	For $iI = 51 To 100
		_GUICtrlListView_AddItem($hListView, "Item " & $iI)
	Next
	_GUICtrlListView_EndUpdate($hListView)

	; Sucht nach dem Zielitem
	$iI = _GUICtrlListView_FindInText($hListView, "zIeL")
	MsgBox(4160, "Information", "Index des Zielitems: " & $iI)
	_GUICtrlListView_EnsureVisible($hListView, $iI)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

#include <GuiConstantsEx.au3>
#include <GuiListView.au3>

$Debug_LV = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ListView-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $exStyles = BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_CHECKBOXES), $hListView

	GUICreate("ListView: Hakt das Item an", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	_GUICtrlListView_SetExtendedListViewStyle($hListView, $exStyles)
	GUISetState()

	; F&uuml;gt die Spalten hinzu
	_GUICtrlListView_AddColumn($hListView, "Spalte 1", 100)
	_GUICtrlListView_AddColumn($hListView, "Spalte 2", 100)
	_GUICtrlListView_AddColumn($hListView, "Spalte 3", 100)

	; F&uuml;gt die Items hinzu
	_GUICtrlListView_AddItem($hListView, "Zeile 1: Spalte 1", 0)
	_GUICtrlListView_AddSubItem($hListView, 0, "Zeile 1: Spalte 2", 1)
	_GUICtrlListView_AddSubItem($hListView, 0, "Zeile 1: Spalte 3", 2)
	_GUICtrlListView_AddItem($hListView, "Zeile 2: Spalte 1", 1)
	_GUICtrlListView_AddSubItem($hListView, 1, "Zeile 2: Spalte 2", 1)
	_GUICtrlListView_AddItem($hListView, "Zeile 3: Spalte 1", 2)

	; Hakt Item 2 an
	_GUICtrlListView_SetItemChecked($hListView, 1)
	MsgBox(4160, "Information", "Item 2 angehakt: " & _GUICtrlListView_GetItemChecked($hListView, 1))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

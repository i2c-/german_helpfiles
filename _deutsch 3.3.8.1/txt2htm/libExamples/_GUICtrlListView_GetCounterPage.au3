#include <GuiConstantsEx.au3>
#include <GuiListView.au3>

$Debug_LV = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ListView-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hListView

	GUICreate("ListView: Die Anzahl von Items ermitteln, welche vertikal in das sichtbare Feld eingepasst werden k&ouml;nnen", 400, 300)
	$hListView = GUICtrlCreateListView("Spalte 1|Spalte 2|Spalte 3", 2, 2, 394, 268)
	_GUICtrlListView_SetExtendedListViewStyle($hListView, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES))
	GUISetState()

	; Zeigt die Anzahl von Items, welche vertikal in das sichtbare Feld eingepasst werden k&ouml;nnen
	MsgBox(4160, "Information", "Items pro Seite: " & _GUICtrlListView_GetCounterPage($hListView))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

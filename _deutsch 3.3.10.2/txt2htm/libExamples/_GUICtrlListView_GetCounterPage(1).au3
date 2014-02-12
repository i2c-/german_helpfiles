#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hListView

	GUICreate("ListView: Die Anzahl von Items ermitteln, welche vertikal in das sichtbare Feld eingepasst werden k&ouml;nnen", 400, 300)
	$hListView = GUICtrlCreateListView("Spalte 1|Spalte 2|Spalte 3", 2, 2, 394, 268)
	_GUICtrlListView_SetExtendedListViewStyle($hListView, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES))
	GUISetState(@SW_SHOW)

	; Zeigt die Anzahl von Items, welche vertikal in das sichtbare Feld eingepasst werden k&ouml;nnen
	MsgBox($MB_SYSTEMMODAL, "Information", "Items pro Seite: " & _GUICtrlListView_GetCounterPage($hListView))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

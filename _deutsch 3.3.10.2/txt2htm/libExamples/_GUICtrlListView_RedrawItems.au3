#include <GuiConstantsEx.au3>
#include <GuiListView.au3>

Example()

Func Example()
	Local $hListView

	GUICreate("ListView: Items neu aufbauen", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Spalte hinzuf&uuml;gen
	_GUICtrlListView_AddColumn($hListView, "Items", 100)

	; F&uuml;gt die Items hinzu
	_GUICtrlListView_BeginUpdate($hListView)
	For $iI = 1 To 10
		_GUICtrlListView_AddItem($hListView, "Item " & $iI)
	Next
	_GUICtrlListView_EndUpdate($hListView)

	; Bewegt das Control dazu, einen Bereich mit Items neu aufzubauen
	_GUICtrlListView_RedrawItems($hListView, 0, 9)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $GUI, $HandleBefore, $hListView

	$GUI = GUICreate("ListView: Zerst&ouml;ren (UDF)", 400, 300)

	$hListView = _GUICtrlListView_Create($GUI, "", 2, 2, 394, 268)
	$HandleBefore = $hListView
	GUISetState(@SW_SHOW)

	; F&uuml;gt die Spalten hinzu
	_GUICtrlListView_InsertColumn($hListView, 0, "Spalte 1", 100)
	_GUICtrlListView_InsertColumn($hListView, 1, "Spalte 2", 100)
	_GUICtrlListView_InsertColumn($hListView, 2, "Spalte 3", 100)

	; F&uuml;gt die Items hinzu
	_GUICtrlListView_AddItem($hListView, "Zeile 1: Spalte 1")
	_GUICtrlListView_AddSubItem($hListView, 0, "Zeile 1: Spalte 2", 1)
	_GUICtrlListView_AddSubItem($hListView, 0, "Zeile 1: Spalte 3", 2)
	_GUICtrlListView_AddItem($hListView, "Zeile 2: Spalte 1")
	_GUICtrlListView_AddSubItem($hListView, 1, "Zeile 2: Spalte 2", 1)
	_GUICtrlListView_AddItem($hListView, "Zeile 3: Spalte 1")

	MsgBox($MB_SYSTEMMODAL, "Information", "Das Control folgendem Handle wurde zerst&ouml;rt: " & $hListView)
	MsgBox($MB_SYSTEMMODAL, "Information", "Control wurde zerst&ouml;rt: " & _GUICtrlListView_Destroy($hListView) & @CRLF & _
			"Handle vor der Zerst&ouml;rung: " & $HandleBefore & @CRLF & _
			"Handle nach der Zerst&ouml;rung: " & $hListView)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

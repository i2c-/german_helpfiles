#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hListView

	GUICreate("ListView: Ermittelt das 'Hot'-Cursor Handle", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; F&uuml;gt die Spalten hinzu
	_GUICtrlListView_AddColumn($hListView, "Spalte 1", 100)
	_GUICtrlListView_AddColumn($hListView, "Spalte 2", 100)
	_GUICtrlListView_AddColumn($hListView, "Spalte 3", 100)

	; Zeigt das 'Hot'-Cursor Handle
	MsgBox($MB_SYSTEMMODAL, "Information", "Handle des 'Hot'-Cursors: 0x" & Hex(_GUICtrlListView_GetHotCursor($hListView)) & @CRLF & _
			"IsPtr = " & IsPtr(_GUICtrlListView_GetHotCursor($hListView)) & " IsHwnd = " & IsHWnd(_GUICtrlListView_GetHotCursor($hListView)))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

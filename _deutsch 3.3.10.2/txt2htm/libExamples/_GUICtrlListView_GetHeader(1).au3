#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hListView

	GUICreate("ListView: Ermittelt den Handle des Kopfes", 400, 300)
	$hListView = GUICtrlCreateListView("Spalte1|Spalte2|Spalte3", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	MsgBox($MB_SYSTEMMODAL, "Information", "Handle des Kopfes des Listviews: 0x" & Hex(_GUICtrlListView_GetHeader($hListView)) & @CRLF & _
			"IsPtr = " & IsPtr(_GUICtrlListView_GetHeader($hListView)) & " IsHWnd = " & IsHWnd(_GUICtrlListView_GetHeader($hListView)))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	GUIDelete()
EndFunc   ;==>Example

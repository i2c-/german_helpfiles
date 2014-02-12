#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hToolTip, $hListView

	GUICreate("ListView: Setzt ToolTips", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
;~ 	$hListView = _GUICtrlListView_Create($hGui, "", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; F&uuml;gt die Spalten hinzu
	_GUICtrlListView_AddColumn($hListView, "Items", 100)

	; F&uuml;gt die Items hinzu
	_GUICtrlListView_AddItem($hListView, "Item 1")
	_GUICtrlListView_AddItem($hListView, "Item 2")
	_GUICtrlListView_AddItem($hListView, "Item 3")

	; Zeigt das Handle des Tooltips
	$hToolTip = _GUICtrlListView_GetToolTips($hListView)
	MsgBox($MB_SYSTEMMODAL, "Information", "Handle des ToolTips: 0x" & Hex($hToolTip))
	Local $hPrevTooltips = _GUICtrlListView_SetToolTips($hListView, $hToolTip)
	MsgBox($MB_SYSTEMMODAL, "Information", "Handle des obigen ToolTips: 0x" & Hex($hPrevTooltips) & @CRLF & _
			"IsPtr = " & IsPtr($hPrevTooltips) & " IsHWnd = " & IsHWnd($hPrevTooltips))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

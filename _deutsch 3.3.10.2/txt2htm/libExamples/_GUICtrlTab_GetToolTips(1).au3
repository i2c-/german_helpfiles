#include <GUIConstantsEx.au3>
#include <GuiTab.au3>
#include <GuiToolTip.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGUI, $hTool, $hTab

	; Erstellt eine GUI
	GUICreate("Tab-Control: Ermittelt die ToolTips", 400, 300)
	$hTab = GUICtrlCreateTab(2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; F&uuml;gt Tabs hinzu
	_GUICtrlTab_InsertItem($hTab, 0, "Tab 1")
	_GUICtrlTab_InsertItem($hTab, 1, "Tab 2")
	_GUICtrlTab_InsertItem($hTab, 2, "Tab 3")

	; Ermittelt/Setzt die ToolTips
	$hTool = _GUIToolTip_Create(GUICtrlGetHandle($hTab))
	_GUICtrlTab_SetToolTips($hTab, $hTool)
	MsgBox($MB_SYSTEMMODAL, "Information", "ToolTip Handle: 0x" & _GUICtrlTab_GetToolTips($hTab) & @CRLF & _
			"IsPtr = " & IsPtr(_GUICtrlTab_GetToolTips($hTab)) & " IsHwnd = " & IsHWnd(_GUICtrlTab_GetToolTips($hTab)))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

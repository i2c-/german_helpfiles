#include <GUIConstantsEx.au3>
#include <GuiTab.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGUI, $hTab

	; Erstellt eine GUI
	$hGUI = GUICreate("Tab-Control: Zerst&ouml;ren (UDF)", 400, 300)
	$hTab = _GUICtrlTab_Create($hGUI, 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; F&uuml;gt Tabs hinzu
	_GUICtrlTab_InsertItem($hTab, 0, "Tab 1")
	_GUICtrlTab_InsertItem($hTab, 1, "Tab 2")
	_GUICtrlTab_InsertItem($hTab, 2, "Tab 3")

	MsgBox($MB_SYSTEMMODAL, "Information", "Tab-Control zerst&ouml;ren")
	_GUICtrlTab_Destroy($hTab)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

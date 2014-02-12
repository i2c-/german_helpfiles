#include <GUIConstantsEx.au3>
#include <GuiTab.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hTab

	; Erstellt eine GUI
	GUICreate("Tab-Control: Item l&ouml;schen", 400, 300)
	$hTab = GUICtrlCreateTab(2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; F&uuml;gt Tabs hinzu
	_GUICtrlTab_InsertItem($hTab, 0, "Tab 1")
	_GUICtrlTab_InsertItem($hTab, 1, "Tab 2")
	_GUICtrlTab_InsertItem($hTab, 2, "Tab 3")

	; L&ouml;scht den letzten Tab
	MsgBox($MB_SYSTEMMODAL, "Information", "L&ouml;sche den letzten Tab")
	_GUICtrlTab_DeleteItem($hTab, 2)

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

#include <GuiConstantsEx.au3>
#include <GuiTab.au3>

Example()

Func Example()
	Local $hTab

	; Erstellt eine GUI
	GUICreate("Tab-Control: Setzt die Itemgr&ouml;&szlig;e", 400, 300)
	$hTab = GUICtrlCreateTab(2, 2, 396, 296, BitOR($TCS_BUTTONS, $TCS_FIXEDWIDTH))
	_GUICtrlTab_SetItemSize($hTab, 70, 40)
	GUISetState(@SW_SHOW)

	; F&uuml;gt Tabs hinzu
	_GUICtrlTab_InsertItem($hTab, 0, "Tab 1")
	_GUICtrlTab_InsertItem($hTab, 1, "Tab 2")
	_GUICtrlTab_InsertItem($hTab, 2, "Tab 3")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

#include <GuiConstantsEx.au3>
#include <GuiTab.au3>

Example()

Func Example()
	Local $hTab

	; GUI erstellen
	GUICreate("Tab-Control: Tab anklicken", 400, 300)
	$hTab = GUICtrlCreateTab(2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Tabs hinzuf&uuml;gen
	_GUICtrlTab_InsertItem($hTab, 0, "Tab 1")
	_GUICtrlTab_InsertItem($hTab, 1, "Tab 2")
	_GUICtrlTab_InsertItem($hTab, 2, "Tab 3")

	; Maus zu Tab 2 bewegen und dort 1 mal klicken
	_GUICtrlTab_ClickTab($hTab, 1, "left", True, 1, 100)

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

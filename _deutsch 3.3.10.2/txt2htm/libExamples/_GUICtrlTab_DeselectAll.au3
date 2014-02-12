#include <GUIConstantsEx.au3>
#include <GuiTab.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hTab

	; Erstellt eine GUI
	GUICreate("Tab-Control: W&auml;hlt alles ab", 400, 300)
	$hTab = GUICtrlCreateTab(2, 2, 396, 296, $TCS_BUTTONS)
	GUISetState(@SW_SHOW)

	; F&uuml;gt Tabs hinzu
	_GUICtrlTab_InsertItem($hTab, 0, "Tab 1")
	_GUICtrlTab_InsertItem($hTab, 1, "Tab 2")
	_GUICtrlTab_InsertItem($hTab, 2, "Tab 3")

	; W&auml;hlt das zweite Tab Item aus
	_GUICtrlTab_SetCurSel($hTab, 1)

	; Setzt die Tab Auswahl zur&uuml;ck
	MsgBox($MB_SYSTEMMODAL, "Information", "Setzt die Tab Auswahl zur&uuml;ck")
	_GUICtrlTab_DeselectAll($hTab, False)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

#include <GUIConstantsEx.au3>
#include <GuiTab.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hTab

	; Erstellt eine GUI
	GUICreate("Tab-Control: Ermittelt den erweiterten Stil", 400, 300)
	$hTab = GUICtrlCreateTab(2, 2, 396, 296, BitOR($TCS_BUTTONS, $TCS_FLATBUTTONS))
	GUISetState(@SW_SHOW)

	; F&uuml;gt Tabs hinzu
	_GUICtrlTab_InsertItem($hTab, 0, "Tab 1")
	_GUICtrlTab_InsertItem($hTab, 1, "Tab 2")
	_GUICtrlTab_InsertItem($hTab, 2, "Tab 3")

	; Ermittelt/Setzt den erweiterten Stil
	_GUICtrlTab_SetExtendedStyle($hTab, $TCS_EX_FLATSEPARATORS)
	MsgBox($MB_SYSTEMMODAL, "Information", "Erweiterte Stile: 0x" & Hex(_GUICtrlTab_GetExtendedStyle($hTab)))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

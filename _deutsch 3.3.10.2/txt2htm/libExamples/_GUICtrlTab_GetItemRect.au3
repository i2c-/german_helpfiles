#include <GUIConstantsEx.au3>
#include <GuiTab.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $aRect, $sRect, $hTab

	; Erstellt eine GUI
	GUICreate("Tab-Control: Ermittelt das Item umgebende Rechteck", 400, 300)
	$hTab = GUICtrlCreateTab(2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; F&uuml;gt Tabs hinzu
	_GUICtrlTab_InsertItem($hTab, 0, "Tab 1")
	_GUICtrlTab_InsertItem($hTab, 1, "Tab 2")
	_GUICtrlTab_InsertItem($hTab, 2, "Tab 3")

	; Ermittelt das Item 0 umgebende Rechteck
	$aRect = _GUICtrlTab_GetItemRect($hTab, 0)
	$sRect = StringFormat("[%d, %d, %d, %d]", $aRect[0], $aRect[1], $aRect[2], $aRect[3])
	MsgBox($MB_SYSTEMMODAL, "Information", "Tab 0 Rechteck: " & $sRect)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

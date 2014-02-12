#include <GUIConstantsEx.au3>
#include <GuiTab.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $bFormat, $hTab

	; Erstellt eine GUI
	GUICreate("Tab-Control: Setzt das Unicode Format", 400, 300)
	$hTab = GUICtrlCreateTab(2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; F&uuml;gt Tabs hinzu
	_GUICtrlTab_InsertItem($hTab, 0, "Tab 1")
	_GUICtrlTab_InsertItem($hTab, 1, "Tab 2")
	_GUICtrlTab_InsertItem($hTab, 2, "Tab 3")

	; Ermittelt/Setzt das Unicode Format
	$bFormat = _GUICtrlTab_GetUnicodeFormat($hTab)
	MsgBox($MB_SYSTEMMODAL, "Information", "Unicode Format: " & $bFormat)
	_GUICtrlTab_SetUnicodeFormat($hTab, Not $bFormat)
	MsgBox($MB_SYSTEMMODAL, "Information", "Unicode Format: " & _GUICtrlTab_GetUnicodeFormat($hTab))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

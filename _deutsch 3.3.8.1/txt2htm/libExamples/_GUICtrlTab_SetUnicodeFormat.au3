#include <GuiConstantsEx.au3>
#include <GuiTab.au3>

$Debug_TAB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Tab-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $bFormat, $hTab

	; Erstellt eine GUI
	GUICreate("Tab-Control: Setzt das Unicode Format", 400, 300)
	$hTab = GUICtrlCreateTab(2, 2, 396, 296)
	GUISetState()

	; F&uuml;gt Tabs hinzu
	_GUICtrlTab_InsertItem($hTab, 0, "Tab 1")
	_GUICtrlTab_InsertItem($hTab, 1, "Tab 2")
	_GUICtrlTab_InsertItem($hTab, 2, "Tab 3")

	; Ermittelt/Setzt das Unicode Format
	$bFormat = _GUICtrlTab_GetUnicodeFormat($hTab)
	MsgBox(4160, "Information", "Unicode Format: " & $bFormat)
	_GUICtrlTab_SetUnicodeFormat($hTab, Not $bFormat)
	MsgBox(4160, "Information", "Unicode Format: " & _GUICtrlTab_GetUnicodeFormat($hTab))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

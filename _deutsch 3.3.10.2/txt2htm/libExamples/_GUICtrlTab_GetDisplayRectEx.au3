#include <GUIConstantsEx.au3>
#include <GuiTab.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $tRect, $sRect, $hTab

	; Erstellt eine GUI
	GUICreate("Tab-Control: Ermittelt das Rechteck mit RectEx", 400, 300)
	$hTab = GUICtrlCreateTab(2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; F&uuml;gt Tabs hinzu
	_GUICtrlTab_InsertItem($hTab, 0, "Tab 1")
	_GUICtrlTab_InsertItem($hTab, 1, "Tab 2")
	_GUICtrlTab_InsertItem($hTab, 2, "Tab 3")

	; Ermittelt das Rechteck
	$tRect = _GUICtrlTab_GetDisplayRectEx(GUICtrlGetHandle($hTab))
	$sRect = StringFormat("[%d, %d, %d, %d]", DllStructGetData($tRect, "Left"), _
			DllStructGetData($tRect, "Top"), _
			DllStructGetData($tRect, "Right"), _
			DllStructGetData($tRect, "Bottom"))
	MsgBox($MB_SYSTEMMODAL, "Information", "Rechteck: " & $sRect)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

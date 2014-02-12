#include <GUIConstantsEx.au3>
#include <GuiTab.au3>
#include <MsgBoxConstants.au3>

; Achtung: SetItemParam darf nicht im Zusammenhang mit Items verwendet werden, die mit GUICtrlCreateTabItem erstellt wurden
; Param ist die ID f&uuml;r Items welche mit built-in Funktionen erstellt wurden

Example()

Func Example()
	Local $hGUI, $hTab

	; Erstellt eine GUI
	$hGUI = GUICreate("Tab-Control: Ermittelt Itemparameter (UDF)", 400, 300)
	$hTab = _GUICtrlTab_Create($hGUI, 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; F&uuml;gt Tabs hinzu
	_GUICtrlTab_InsertItem($hTab, 0, "Tab 1")
	_GUICtrlTab_InsertItem($hTab, 1, "Tab 2")
	_GUICtrlTab_InsertItem($hTab, 2, "Tab 3")

	; Ermittelt/Setzt Parameter f&uuml;r Tab 1
	_GUICtrlTab_SetItemParam($hTab, 0, 1234)
	MsgBox($MB_SYSTEMMODAL, "Information", "Parameter f&uuml;r Tab 1: " & _GUICtrlTab_GetItemParam($hTab, 0))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

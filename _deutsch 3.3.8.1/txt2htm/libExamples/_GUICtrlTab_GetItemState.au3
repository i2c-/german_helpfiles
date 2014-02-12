#include <GuiConstantsEx.au3>
#include <GuiTab.au3>

$Debug_TAB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Tab-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hTab

	; Erstellt eine GUI
	GUICreate("Tab-Control: Ermittelt den Itemstatus", 400, 300)
	$hTab = GUICtrlCreateTab(2, 2, 396, 296, $TCS_BUTTONS)
	GUISetState()

	; F&uuml;gt Tabs hinzu
	_GUICtrlTab_InsertItem($hTab, 0, "Tab 1")
	_GUICtrlTab_InsertItem($hTab, 1, "Tab 2")
	_GUICtrlTab_InsertItem($hTab, 2, "Tab 3")

	; Ermittelt/Setzt den Status von Tab 2
	_GUICtrlTab_SetItemState($hTab, 1, $TCIS_BUTTONPRESSED)
	MsgBox(4160, "Information", "Tab 2 Status: " & _ExplainItemState(_GUICtrlTab_GetItemState($hTab, 1)))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

Func _ExplainItemState($iState)
	Local $sText = ""
	If $iState = 0 Then $sText &= "Es ist kein Status f&uuml;r dieses Item gesetzt" & @LF
	If BitAND($iState, $TCIS_BUTTONPRESSED) Then $sText &= "Button gedr&uuml;ckt" & @LF
	If BitAND($iState, $TCIS_HIGHLIGHTED) Then $sText &= "Button hervorgehoben"
	Return $sText
EndFunc   ;==>_ExplainItemState

#include <GUIConstantsEx.au3>
#include <GuiTab.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hTab

	; Erstellt eine GUI
	GUICreate("Tab-Control: Setzt den Itemstatus", 400, 300)
	$hTab = GUICtrlCreateTab(2, 2, 396, 296, $TCS_BUTTONS)
	GUISetState(@SW_SHOW)

	; F&uuml;gt Tabs hinzu
	_GUICtrlTab_InsertItem($hTab, 0, "Tab 1")
	_GUICtrlTab_InsertItem($hTab, 1, "Tab 2")
	_GUICtrlTab_InsertItem($hTab, 2, "Tab 3")

	; Ermittelt/Setzt den Status von Tab 2
	_GUICtrlTab_SetItemState($hTab, 1, $TCIS_BUTTONPRESSED)
	MsgBox($MB_SYSTEMMODAL, "Information", "Tab 2 Status: " & _ExplainItemState(_GUICtrlTab_GetItemState($hTab, 1)))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

Func _ExplainItemState($iState)
	Local $sText = ""
	If $iState = 0 Then $sText &= "Es ist kein Status f&uuml;r dieses Item gesetzt" & @CRLF
	If BitAND($iState, 1) Then $sText &= "Button gedr&uuml;ckt" & @CRLF
	If BitAND($iState, 2) Then $sText &= "Button hervorgehoben"
	Return $sText
EndFunc   ;==>_ExplainItemState

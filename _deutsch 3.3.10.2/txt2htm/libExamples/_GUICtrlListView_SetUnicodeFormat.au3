#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hListView

	GUICreate("ListView: Setzt das Unicode Format", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; F&uuml;gt die Spalten hinzu
	_GUICtrlListView_AddColumn($hListView, "Items", 100)

	; Setzt das Unicode Format
	_GUICtrlListView_SetUnicodeFormat($hListView, False)
	MsgBox($MB_SYSTEMMODAL, "Information", "Unicode: " & _GUICtrlListView_GetUnicodeFormat($hListView))
	_GUICtrlListView_SetUnicodeFormat($hListView, True)
	MsgBox($MB_SYSTEMMODAL, "Information", "Unicode: " & _GUICtrlListView_GetUnicodeFormat($hListView))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

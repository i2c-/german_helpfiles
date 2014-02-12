#include <GUIConstantsEx.au3>
#include <GuiTab.au3>
#include <GuiImageList.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGUI, $hImage, $hTab

	; Erstellt eine GUI
	$hGUI = GUICreate("Tab-Control: Ermittelt das Itembild", 400, 300)
	$hTab = GUICtrlCreateTab(2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Erstellt die Bilder
	$hImage = _GUIImageList_Create()
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGUI, 0xFF0000, 16, 16))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGUI, 0x00FF00, 16, 16))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hGUI, 0x0000FF, 16, 16))
	_GUICtrlTab_SetImageList($hTab, $hImage)

	; F&uuml;gt Tabs hinzu
	_GUICtrlTab_InsertItem($hTab, 0, "Tab 1")
	_GUICtrlTab_InsertItem($hTab, 1, "Tab 2")
	_GUICtrlTab_InsertItem($hTab, 2, "Tab 3")

	; Ermittelt/Setzt das Bild von Tab 2
	_GUICtrlTab_SetItemImage($hTab, 1, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", "Tab 2 Bildindex: " & _GUICtrlTab_GetItemImage($hTab, 1))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

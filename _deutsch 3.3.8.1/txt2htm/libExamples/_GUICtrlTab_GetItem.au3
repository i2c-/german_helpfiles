#include <GuiConstantsEx.au3>
#include <GuiTab.au3>
#include <WinAPI.au3>
#include <GuiImageList.au3>
#include <WindowsConstants.au3>

$Debug_TAB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Tab-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $iMemo

_Main()

Func _Main()
	Local $aItem, $hTab, $hImage, $tab0

	; Erstellt eine GUI
	GUICreate("Tab-Control: Item ermitteln", 400, 300)
	$hTab = GUICtrlCreateTab(2, 2, 396, 296)
	GUISetState()

	; Erstellt die Bilder
	$hImage = _GUIImageList_Create(16, 16, 5, 3)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 110)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 131)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 165)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 168)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 137)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 146)
	_GUICtrlTab_SetImageList($hTab, $hImage)

	; F&uuml;gt Tabs hinzu
	$tab0 = GUICtrlCreateTabItem("Tab 0")
	$iMemo = GUICtrlCreateEdit("", 4, 28, 390, 265)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUICtrlCreateTabItem("")
	GUICtrlCreateTabItem("Tab 1")
	GUICtrlCreateTabItem("")
	GUICtrlCreateTabItem("Tab 2")
	GUICtrlCreateTabItem("")
	GUICtrlSetState($tab0, $GUI_SHOW)

	; Ermittelt/Setzt Tab 0
	_GUICtrlTab_SetItem($hTab, 0, "Neuer Text", BitOR($TCIS_BUTTONPRESSED, $TCIS_BUTTONPRESSED), 2)
	_GUICtrlTab_SetItem($hTab, 1, -1, -1, 4)
	_GUICtrlTab_SetItem($hTab, 2, -1, -1, 5)
	GUISetState(@SW_LOCK)
	For $x = 0 To 2
		$aItem = _GUICtrlTab_GetItem($hTab, $x)
		MemoWrite("Tab-Item " & $x & @CRLF & "---------------------")
		For $y = 0 To 3
			MemoWrite("$aItem[" & $y & "]: " & $aItem[$y])
		Next
		MemoWrite(@CRLF & "---------------------")
	Next
	GUISetState(@SW_UNLOCK)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

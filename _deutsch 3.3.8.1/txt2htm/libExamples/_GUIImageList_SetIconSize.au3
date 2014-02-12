#include <GuiConstantsEx.au3>
#include <GuiListView.au3>
#include <GuiImageList.au3>

Global $iMemo

_Main()

Func _Main()
	Local $hImage, $aSize, $listview

	GUICreate("Imagelist: Icongr&ouml;&szlig;e setzen", 400, 300)
	$listview = GUICtrlCreateListView("", 2, 2, 394, 199, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	$iMemo = GUICtrlCreateEdit("", 2, 200, 396, 266, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	$hImage = _GUIImageList_Create(32, 32, 5, 3)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 110, True)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 131, True)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 165, True)
	_GUICtrlListView_SetImageList($listview, $hImage, 1)

	; F&uuml;gt die Spalten hinzu
	_GUICtrlListView_AddColumn($listview, "Spalte 1", 120)
	_GUICtrlListView_AddColumn($listview, "Spalte 2", 100)
	_GUICtrlListView_AddColumn($listview, "Spalte 3", 100)

	; F&uuml;gt die Items hinzu
	_GUICtrlListView_AddItem($listview, "Zeile 1: Spalte 1", 0)
	_GUICtrlListView_AddSubItem($listview, 0, "Zeile 1: Spalte 2", 1, 1)
	_GUICtrlListView_AddSubItem($listview, 0, "Zeile 1: Spalte 3", 2, 2)
	_GUICtrlListView_AddItem($listview, "Zeile 2: Spalte 1", 1)
	_GUICtrlListView_AddSubItem($listview, 1, "Zeile 2: Spalte 2", 1, 2)

	; Zeigt die Icongr&ouml;&szlig;e in der Imagelist
	$aSize = _GUIImageList_GetIconSize($hImage)
	MemoWrite("Bildbreite: " & $aSize[0])
	MemoWrite("Bildh&ouml;he  : " & $aSize[1])

	MsgBox(4096, "Information", "Es wird die Icongr&ouml;&szlig;e ge&auml;ndert")

	_GUIImageList_SetIconSize($hImage, 16, 16)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 110)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 131)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 165)
	_GUICtrlListView_SetImageList($listview, $hImage, 1)

	$aSize = _GUIImageList_GetIconSize($hImage)
	MemoWrite("Bildbreite: " & $aSize[0])
	MemoWrite("Bildh&ouml;he  : " & $aSize[1])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

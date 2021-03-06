#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <GuiImageList.au3>
#include <MsgBoxConstants.au3>

Example_UDF_Created()

Func Example_UDF_Created()
	Local $GUI, $hImage, $aImage, $hListView

	$GUI = GUICreate("ListView: Ermittelt das Hintergrundbild (UDF)", 600, 550)
	;=========================================================================================================
	$hListView = _GUICtrlListView_Create($GUI, "", 2, 2, 596, 500, -1, -1, True) ; Der letzte Parameter f&uuml;hrt zum Aufruf von CoInitializeEx
	;=========================================================================================================
	_GUICtrlListView_SetExtendedListViewStyle($hListView, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_DOUBLEBUFFER))

	; L&auml;dt die Bilder
	$hImage = _GUIImageList_Create()
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($hListView, 0xFF0000, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($hListView, 0x00FF00, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($hListView, 0x0000FF, 16, 16))
	_GUICtrlListView_SetImageList($hListView, $hImage, 1)

	; F&uuml;gt die Spalten hinzu
	_GUICtrlListView_InsertColumn($hListView, 0, "Spalte 1", 120)
	_GUICtrlListView_InsertColumn($hListView, 1, "Spalte 2", 120)
	_GUICtrlListView_InsertColumn($hListView, 2, "Spalte 3", 120)

	; F&uuml;gt die Items hinzu
	_GUICtrlListView_AddItem($hListView, "Zeile 1: Spalte 1", 0)
	_GUICtrlListView_AddSubItem($hListView, 0, "Zeile 1: Spalte 2", 1)
	_GUICtrlListView_AddSubItem($hListView, 0, "Zeile 1: Spalte 3", 2)
	_GUICtrlListView_AddItem($hListView, "Zeile 2: Spalte 1", 1)
	_GUICtrlListView_AddSubItem($hListView, 1, "Zeile 2: Spalte 2", 1)
	_GUICtrlListView_AddItem($hListView, "Zeile 3: Spalte 1", 2)

	; Bildet Gruppen
	_GUICtrlListView_EnableGroupView($hListView)
	_GUICtrlListView_InsertGroup($hListView, -1, 1, "Gruppe 1")
	_GUICtrlListView_InsertGroup($hListView, -1, 2, "Gruppe 2")
	_GUICtrlListView_SetItemGroupID($hListView, 0, 1)
	_GUICtrlListView_SetItemGroupID($hListView, 1, 2)
	_GUICtrlListView_SetItemGroupID($hListView, 2, 2)

	; L&auml;dt ein Bild herunter
	Local $sURL = "http://www.autoitscript.com/autoit3/files/graphics/autoit9_wall_grey_800x600.jpg"
	Local $sFilePath = @ScriptDir & "\AutoIt.jpg"
	InetGet($sURL, $sFilePath)

	; Setzt das Hintergrundbild
	_GUICtrlListView_SetBkImage($hListView, $sFilePath)
	$aImage = _GUICtrlListView_GetBkImage($hListView)

	GUISetState(@SW_SHOW)
	MsgBox($MB_SYSTEMMODAL, "Information", "Hintergrundbild: " & @CRLF & $aImage[1])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	;=========================================================================================================
	DllCall('ole32.dll', 'long', 'CoUinitialize') ; Muss f&uuml;r jeden Aufruf von CoInitializeEx ausgef&uuml;hrt werden
	;=========================================================================================================

	GUIDelete()
	FileDelete($sFilePath)
EndFunc   ;==>Example_UDF_Created

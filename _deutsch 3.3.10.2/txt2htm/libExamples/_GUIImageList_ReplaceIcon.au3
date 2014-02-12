#include <GuiConstantsEx.au3>
#include <WinAPI.au3>
#include <GuiListView.au3>
#include <GuiImageList.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $listview, $hImage
	Local $Wow64 = ""
	If @AutoItX64 Then $Wow64 = "\Wow6432Node"
	Local $AutoItDir = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $Wow64 & "\AutoIt v3\AutoIt", "InstallDir")

	GUICreate("Imagelist: AddIcon", 410, 300)
	$listview = GUICtrlCreateListView("", 2, 2, 404, 268, BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
	GUISetState(@SW_SHOW)

	; Erstellt eine neue Imagelist mit den Bildern
	$hImage = _GUIImageList_Create(11, 11)
	AddIcon($hImage, $AutoItDir & "Icons\au3.ico")
	AddIcon($hImage, $AutoItDir & "Icons\au3script_v9.ico")
	AddIcon($hImage, $AutoItDir & "Icons\au3script_v10.ico")
	_GUICtrlListView_SetImageList($listview, $hImage, 1)

	; F&uuml;gt die Spalten hinzu
	_GUICtrlListView_AddColumn($listview, "Spalte 1", 100, 0, 0)
	_GUICtrlListView_AddColumn($listview, "Spalte 2", 100, 1, 1)
	_GUICtrlListView_AddColumn($listview, "Spalte 3", 100, 2, 2)
	_GUICtrlListView_AddColumn($listview, "Spalte 4", 100)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Dies ist der lange Weg um ein Icon hinzuzuf&uuml;gen. Stattdessen ist _GUIImageList_AddIcon zu verwenden
Func AddIcon($hWnd, $sFile, $iIndex = 0)
	Local $pIcon, $tIcon, $hIcon

	$tIcon = DllStructCreate("int Icon")
	$pIcon = DllStructGetPtr($tIcon)
	_WinAPI_ExtractIconEx($sFile, $iIndex, 0, $pIcon, 1)
	$hIcon = DllStructGetData($tIcon, "Icon")
	_GUIImageList_ReplaceIcon($hWnd, -1, $hIcon)
	_WinAPI_DestroyIcon($hIcon)
EndFunc   ;==>AddIcon

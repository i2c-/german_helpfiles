#include <GuiMenu.au3>
#include <GuiConstantsEx.au3>
#include <WinAPI.au3>
#include <WindowsConstants.au3>

Global Enum $idOpen = 1000, $idSave, $idInfo

_Main()

Func _Main()
	; Erstellt eine GUI
	GUICreate("Menu", 400, 300)
	GUISetState()

	; Registriert eine benutzerdefinierte Funktion
	GUIRegisterMsg($WM_COMMAND, "WM_COMMAND")
	GUIRegisterMsg($WM_CONTEXTMENU, "WM_CONTEXTMENU")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>_Main

; Handle der WM_COMMAND Nachrichten
Func WM_COMMAND($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg, $ilParam
	Switch $iwParam
		Case $idOpen
			_WinAPI_ShowMsg("Open")
		Case $idSave
			_WinAPI_ShowMsg("Save")
		Case $idInfo
			_WinAPI_ShowMsg("Info")
	EndSwitch
EndFunc   ;==>WM_COMMAND

; Handle der WM_CONTEXTMENU Nachrichten
Func WM_CONTEXTMENU($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg, $ilParam
	Local $hMenu

	$hMenu = _GUICtrlMenu_CreatePopup()
	_GUICtrlMenu_InsertMenuItem($hMenu, 0, "&Ouml;ffnen", $idOpen)
	_GUICtrlMenu_InsertMenuItem($hMenu, 1, "Speichern", $idSave)
	_GUICtrlMenu_InsertMenuItem($hMenu, 3, "", 0)
	_GUICtrlMenu_InsertMenuItem($hMenu, 3, "Info", $idInfo)
	_GUICtrlMenu_TrackPopupMenu($hMenu, $iwParam)
	_GUICtrlMenu_DestroyMenu($hMenu)
	Return True
EndFunc   ;==>WM_CONTEXTMENU

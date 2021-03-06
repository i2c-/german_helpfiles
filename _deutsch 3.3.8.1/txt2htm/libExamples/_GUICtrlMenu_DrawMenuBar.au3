#include <GuiMenu.au3>

_Main()

Func _Main()
	Local $hWnd, $hMain, $hItem1, $hItem2

	; Startet den Editor
	Run("notepad.exe")
	WinWaitActive("[CLASS:Notepad]")
	$hWnd = WinGetHandle("[CLASS:Notepad]")
	$hMain = _GUICtrlMenu_GetMenu($hWnd)

	; Erstellt ein Subitem Men&uuml;
	$hItem1 = _GUICtrlMenu_CreateMenu()
	_GUICtrlMenu_InsertMenuItem($hItem1, 0, "SubItem &1", 0x1000)
	_GUICtrlMenu_InsertMenuItem($hItem1, 1, "SubItem &2", 0x1001)

	; Erstellt ein Men&uuml;
	$hItem2 = _GUICtrlMenu_CreateMenu()
	_GUICtrlMenu_InsertMenuItem($hItem2, 0, "Item &1", 0x2000, $hItem1)
	_GUICtrlMenu_InsertMenuItem($hItem2, 1, "Item &2", 0x2001)
	_GUICtrlMenu_InsertMenuItem($hItem2, 2, "", 0)
	_GUICtrlMenu_InsertMenuItem($hItem2, 3, "Item &3", 0x2002)
	_GUICtrlMenu_InsertMenuItem($hItem2, 4, "Item &4", 0x2003)

	; F&uuml;gt ein neues Men&uuml; in den Editor ein
	_GUICtrlMenu_InsertMenuItem($hMain, 6, "&AutoIt", 0, $hItem2)
	_GUICtrlMenu_DrawMenuBar($hWnd)

EndFunc   ;==>_Main

#include <GuiMenu.au3>

_Main()

Func _Main()
	Local $hWnd, $hMain, $hFile

	; Startet den Editor
	Run("notepad.exe")
	WinWaitActive("[CLASS:Notepad]")
	$hWnd = WinGetHandle("[CLASS:Notepad]")
	$hMain = _GUICtrlMenu_GetMenu($hWnd)
	$hFile = _GUICtrlMenu_GetItemSubMenu($hMain, 0)

	; Ermittelt/Setzt den Standard-Men&uuml;punkt f&uuml;r das Men&uuml; Datei
	Writeln("Standard-Men&uuml;punkt f&uuml;r das Men&uuml; Datei: " & _GUICtrlMenu_GetMenuDefaultItem($hFile))
	_GUICtrlMenu_SetMenuDefaultItem($hFile, 1)
	Writeln("Standard-Men&uuml;punkt f&uuml;r das Men&uuml; Datei: " & _GUICtrlMenu_GetMenuDefaultItem($hFile))

EndFunc   ;==>_Main

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText)
	ControlSend("[CLASS:Notepad]", "", "Edit1", $sText & @CR)
EndFunc   ;==>Writeln

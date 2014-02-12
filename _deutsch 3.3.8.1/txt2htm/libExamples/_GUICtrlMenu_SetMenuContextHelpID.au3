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

	; Ermittelt/Setzt die Kontexthilfe ID f&uuml;r das Men&uuml; 'Datei'
	Writeln("Kontexthilfe ID f&uuml;r das Men&uuml; 'Datei': " & _GUICtrlMenu_GetMenuContextHelpID($hFile))
	_GUICtrlMenu_SetMenuContextHelpID($hFile, 1234)
	Writeln("Kontexthilfe ID f&uuml;r das Men&uuml; 'Datei': " & _GUICtrlMenu_GetMenuContextHelpID($hFile))

EndFunc   ;==>_Main

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText)
	ControlSend("[CLASS:Notepad]", "", "Edit1", $sText & @CR)
EndFunc   ;==>Writeln

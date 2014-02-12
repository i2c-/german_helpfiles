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

	; Ermittelt/Setzt die maximale H&ouml;he des Men&uuml;s Datei
	Writeln("Maximale H&ouml;he des Men&uuml;s Datei: " & _GUICtrlMenu_GetMenuHeight($hFile))
	_GUICtrlMenu_SetMenuHeight($hFile, 100)
	Writeln("Maximale H&ouml;he des Men&uuml;s Datei: " & _GUICtrlMenu_GetMenuHeight($hFile))

EndFunc   ;==>_Main

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText)
	ControlSend("[CLASS:Notepad]", "", "Edit1", $sText & @CR)
EndFunc   ;==>Writeln

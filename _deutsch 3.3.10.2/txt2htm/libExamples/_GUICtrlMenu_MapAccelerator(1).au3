#include <GuiMenu.au3>

Example()

Func Example()
	Local $hWnd, $hMain, $hFile

	; Startet den Editor
	Run("notepad.exe")
	WinWaitActive("[CLASS:Notepad]")
	$hWnd = WinGetHandle("[CLASS:Notepad]")
	$hMain = _GUICtrlMenu_GetMenu($hWnd)
	$hFile = _GUICtrlMenu_GetItemSubMenu($hMain, 0)

	; Stellt eine Abk&uuml;rzungstaste in deren Position des Men&uuml;s dar.
	Writeln("Command-ID des Men&uuml;punktes '&Ouml;ffnen': " & _GUICtrlMenu_MapAccelerator($hFile, "O"))
EndFunc   ;==>Example

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText)
	ControlSend("[CLASS:Notepad]", "", "Edit1", $sText & @CRLF)
EndFunc   ;==>Writeln

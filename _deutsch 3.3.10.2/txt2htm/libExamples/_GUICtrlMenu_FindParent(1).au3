#include <GuiMenu.au3>

Example()

Func Example()
	Local $hWnd, $hMain

	Run("notepad.exe")
	WinWaitActive("[CLASS:Notepad]")
	$hWnd = WinGetHandle("[CLASS:Notepad]")
	$hMain = _GUICtrlMenu_GetMenu($hWnd)

	; Zeigt, dass das Men&uuml;-Handle zu Notepad geh&ouml;rt
	Writeln("Notepad Handle: 0x" & Hex($hWnd))
	Writeln("Men&uuml;-Parent ..: 0x" & Hex(_GUICtrlMenu_FindParent($hMain)))
EndFunc   ;==>Example

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText)
	ControlSend("[CLASS:Notepad]", "", "Edit1", $sText & @CRLF)
EndFunc   ;==>Writeln

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

	; Ermittelt, ob das Men&uuml;item hervorgehoben ist / Hebt ein Men&uuml;item hervor
	Writeln("Das Men&uuml; '&Ouml;ffnen' ist hervorgehoben: " & _GUICtrlMenu_GetItemHighlighted($hFile, 1))
	_GUICtrlMenu_SetItemHighlighted($hFile, 1)
	Writeln("Das Men&uuml; '&Ouml;ffnen' ist hervorgehoben: " & _GUICtrlMenu_GetItemHighlighted($hFile, 1))
EndFunc   ;==>Example

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText)
	ControlSend("[CLASS:Notepad]", "", "Edit1", $sText & @CRLF)
EndFunc   ;==>Writeln

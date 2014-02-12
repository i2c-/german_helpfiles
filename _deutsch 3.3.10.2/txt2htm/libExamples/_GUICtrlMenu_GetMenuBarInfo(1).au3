#include <GuiMenu.au3>

Example()

Func Example()
	Local $hWnd, $aInfo

	; Startet den Editor
	Run("notepad.exe")
	WinWaitActive("[CLASS:Notepad]")
	$hWnd = WinGetHandle("[CLASS:Notepad]")

	; Ermittelt die Men&uuml; Leisten Informationen
	$aInfo = _GUICtrlMenu_GetMenuBarInfo($hWnd)
	Writeln("Links ............: " & $aInfo[0])
	Writeln("Oben .............: " & $aInfo[1])
	Writeln("Rechts ...........: " & $aInfo[2])
	Writeln("Unten ..........: " & $aInfo[3])
	Writeln("Men&uuml; Handle .....: 0x" & Hex($aInfo[4]))
	Writeln("Submen&uuml; Handle ..: 0x" & Hex($aInfo[5]))
	Writeln("Men&uuml; Leiste fokusiert : " & $aInfo[6])
	Writeln("Menu Item fokusiert: " & $aInfo[7])
EndFunc   ;==>Example

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText)
	ControlSend("[CLASS:Notepad]", "", "Edit1", $sText & @CRLF)
EndFunc   ;==>Writeln

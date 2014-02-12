#include <GuiMenu.au3>

_Main()

Func _Main()
	Local $hWnd, $hMenu, $iCount, $iI

	; Startet den Editor
	Run("notepad.exe")
	WinWaitActive("[CLASS:Notepad]")
	$hWnd = WinGetHandle("[CLASS:Notepad]")
	$hMenu = _GUICtrlMenu_GetSystemMenu($hWnd)

	; &Auml;ndert das Systemmen&uuml;
	_GUICtrlMenu_InsertMenuItem($hMenu, 5, "&AutoIt")

	; Zeigt das Systemmen&uuml; an
	$iCount = _GUICtrlMenu_GetItemCount($hMenu)
	Writeln("Handle des Systemmen&uuml;s: 0x" & Hex($hMenu))
	Writeln("Anzahl Items..........: " & $iCount)
	For $iI = 0 To $iCount - 1
		Writeln("Item " & $iI & " Text ......: " & _GUICtrlMenu_GetItemText($hMenu, $iI))
	Next

EndFunc   ;==>_Main

; Schreibt eine Zeile mit Text in den Editor
Func Writeln($sText)
	ControlSend("[CLASS:Notepad]", "", "Edit1", $sText & @CR)
EndFunc   ;==>Writeln

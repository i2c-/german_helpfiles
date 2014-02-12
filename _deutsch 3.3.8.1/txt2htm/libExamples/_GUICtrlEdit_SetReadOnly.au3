#include <GuiEdit.au3>
#include <GuiStatusBar.au3>
#include <GuiConstantsEx.au3>

$Debug_Ed = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Edit-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $StatusBar, $hEdit, $hGUI
	Local $Wow64 = ""
	If @AutoItX64 Then $Wow64 = "\Wow6432Node"
	Local $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $Wow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\include\changelog.txt"
	Local $aPartRightSide[4] = [120, 248, 378, -1]

	; Erstellt eine GUI
	$hGUI = GUICreate("Edit: Setzt den Stil 'schreibgesch&uuml;tzt'", 400, 300)
	$hEdit = GUICtrlCreateEdit("", 2, 2, 394, 268)
	$StatusBar = _GUICtrlStatusBar_Create($hGUI, $aPartRightSide)
	_GUICtrlStatusBar_SetIcon($StatusBar, 3, 97, "shell32.dll")
	GUISetState()

	; Setzt die R&auml;nder
	_GUICtrlEdit_SetMargins($hEdit, BitOR($EC_LEFTMARGIN, $EC_RIGHTMARGIN), 10, 10)

	; F&uuml;gt Text hinzu
	_GUICtrlEdit_SetText($hEdit, FileRead($sFile))
	_GUICtrlEdit_LineScroll($hEdit, 0, _GUICtrlEdit_GetLineCount($hEdit) * - 1)

	; Ermittelt den Status des &Auml;nderungflags
	_GUICtrlStatusBar_SetText($StatusBar, "&Auml;nderungflags: " & _GUICtrlEdit_GetModify($hEdit), 2)

	; Setzt den Stil 'schreibgesch&uuml;tzt'
	_GUICtrlEdit_SetReadOnly($hEdit, True)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

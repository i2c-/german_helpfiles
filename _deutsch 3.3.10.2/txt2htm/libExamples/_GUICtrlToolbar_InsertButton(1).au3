#include <GuiToolbar.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>


Example()

Func Example()
	Local $hGUI, $hToolbar
	Local Enum $idNew = 1000, $idOpen, $idSave, $idHelp

	; Erstellt eine GUI
	$hGUI = GUICreate("Toolbar", 400, 300)
	$hToolbar = _GUICtrlToolbar_Create($hGUI)
	GUISetState(@SW_SHOW)

	; F&uuml;gt die Standard Systembitmaps hinzu
	_GUICtrlToolbar_AddBitmap($hToolbar, 1, -1, $IDB_STD_LARGE_COLOR)

	; F&uuml;gt die Buttons hinzu
	_GUICtrlToolbar_InsertButton($hToolbar, 0, $idNew, $STD_FILENEW)
	_GUICtrlToolbar_InsertButton($hToolbar, 1, $idOpen, $STD_FILEOPEN)
	_GUICtrlToolbar_InsertButton($hToolbar, 2, $idSave, $STD_FILESAVE)
	_GUICtrlToolbar_AddButtonSep($hToolbar)
	_GUICtrlToolbar_InsertButton($hToolbar, 4, $idHelp, $STD_HELP)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

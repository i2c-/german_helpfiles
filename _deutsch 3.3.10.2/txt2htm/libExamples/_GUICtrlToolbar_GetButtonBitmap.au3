#include <GuiToolbar.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>


Example()

Func Example()
	Local $hGUI, $hToolbar
	Local Enum $idNew = 1000, $idOpen, $idSave, $idHelp

	; Erstellt eine GUI
	$hGUI = GUICreate("Toolbar", 400, 300)
	$hToolbar = _GUICtrlToolbar_Create($hGUI)
	GUISetState(@SW_SHOW)

	; F&uuml;gt die Standard Systembitmaps hinzu
	Switch _GUICtrlToolbar_GetBitmapFlags($hToolbar)
		Case 0
			_GUICtrlToolbar_AddBitmap($hToolbar, 1, -1, $IDB_STD_SMALL_COLOR)
		Case 2
			_GUICtrlToolbar_AddBitmap($hToolbar, 1, -1, $IDB_STD_LARGE_COLOR)
	EndSwitch

	; F&uuml;gt die Buttons hinzu
	_GUICtrlToolbar_AddButton($hToolbar, $idNew, $STD_FILENEW)
	_GUICtrlToolbar_AddButton($hToolbar, $idOpen, $STD_FILEOPEN)
	_GUICtrlToolbar_AddButton($hToolbar, $idSave, $STD_FILESAVE)
	_GUICtrlToolbar_AddButtonSep($hToolbar)
	_GUICtrlToolbar_AddButton($hToolbar, $idHelp, $STD_HELP)

	; Zeigt den Index des Speichern-Bitmaps
	MsgBox($MB_SYSTEMMODAL, "Information", "&Auml;ndert das Speichern-Bitmap in das Drucken-Bitmap")
	_GUICtrlToolbar_SetButtonBitMap($hToolbar, $idSave, $STD_PRINT)
	MsgBox($MB_SYSTEMMODAL, "Information", "Index des Speichern-Bitmap: " & _GUICtrlToolbar_GetButtonBitmap($hToolbar, $idSave))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

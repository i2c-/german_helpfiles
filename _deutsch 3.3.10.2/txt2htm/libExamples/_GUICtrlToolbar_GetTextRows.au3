#include <GuiToolbar.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>


Example()

Func Example()
	Local $hGUI, $hToolbar, $aStrings[4]
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

	; F&uuml;gt Strings hinzu
	$aStrings[0] = _GUICtrlToolbar_AddString($hToolbar, "&Neu Button")
	$aStrings[1] = _GUICtrlToolbar_AddString($hToolbar, "&&Ouml;ffnen Button")
	$aStrings[2] = _GUICtrlToolbar_AddString($hToolbar, "&Speichern Button")
	$aStrings[3] = _GUICtrlToolbar_AddString($hToolbar, "&Hilfe Button")

	; F&uuml;gt die Buttons hinzu
	_GUICtrlToolbar_AddButton($hToolbar, $idNew, $STD_FILENEW, $aStrings[0])
	_GUICtrlToolbar_AddButton($hToolbar, $idOpen, $STD_FILEOPEN, $aStrings[1])
	_GUICtrlToolbar_AddButton($hToolbar, $idSave, $STD_FILESAVE, $aStrings[2])
	_GUICtrlToolbar_AddButtonSep($hToolbar)
	_GUICtrlToolbar_AddButton($hToolbar, $idHelp, $STD_HELP, $aStrings[3])

	; Zeigt die Anzahl von Textzeilen
	MsgBox($MB_SYSTEMMODAL, "Information", "Anzahl von Textzeilen:" & _GUICtrlToolbar_GetTextRows($hToolbar))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

#include <GuiToolbar.au3>
#include <GuiConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Constants.au3>

$Debug_TB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Toolbar-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hGUI, $hToolbar, $aStrings[4]
	Local Enum $idNew = 1000, $idOpen, $idSave, $idHelp

	; Erstellt eine GUI
	$hGUI = GUICreate("Toolbar", 400, 300)
	$hToolbar = _GUICtrlToolbar_Create($hGUI)
	GUISetState()

	; Aktiviere mehrzeilige Buttonbeschriftungen
	_GUICtrlToolbar_SetButtonWidth($hToolbar, 32, 40)
	_GUICtrlToolbar_SetMaxTextRows($hToolbar, 2)

	_GUICtrlToolbar_AddBitmap($hToolbar, 1, -1, $IDB_STD_LARGE_COLOR)

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

	; Zeigt die Anzahl der Textzeilen
	MsgBox(4096, "Information", "Anzahl von Textzeilen:" & _GUICtrlToolbar_GetTextRows($hToolbar))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

EndFunc   ;==>_Main

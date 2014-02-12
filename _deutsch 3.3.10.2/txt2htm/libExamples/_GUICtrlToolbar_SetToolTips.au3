#include <GuiToolbar.au3>
#include <GuiToolTip.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Global Enum $idNew = 1000, $idOpen, $idSave, $idHelp

Example()

Func Example()
	Local $hGUI, $hToolbar, $hToolTip

	; Erstellt eine GUI
	$hGUI = GUICreate("Toolbar", 400, 300)
	$hToolbar = _GUICtrlToolbar_Create($hGUI)
	GUISetState(@SW_SHOW)

	; Erstellt eine ToolTip
	$hToolTip = _GUIToolTip_Create($hToolbar)
	_GUICtrlToolbar_SetToolTips($hToolbar, $hToolTip)

	; F&uuml;gt die Standard-Systembitmaps hinzu
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

	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	; Zeigt das Handle des ToolTips
	MsgBox($MB_SYSTEMMODAL, "Information", "Handle des ToolTips .: 0x" & Hex(_GUICtrlToolbar_GetToolTips($hToolbar)))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Verarbeitet die WM_NOTIFY Nachricht
Func WM_NOTIFY($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg, $iwParam
	Local $tInfo, $iID, $iCode

	$tInfo = DllStructCreate($tagNMTTDISPINFO, $ilParam)
	$iCode = DllStructGetData($tInfo, "Code")
	If $iCode = $TTN_GETDISPINFOW Then
		$iID = DllStructGetData($tInfo, "IDFrom")
		Switch $iID
			Case $idNew
				DllStructSetData($tInfo, "aText", "Neu")
			Case $idOpen
				DllStructSetData($tInfo, "aText", "&Ouml;ffnen")
			Case $idSave
				DllStructSetData($tInfo, "aText", "Speichern")
			Case $idHelp
				DllStructSetData($tInfo, "aText", "Hilfe")
		EndSwitch
	EndIf
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY

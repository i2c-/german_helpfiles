#include <GuiToolbar.au3>
#include <GuiMenu.au3>
#include <GuiConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Constants.au3>

$Debug_TB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Toolbar-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.
Global $hGUI, $iMemo

_Main()

Func _Main()
	Local $hToolbar
	Local Enum $idNew = 1000, $idOpen, $idSave, $idHelp

	; Erstellt eine GUI
	$hGUI = GUICreate("Toolbar", 400, 300)
	$hToolbar = _GUICtrlToolbar_Create($hGUI)
	_GUICtrlToolbar_SetExtendedStyle($hToolbar, $TBSTYLE_EX_DRAWDDARROWS)
	$iMemo = GUICtrlCreateEdit("", 2, 36, 396, 262, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 10, 400, 0, "Courier New")
	GUISetState()

	; F&uuml;gt die Standard Systembitmaps hinzu
	Switch _GUICtrlToolbar_GetBitmapFlags($hToolbar)
		Case 0
			_GUICtrlToolbar_AddBitmap($hToolbar, 1, -1, $IDB_STD_SMALL_COLOR)
		Case 2
			_GUICtrlToolbar_AddBitmap($hToolbar, 1, -1, $IDB_STD_LARGE_COLOR)
	EndSwitch

	; F&uuml;gt die Buttons hinzu
	_GUICtrlToolbar_AddButton($hToolbar, $idNew, $STD_FILENEW, 0, $BTNS_DROPDOWN)
	_GUICtrlToolbar_AddButton($hToolbar, $idOpen, $STD_FILEOPEN)
	_GUICtrlToolbar_AddButton($hToolbar, $idSave, $STD_FILESAVE)
	_GUICtrlToolbar_AddButtonSep($hToolbar)
	_GUICtrlToolbar_AddButton($hToolbar, $idHelp, $STD_HELP)

	; Zeigt die verwendeten erweiterten Stile
	MemoWrite("Erweiterte Stile: " & _GUICtrlToolbar_GetExtendedStyle($hToolbar))

	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

EndFunc   ;==>_Main

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

; Verarbeitet die TBN_DROPDOWN Nachricht
Func WM_NOTIFY($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg, $iwParam
	Local $tNMHDR, $iCode, $hMenu

	$tNMHDR = DllStructCreate($tagNMHDR, $ilParam)
	$iCode = DllStructGetData($tNMHDR, "Code")

	If $iCode = $TBN_DROPDOWN Then
		$hMenu = _GUICtrlMenu_CreatePopup()
		_GUICtrlMenu_AddMenuItem($hMenu, "Template 1", 2000)
		_GUICtrlMenu_AddMenuItem($hMenu, "Template 2", 2001)
		_GUICtrlMenu_AddMenuItem($hMenu, "Template 3", 2002)
		_GUICtrlMenu_TrackPopupMenu($hMenu, $hGUI)
		_GUICtrlMenu_DestroyMenu($hMenu)
	EndIf
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY

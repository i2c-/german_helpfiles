#include <GUIConstantsEx.au3>
#include <GuiEdit.au3>
#include <WindowsConstants.au3>
#include <Constants.au3>
#include <GuiMenu.au3>
#include <WinAPI.au3>

Global $ContextMenu, $CommonMenuItem, $FileMenuItem, $ExitMenuItem
Global $hGui, $cInput, $wProcOld

_Main()

Func _Main()
	Local $cInput2, $wProcNew, $DummyMenu

	$hGui = GUICreate("Tippt oder f&uuml;gt irgendetwas ein:", 400, 200, -1, -1, $WS_THICKFRAME, -1)
	$cInput = GUICtrlCreateInput("", 20, 20, 360, 20)
	$cInput2 = GUICtrlCreateInput("", 20, 50, 360, 20)

	GUICtrlCreateLabel("abcd", 1, 1, 30, 18)
	GUICtrlSetCursor(-1, 9)

	$wProcNew = DllCallbackRegister("_MyWindowProc", "ptr", "hwnd;uint;long;ptr")
	$wProcOld = _WinAPI_SetWindowLong(GUICtrlGetHandle($cInput), $GWL_WNDPROC, DllCallbackGetPtr($wProcNew))
	_WinAPI_SetWindowLong(GUICtrlGetHandle($cInput2), $GWL_WNDPROC, DllCallbackGetPtr($wProcNew))
	; _WinAPI_SetWindowLong(GUICtrlGetHandle($cInput3), $GWL_WNDPROC, DllCallbackGetPtr($wProcNew)) ; und so weiter

	$DummyMenu = GUICtrlCreateDummy()
	$ContextMenu = GUICtrlCreateContextMenu($DummyMenu)
	$CommonMenuItem = GUICtrlCreateMenuitem("Allgemein", $ContextMenu)
	$FileMenuItem = GUICtrlCreateMenuitem("Datei", $ContextMenu)
	GUICtrlCreateMenuitem("", $ContextMenu)
	$ExitMenuItem = GUICtrlCreateMenuitem("Beenden", $ContextMenu)


	GUISetState(@SW_SHOW)
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd
EndFunc   ;==>_Main

Func do_clever_stuff_with_clipboard($hWnd)
	Local $sData
	$sData = ClipGet()
	If @error Then Return 0; Daten in der Zwischenablage sind kein Text oder Zwischenablage ist leer
	; Tue irgendwas
	$sData = StringUpper($sData)
	; Setzt Text
	GUICtrlSetData(_WinAPI_GetDlgCtrlID($hWnd), $sData); Oder _GUICtrlEdit_SetText($hWnd, $sData)
	Return 1
EndFunc   ;==>do_clever_stuff_with_clipboard

; Zeigt ein Men&uuml; im angegebenen GUI-Fenster, das zum angegebenen Control geh&ouml;rt
Func ShowMenu($hWnd, $nContextID)
	Local $iSelected = _GUICtrlMenu_TrackPopupMenu(GUICtrlGetHandle($nContextID), $hWnd, -1, -1, -1, -1, 2)
	Switch $iSelected
		Case $CommonMenuItem
			ConsoleWrite("Allgemein" & @CRLF)
		Case $FileMenuItem
			ConsoleWrite("Datei" & @CRLF)
		Case $ExitMenuItem
			ConsoleWrite("Beenden" & @CRLF)
	EndSwitch
EndFunc   ;==>ShowMenu

Func _MyWindowProc($hWnd, $uiMsg, $wParam, $lParam)
	Switch $uiMsg
		Case $WM_PASTE
			Return do_clever_stuff_with_clipboard($hWnd)
		Case $WM_CONTEXTMENU
			If $hWnd = GUICtrlGetHandle($cInput) Then
				ShowMenu($hGui, $ContextMenu)
				Return 0
			EndIf
		Case $WM_SETCURSOR
			GUICtrlSetCursor(_WinAPI_GetDlgCtrlID($hWnd), 5); Setzt den Ibeam- (Text-) Cursor
			Return 1 ; Und verhindere, dass die Standard-Fensterprozedur alles durcheinanderbringt
	EndSwitch

	; Reiche die unbehandelten Nachrichten an die Standard-Fensterprozedur weiter
	Return _WinAPI_CallWindowProc($wProcOld, $hWnd, $uiMsg, $wParam, $lParam)
EndFunc   ;==>_MyWindowProc

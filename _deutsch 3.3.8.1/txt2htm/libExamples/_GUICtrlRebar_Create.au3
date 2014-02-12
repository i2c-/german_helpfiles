#include <GuiEdit.au3>
#include <GuiReBar.au3>
#include <GuiToolBar.au3>
#include <GuiComboBox.au3>
#include <GuiDateTimePicker.au3>
#include <WindowsConstants.au3>
#include <Constants.au3>
#include <GuiConstantsEx.au3>

$Debug_RB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Rebar-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $hReBar

_Main()

Func _Main()
	Local $hgui, $btnExit, $hToolbar, $hCombo, $hDTP, $hInput
	Local Enum $idNew = 1000, $idOpen, $idSave, $idHelp

	$hgui = GUICreate("Rebar", 400, 396, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU, $WS_MAXIMIZEBOX))

	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	; Erstellt ein Rebar-Control
	$hReBar = _GUICtrlRebar_Create($hgui, BitOR($CCS_TOP, $WS_BORDER, $RBS_VARHEIGHT, $RBS_AUTOSIZE, $RBS_BANDBORDERS))

	; Erstellt eine Toolbar
	$hToolbar = _GUICtrlToolbar_Create($hgui, BitOR($TBSTYLE_FLAT, $CCS_NORESIZE, $CCS_NOPARENTALIGN))

	; F&uuml;gt der Toolbar die Standard-Systembitmaps hinzu
	Switch _GUICtrlToolbar_GetBitmapFlags($hToolbar)
		Case 0
			_GUICtrlToolbar_AddBitmap($hToolbar, 1, -1, $IDB_STD_SMALL_COLOR)
		Case 2
			_GUICtrlToolbar_AddBitmap($hToolbar, 1, -1, $IDB_STD_LARGE_COLOR)
	EndSwitch

	; F&uuml;gt der Toolbar einige Standard-Buttons hinzu
	_GUICtrlToolbar_AddButton($hToolbar, $idNew, $STD_FILENEW)
	_GUICtrlToolbar_AddButton($hToolbar, $idOpen, $STD_FILEOPEN)
	_GUICtrlToolbar_AddButton($hToolbar, $idSave, $STD_FILESAVE)
	_GUICtrlToolbar_AddButtonSep($hToolbar)
	_GUICtrlToolbar_AddButton($hToolbar, $idHelp, $STD_HELP)

	; Erstellt eine Combobox
	$hCombo = _GUICtrlComboBox_Create($hgui, "", 0, 0, 120)

	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($hCombo)

	; Erstellt ein DTP (Kalender-Control)
	$hDTP = _GUICtrlDTP_Create($hgui, 0, 0, 190)

	; Erstellt eine Inputbox
;~ 	$hInput = GUICtrlCreateInput("Eingabebox", 0, 0, 120, 20)
	$hInput = _GUICtrlEdit_Create($hgui, "Eingabebox", 0, 0, 120, 20)


	; Voreinstellung f&uuml;r _AddBand ist anh&auml;ngen

	; F&uuml;gt eine neue Gruppe mit der Combobox in die Rebar ein
	_GUICtrlRebar_AddBand($hReBar, $hCombo, 120, 200, "Dir *.exe")

	; F&uuml;gt am Ende der Rebar eine neue Gruppe mit dem DTP (Kalender-Control) ein
	_GUICtrlRebar_AddBand($hReBar, $hDTP, 120)

	; F&uuml;gt eine Gruppe mit der Toolbar am Anfang der Rebar ein
	_GUICtrlRebar_AddToolBarBand($hReBar, $hToolbar, "", 0)

	; F&uuml;gt am Ende der Rebar eine Gruppe mit dem Input-Control ein
;~ 	_GUICtrlRebar_AddBand($hReBar, GUICtrlGetHandle($hInput), 120, 200, "Name:")
	_GUICtrlRebar_AddBand($hReBar, $hInput, 120, 200, "Name:")

	$btnExit = GUICtrlCreateButton("Beenden", 150, 360, 100, 25)
	GUISetState(@SW_SHOW)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $btnExit
				Exit
		EndSwitch
	WEnd
EndFunc   ;==>_Main

Func WM_NOTIFY($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg, $iwParam
	Local $hWndFrom, $iIDFrom, $iCode, $tNMHDR
	Local $tAUTOBREAK, $tAUTOSIZE, $tNMREBAR, $tCHEVRON, $tCHILDSIZE, $tOBJECTNOTIFY

	$tNMHDR = DllStructCreate($tagNMHDR, $ilParam)
	$hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	$iIDFrom = DllStructGetData($tNMHDR, "IDFrom")
	$iCode = DllStructGetData($tNMHDR, "Code")
	Switch $hWndFrom
		Case $hReBar
			Switch $iCode
				Case $RBN_AUTOBREAK
					; Meldet dem Parent der ReBar, dass ein Umbruch in der Leiste erscheinen soll. Der Parent entscheidet, ob der Umbruch ausgef&uuml;hrt wird.
					$tAUTOBREAK = DllStructCreate($tagNMREBARAUTOBREAK, $ilParam)
					_DebugPrint("$RBN_AUTOBREAK" & @LF & "->hWndFrom:" & @TAB & DllStructGetData($tAUTOBREAK, "hWndFrom") & @LF & _
							"->IDFrom:" & @TAB & DllStructGetData($tAUTOBREAK, "IDFrom") & @LF & _
							"->Code: " & @TAB & DllStructGetData($tAUTOBREAK, "Code") & @LF & _
							"->uBand:" & @TAB & DllStructGetData($tAUTOBREAK, "uBand") & @LF & _
							"->wID:" & @TAB & DllStructGetData($tAUTOBREAK, "wID") & @LF & _
							"->lParam:" & @TAB & DllStructGetData($tAUTOBREAK, "lParam") & @LF & _
							"->uMsg: " & @TAB & DllStructGetData($tAUTOBREAK, "uMsg") & @LF & _
							"->fStyleCurrent:" & DllStructGetData($tAUTOBREAK, "fStyleCurrent") & @LF & _
							"->fAutoBreak:" & @TAB & DllStructGetData($tAUTOBREAK, "fAutoBreak"))
					; R&uuml;ckgabewert wird nicht benutzt
				Case $RBN_AUTOSIZE
					; Wird vom Rebar-Control gesendet, wenn es mit $RBS_AUTOSIZE erstellt wurde und sich die Gr&ouml;&szlig;e &auml;ndert
					$tAUTOSIZE = DllStructCreate($tagNMRBAUTOSIZE, $ilParam)
					_DebugPrint("$RBN_AUTOSIZE" & @LF & "->hWndFrom:" & @TAB & DllStructGetData($tAUTOSIZE, "hWndFrom") & @LF & _
							"->IDFrom:" & @TAB & DllStructGetData($tAUTOSIZE, "IDFrom") & @LF & _
							"->Code: " & @TAB & DllStructGetData($tAUTOSIZE, "Code") & @LF & _
							"->fChanged:" & @TAB & DllStructGetData($tAUTOSIZE, "fChanged") & @LF & _
							"->TargetLeft:" & @TAB & DllStructGetData($tAUTOSIZE, "TargetLeft") & @LF & _
							"->TargetTop:" & @TAB & DllStructGetData($tAUTOSIZE, "TargetTop") & @LF & _
							"->TargetRight:" & @TAB & DllStructGetData($tAUTOSIZE, "TargetRight") & @LF & _
							"->TargetBottom:" & @TAB & DllStructGetData($tAUTOSIZE, "TargetBottom") & @LF & _
							"->ActualLeft:" & @TAB & DllStructGetData($tAUTOSIZE, "ActualLeft") & @LF & _
							"->ActualTop:" & @TAB & DllStructGetData($tAUTOSIZE, "ActualTop") & @LF & _
							"->ActualRight:" & @TAB & DllStructGetData($tAUTOSIZE, "ActualRight") & @LF & _
							"->ActualBottom:" & @TAB & DllStructGetData($tAUTOSIZE, "ActualBottom"))
					; R&uuml;ckgabewert wird nicht benutzt
				Case $RBN_BEGINDRAG
					; Wird vom Rebar-Control gesendet, wenn der Benutzer die Rebar zieht
					$tNMREBAR = DllStructCreate($tagNMREBAR, $ilParam)
					_DebugPrint("$RBN_BEGINDRAG" & @LF & "->hWndFrom:" & @TAB & DllStructGetData($tNMREBAR, "hWndFrom") & @LF & _
							"->IDFrom:" & @TAB & DllStructGetData($tNMREBAR, "IDFrom") & @LF & _
							"->Code: " & @TAB & DllStructGetData($tNMREBAR, "Code") & @LF & _
							"->dwMask:" & @TAB & DllStructGetData($tNMREBAR, "dwMask") & @LF & _
							"->uBand:" & @TAB & DllStructGetData($tNMREBAR, "uBand") & @LF & _
							"->fStyle:" & @TAB & DllStructGetData($tNMREBAR, "fStyle") & @LF & _
							"->wID:" & @TAB & DllStructGetData($tNMREBAR, "wID") & @LF & _
							"->lParam:" & @TAB & DllStructGetData($tNMREBAR, "lParam"))
					Return 0 ; Um der Rebar zu erlauben, die Zieh-Operation fortzusetzen
;~ 					Return 1 ; <> 0, um die Zieh-Operation abzubrechen
				Case $RBN_CHEVRONPUSHED
					; Wird vom Rebar-Control gesendet, wenn ein Eckwinkel gedr&uuml;ckt wird
					; Wenn eine Anwendung diese Nachricht empf&auml;ngt, ist sie f&uuml;r die Anzeige eines Popup-Men&uuml;s mit Eintr&auml;gen f&uuml;r jedes nicht angezeigte Werkzeug der Palette verantwortlich.
					; Mit Hilfe des rc-Mitglieds der NMREBARCHEVRON-Struktur kann die korrekte Position f&uuml;r das Popup-Men&uuml; ermittelt werden.
					$tCHEVRON = DllStructCreate($tagNMREBARCHEVRON, $ilParam)
					_DebugPrint("$RBN_CHEVRONPUSHED" & @LF & "->hWndFrom:" & @TAB & DllStructGetData($tCHEVRON, "hWndFrom") & @LF & _
							"->IDFrom:" & @TAB & DllStructGetData($tCHEVRON, "IDFrom") & @LF & _
							"->Code: " & @TAB & DllStructGetData($tCHEVRON, "Code") & @LF & _
							"->uBand:" & @TAB & DllStructGetData($tCHEVRON, "uBand") & @LF & _
							"->wID:" & @TAB & DllStructGetData($tCHEVRON, "wID") & @LF & _
							"->lParam:" & @TAB & DllStructGetData($tCHEVRON, "lParam") & @LF & _
							"->Left: " & @TAB & DllStructGetData($tCHEVRON, "Left") & @LF & _
							"->Top:" & @TAB & DllStructGetData($tCHEVRON, "Top") & @LF & _
							"->Right:" & @TAB & DllStructGetData($tCHEVRON, "Right") & @LF & _
							"->lParamNM:" & @TAB & DllStructGetData($tCHEVRON, "lParamNM"))
					; R&uuml;ckgabewert wird nicht benutzt
				Case $RBN_CHILDSIZE
					; Wird vom Rebar-Control gesendet, wenn die Gr&ouml;&szlig;e eines Child-Fensters der Gruppe ge&auml;ndert wird
					$tCHILDSIZE = DllStructCreate($tagNMREBARCHILDSIZE, $ilParam)
					_DebugPrint("$RBN_CHILDSIZE" & @LF & "->hWndFrom:" & @TAB & DllStructGetData($tCHILDSIZE, "hWndFrom") & @LF & _
							"->IDFrom:" & @TAB & DllStructGetData($tCHILDSIZE, "IDFrom") & @LF & _
							"->Code: " & @TAB & DllStructGetData($tCHILDSIZE, "Code") & @LF & _
							"->uBand:" & @TAB & DllStructGetData($tCHILDSIZE, "uBand") & @LF & _
							"->wID:" & @TAB & DllStructGetData($tCHILDSIZE, "wID") & @LF & _
							"->CLeft:" & @TAB & DllStructGetData($tCHILDSIZE, "CLeft") & @LF & _
							"->CTop: " & @TAB & DllStructGetData($tCHILDSIZE, "CTop") & @LF & _
							"->CRight:" & @TAB & DllStructGetData($tCHILDSIZE, "CRight") & @LF & _
							"->CBottom:" & @TAB & DllStructGetData($tCHILDSIZE, "CBottom") & @LF & _
							"->BLeft:" & @TAB & DllStructGetData($tCHILDSIZE, "BandLeft") & @LF & _
							"->BTop: " & @TAB & DllStructGetData($tCHILDSIZE, "BTop") & @LF & _
							"->BRight:" & @TAB & DllStructGetData($tCHILDSIZE, "BRight") & @LF & _
							"->BBottom:" & @TAB & DllStructGetData($tCHILDSIZE, "BBottom"))
					; R&uuml;ckgabewert wird nicht benutzt
				Case $RBN_DELETEDBAND
					; Wird vom Rebar-Control gesendet, nachdem eine Gruppe gel&ouml;scht wurde
					$tNMREBAR = DllStructCreate($tagNMREBAR, $ilParam)
					_DebugPrint("$RBN_DELETEDBAND" & @LF & "->hWndFrom:" & @TAB & DllStructGetData($tNMREBAR, "hWndFrom") & @LF & _
							"->IDFrom:" & @TAB & DllStructGetData($tNMREBAR, "IDFrom") & @LF & _
							"->Code: " & @TAB & DllStructGetData($tNMREBAR, "Code") & @LF & _
							"->dwMask:" & @TAB & DllStructGetData($tNMREBAR, "dwMask") & @LF & _
							"->uBand:" & @TAB & DllStructGetData($tNMREBAR, "uBand") & @LF & _
							"->fStyle:" & @TAB & DllStructGetData($tNMREBAR, "fStyle") & @LF & _
							"->wID:" & @TAB & DllStructGetData($tNMREBAR, "wID") & @LF & _
							"->lParam:" & @TAB & DllStructGetData($tNMREBAR, "lParam"))
					; R&uuml;ckgabewert wird nicht benutzt
				Case $RBN_DELETINGBAND
					; Wird vom Rebar-Control gesendet, wenn eine Gruppe gerade gel&ouml;scht wird
					$tNMREBAR = DllStructCreate($tagNMREBAR, $ilParam)
					_DebugPrint("$RBN_DELETINGBAND" & @LF & "->hWndFrom:" & @TAB & DllStructGetData($tNMREBAR, "hWndFrom") & @LF & _
							"->IDFrom:" & @TAB & DllStructGetData($tNMREBAR, "IDFrom") & @LF & _
							"->Code: " & @TAB & DllStructGetData($tNMREBAR, "Code") & @LF & _
							"->dwMask:" & @TAB & DllStructGetData($tNMREBAR, "dwMask") & @LF & _
							"->uBand:" & @TAB & DllStructGetData($tNMREBAR, "uBand") & @LF & _
							"->fStyle:" & @TAB & DllStructGetData($tNMREBAR, "fStyle") & @LF & _
							"->wID:" & @TAB & DllStructGetData($tNMREBAR, "wID") & @LF & _
							"->lParam:" & @TAB & DllStructGetData($tNMREBAR, "lParam"))
					; R&uuml;ckgabewert wird nicht benutzt
				Case $RBN_ENDDRAG
					; Wird vom Rebar-Control gesendet, wenn der Benutzer das Ziehen einer Gruppe stoppt
					$tNMREBAR = DllStructCreate($tagNMREBAR, $ilParam)
					_DebugPrint("$RBN_ENDDRAG" & @LF & "->hWndFrom:" & @TAB & DllStructGetData($tNMREBAR, "hWndFrom") & @LF & _
							"->IDFrom:" & @TAB & DllStructGetData($tNMREBAR, "IDFrom") & @LF & _
							"->Code: " & @TAB & DllStructGetData($tNMREBAR, "Code") & @LF & _
							"->dwMask:" & @TAB & DllStructGetData($tNMREBAR, "dwMask") & @LF & _
							"->uBand:" & @TAB & DllStructGetData($tNMREBAR, "uBand") & @LF & _
							"->fStyle:" & @TAB & DllStructGetData($tNMREBAR, "fStyle") & @LF & _
							"->wID:" & @TAB & DllStructGetData($tNMREBAR, "wID") & @LF & _
							"->lParam:" & @TAB & DllStructGetData($tNMREBAR, "lParam"))
					; R&uuml;ckgabewert wird nicht benutzt
				Case $RBN_GETOBJECT
					; Wird vom Rebar-Control gesendet, das mit dem Stil $RBS_REGISTERDROP erstellt wurde, wenn ein Objekt &uuml;ber eine Gruppe gezogen wird
					$tOBJECTNOTIFY = DllStructCreate($tagNMOBJECTNOTIFY, $ilParam)
					_DebugPrint("$RBN_GETOBJECT" & @LF & "->hWndFrom:" & @TAB & DllStructGetData($tOBJECTNOTIFY, "hWndFrom") & @LF & _
							"->IDFrom:" & @TAB & DllStructGetData($tOBJECTNOTIFY, "IDFrom") & @LF & _
							"->Code: " & @TAB & DllStructGetData($tOBJECTNOTIFY, "Code") & @LF & _
							"->Item: " & @TAB & DllStructGetData($tOBJECTNOTIFY, "Item") & @LF & _
							"->piid: " & @TAB & DllStructGetData($tOBJECTNOTIFY, "piid") & @LF & _
							"->pObject:" & @TAB & DllStructGetData($tOBJECTNOTIFY, "pObject") & @LF & _
							"->Result:" & @TAB & DllStructGetData($tOBJECTNOTIFY, "Result"))
					; R&uuml;ckgabewert wird nicht benutzt
				Case $RBN_HEIGHTCHANGE
					; Wird vom Rebar-Control gesendet, wenn seine H&ouml;he ge&auml;ndert wurde
					; Rebar-Controls mit dem Stil $CCS_VERT senden diese Nachricht, wenn die Breite ge&auml;ndert wurde
					_DebugPrint("$RBN_HEIGHTCHANGE" & @LF & "->hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"->Code: " & @TAB & $iCode)
					; R&uuml;ckgabewert wird nicht benutzt
				Case $RBN_LAYOUTCHANGED
					; Wird vom Rebar-Control gesendet, wenn der Benutzer das Layout der Gruppen &auml;ndert
					_DebugPrint("$RBN_LAYOUTCHANGED" & @LF & "->hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"->Code: " & @TAB & $iCode)
					; R&uuml;ckgabewert wird nicht benutzt
				Case $RBN_MINMAX
					; Wird vom Rebar-Control gesendet, bevor eine Gruppe maximiert oder minimiert wird
					_DebugPrint("$RBN_MINMAX" & @LF & "->hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"->Code: " & @TAB & $iCode)
;~ 					Return 1 ; <> 0, um die &Auml;nderung zu verhindern
					Return 0 ; Erlaubt die &Auml;nderung
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY

Func _DebugPrint($s_text, $line = @ScriptLineNumber)
	ConsoleWrite( _
			"!===========================================================" & @LF & _
			"+======================================================" & @LF & _
			"->Zeile " & StringFormat("%03d", $line) & ":" & @TAB & $s_text & @LF & _
			"+======================================================" & @LF)
EndFunc   ;==>_DebugPrint

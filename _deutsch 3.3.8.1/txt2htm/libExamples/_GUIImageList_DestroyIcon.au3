#include <GuiConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <WinAPI.au3>
#include <GuiImageList.au3>
#include <WindowsConstants.au3>

$Debug_SB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Imagelist-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $hStatus, $iMemo

_Main()

Func _Main()

	Local $hGUI, $hIcons[2], $hImage
	Local $aParts[4] = [75, 150, 300, 400]

	; Erstellt eine GUI
	$hGUI = GUICreate("Imagelist: Icon zerst&ouml;ren", 400, 300)
	$hStatus = _GUICtrlStatusBar_Create($hGUI)

	; Erstellt ein Memo Control
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 274, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	; Setzt die Abschnitte
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 1")
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 2", 1)

	; L&auml;dt die Bilder
	$hImage = _GUIImageList_Create(11, 11)
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hStatus, 0xFF0000, 11, 11))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hStatus, 0x00FF00, 11, 11))
	_GUIImageList_Add($hImage, _WinAPI_CreateSolidBitmap($hStatus, 0x0000FF, 11, 11))

	; Setzt die Icons
	$hIcons[0] = _GUIImageList_GetIcon($hImage, 1)
	$hIcons[1] = _GUIImageList_GetIcon($hImage, 2)
	_GUICtrlStatusBar_SetIcon($hStatus, 0, $hIcons[0])
	_GUICtrlStatusBar_SetIcon($hStatus, 1, $hIcons[1])

	; Zeigt die Handles der Icons
	MemoWrite("Icon-Handle vom Abschnitt 1 .: 0x" & Hex($hIcons[0]))
	MemoWrite("Icon-Handle vom Abschnitt 2 .: 0x" & Hex($hIcons[1]))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Icons zerst&ouml;ren
	MsgBox(4096, "Information", "Icon 1 zerst&ouml;rt? " & _GUIImageList_DestroyIcon($hIcons[0]))
	MsgBox(4096, "Information", "Icon 2 zerst&ouml;rt? " & _GUIImageList_DestroyIcon($hIcons[1]))
	GUIDelete()
EndFunc   ;==>_Main

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

Func WM_NOTIFY($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg, $iwParam
	Local $hWndFrom, $iIDFrom, $iCode, $tNMHDR

	$tNMHDR = DllStructCreate($tagNMHDR, $ilParam)
	$hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	$iIDFrom = DllStructGetData($tNMHDR, "IDFrom")
	$iCode = DllStructGetData($tNMHDR, "Code")
	Local $tinfo
	Switch $hWndFrom
		Case $hStatus
			Switch $iCode
				Case $NM_CLICK ; Der Benutzer hat die linke Maustaste innerhalb des Controls gedr&uuml;ckt
					$tinfo = DllStructCreate($tagNMMOUSE, $ilParam)
					$hWndFrom = HWnd(DllStructGetData($tinfo, "hWndFrom"))
					$iIDFrom = DllStructGetData($tinfo, "IDFrom")
					$iCode = DllStructGetData($tinfo, "Code")
					_DebugPrint("$NM_CLICK" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode & @LF & _
							"-->ItemSpec:" & @TAB & DllStructGetData($tinfo, "ItemSpec") & @LF & _
							"-->ItemData:" & @TAB & DllStructGetData($tinfo, "ItemData") & @LF & _
							"-->X:" & @TAB & DllStructGetData($tinfo, "X") & @LF & _
							"-->Y:" & @TAB & DllStructGetData($tinfo, "Y") & @LF & _
							"-->HitInfo:" & @TAB & DllStructGetData($tinfo, "HitInfo"))
					Return True ; Zeigt an, dass der Mausklick verarbeitet wurde und das Standardverhalten durch das System unterdr&uuml;ckt wurde
;~ 					Return FALSE ; Dies erlaubt das Standardverhalten bei einem Klick.
				Case $NM_DBLCLK ; Der Benutzer einen Doppelklick mit der linken Maustaste innerhalb des Controls durchgef&uuml;hrt
					$tinfo = DllStructCreate($tagNMMOUSE, $ilParam)
					$hWndFrom = HWnd(DllStructGetData($tinfo, "hWndFrom"))
					$iIDFrom = DllStructGetData($tinfo, "IDFrom")
					$iCode = DllStructGetData($tinfo, "Code")
					_DebugPrint("$NM_DBLCLK" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode & @LF & _
							"-->ItemSpec:" & @TAB & DllStructGetData($tinfo, "ItemSpec") & @LF & _
							"-->ItemData:" & @TAB & DllStructGetData($tinfo, "ItemData") & @LF & _
							"-->X:" & @TAB & DllStructGetData($tinfo, "X") & @LF & _
							"-->Y:" & @TAB & DllStructGetData($tinfo, "Y") & @LF & _
							"-->HitInfo:" & @TAB & DllStructGetData($tinfo, "HitInfo"))
					Return True ; Zeigt an, dass der Mausklick verarbeitet wurde und das Standardverhalten durch das System unterdr&uuml;ckt wurde
;~ 					Return FALSE ; Dies erlaubt das Standardverhalten bei einem Klick
				Case $NM_RCLICK ; Der Benutzer hat die rechte Maustaste innerhalb des Controls gedr&uuml;ckt
					$tinfo = DllStructCreate($tagNMMOUSE, $ilParam)
					$hWndFrom = HWnd(DllStructGetData($tinfo, "hWndFrom"))
					$iIDFrom = DllStructGetData($tinfo, "IDFrom")
					$iCode = DllStructGetData($tinfo, "Code")
					_DebugPrint("$NM_RCLICK" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode & @LF & _
							"-->ItemSpec:" & @TAB & DllStructGetData($tinfo, "ItemSpec") & @LF & _
							"-->ItemData:" & @TAB & DllStructGetData($tinfo, "ItemData") & @LF & _
							"-->X:" & @TAB & DllStructGetData($tinfo, "X") & @LF & _
							"-->Y:" & @TAB & DllStructGetData($tinfo, "Y") & @LF & _
							"-->HitInfo:" & @TAB & DllStructGetData($tinfo, "HitInfo"))
					Return True ; Zeigt an, dass der Mausklick verarbeitet wurde und das Standardverhalten durch das System unterdr&uuml;ckt wurde
;~ 					Return FALSE ; Dies erlaubt das Standardverhalten bei einem Klick
				Case $NM_RDBLCLK ; Der Benutzer einen Doppelklick mit der rechten Maustaste innerhalb des Controls durchgef&uuml;hrt
					$tinfo = DllStructCreate($tagNMMOUSE, $ilParam)
					$hWndFrom = HWnd(DllStructGetData($tinfo, "hWndFrom"))
					$iIDFrom = DllStructGetData($tinfo, "IDFrom")
					$iCode = DllStructGetData($tinfo, "Code")
					_DebugPrint("$NM_RDBLCLK" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode & @LF & _
							"-->ItemSpec:" & @TAB & DllStructGetData($tinfo, "ItemSpec") & @LF & _
							"-->ItemData:" & @TAB & DllStructGetData($tinfo, "ItemData") & @LF & _
							"-->X:" & @TAB & DllStructGetData($tinfo, "X") & @LF & _
							"-->Y:" & @TAB & DllStructGetData($tinfo, "Y") & @LF & _
							"-->HitInfo:" & @TAB & DllStructGetData($tinfo, "HitInfo"))
					Return True ; Zeigt an, dass der Mausklick verarbeitet wurde und das Standardverhalten durch das System unterdr&uuml;ckt wurde
;~ 					Return FALSE ; Dies erlaubt das Standardverhalten bei einem Klick
				Case $SBN_SIMPLEMODECHANGE ; &Auml;nderungen des 'einfachen Modus'
					_DebugPrint("$SBN_SIMPLEMODECHANGE" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
					; Kein R&uuml;ckgabewert
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY

Func _DebugPrint($s_text, $line = @ScriptLineNumber)
	ConsoleWrite( _
			"!===========================================================" & @LF & _
			"+======================================================" & @LF & _
			"-->Zeile(" & StringFormat("%04d", $line) & "):" & @TAB & $s_text & @LF & _
			"+======================================================" & @LF)
EndFunc   ;==>_DebugPrint

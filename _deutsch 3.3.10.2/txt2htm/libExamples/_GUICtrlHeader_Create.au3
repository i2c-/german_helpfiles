#include <GuiConstantsEx.au3>
#include <GuiHeader.au3>
#include <WindowsConstants.au3>

Global $hHeader

Example()

Func Example()
	Local $hGUI

	; Erstellt eine GUI
	$hGUI = GUICreate("Header", 400, 300)
	$hHeader = _GUICtrlHeader_Create($hGUI)
	GUISetState(@SW_SHOW)

	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	; F&uuml;gt die Spalten hinzu
	_GUICtrlHeader_AddItem($hHeader, "Spalte 1", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 2", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 3", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 4", 100)

	; L&ouml;scht alle Filter
	_GUICtrlHeader_ClearFilterAll($hHeader)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

Func WM_NOTIFY($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg, $iwParam
	Local $hWndFrom, $iIDFrom, $iCode
	Local $tNMHDR, $tNMHEADER, $tNMHDFILTERBTNCLICK, $tNMHDDISPINFO

	$tNMHDR = DllStructCreate($tagNMHDR, $ilParam)
	$hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	$iCode = DllStructGetData($tNMHDR, "Code")
	Switch $hWndFrom
		Case $hHeader
			Switch $iCode
				Case $HDN_BEGINDRAG ; Gesendet durch ein Header-Control, wenn eine Ziehoperation auf einem seiner Items begonnen wurde
					$tNMHEADER = DllStructCreate($tagNMHEADER, $ilParam)
					_DebugPrint("$HDN_BEGINDRAG" & @CRLF & "--> hWndFrom:" & @TAB & DllStructGetData($tNMHEADER, "hWndFrom") & @CRLF & _
							"-->IDFrom:" & @TAB & DllStructGetData($tNMHEADER, "IDFrom") & @CRLF & _
							"-->Code:" & @TAB & DllStructGetData($tNMHEADER, "Code") & @CRLF & _
							"-->Item:" & @TAB & DllStructGetData($tNMHEADER, "Item") & @CRLF & _
							"-->Button:" & @TAB & DllStructGetData($tNMHEADER, "Button"))
					Return False ; Dies erlaubt dem Header-Control, Drag-and-drop-Operationen automatisch zu behandeln
;~ 						Return True  ; Gibt an, dass Drag-and-drop-Operationen extern (manuell) behandelt werden, um dem Besitzer des Controls
					; Zu erm&ouml;glichen, zus&auml;tzliche Dienste als Teil des Drag-and-drop-Prozesses festzulegen
				Case $HDN_BEGINTRACK, $HDN_BEGINTRACKW ; Benachrichtigt das &uuml;bergeordnete Fenster des Header-Controls, dass der Benutzer mit dem Verschieben eines Trenners beginnt
					$tNMHEADER = DllStructCreate($tagNMHEADER, $ilParam)
					_DebugPrint("$HDN_BEGINTRACK" & @CRLF & "--> hWndFrom:" & @TAB & DllStructGetData($tNMHEADER, "hWndFrom") & @CRLF & _
							"-->IDFrom:" & @TAB & DllStructGetData($tNMHEADER, "IDFrom") & @CRLF & _
							"-->Code:" & @TAB & DllStructGetData($tNMHEADER, "Code") & @CRLF & _
							"-->Item:" & @TAB & DllStructGetData($tNMHEADER, "Item") & @CRLF & _
							"-->Button:" & @TAB & DllStructGetData($tNMHEADER, "Button"))
					Return False ; Um das Ziehen eines Trenners zu erlauben
;~ 						Return True  ; Um das Ziehen zu verhindern
				Case $HDN_DIVIDERDBLCLICK, $HDN_DIVIDERDBLCLICKW ; Benachrichtigt das &uuml;bergeordnete Fenster des Header-Controls, dass der Benutzer einen Doppelklick auf einen Trenner ausgef&uuml;hrt hat
					$tNMHEADER = DllStructCreate($tagNMHEADER, $ilParam)
					_DebugPrint("$HDN_DIVIDERDBLCLICK" & @CRLF & "--> hWndFrom:" & @TAB & DllStructGetData($tNMHEADER, "hWndFrom") & @CRLF & _
							"-->IDFrom:" & @TAB & DllStructGetData($tNMHEADER, "IDFrom") & @CRLF & _
							"-->Code:" & @TAB & DllStructGetData($tNMHEADER, "Code") & @CRLF & _
							"-->Item:" & @TAB & DllStructGetData($tNMHEADER, "Item") & @CRLF & _
							"-->Button:" & @TAB & DllStructGetData($tNMHEADER, "Button"))
					; Kein R&uuml;ckgabewert
				Case $HDN_ENDDRAG ; Das Header-Control sendet eine Nachricht, wenn eine Ziehoperation auf einem Item des Controls beendet wurde
					$tNMHEADER = DllStructCreate($tagNMHEADER, $ilParam)
					_DebugPrint("$HDN_ENDDRAG" & @CRLF & "--> hWndFrom:" & @TAB & DllStructGetData($tNMHEADER, "hWndFrom") & @CRLF & _
							"-->IDFrom:" & @TAB & DllStructGetData($tNMHEADER, "IDFrom") & @CRLF & _
							"-->Code:" & @TAB & DllStructGetData($tNMHEADER, "Code") & @CRLF & _
							"-->Item:" & @TAB & DllStructGetData($tNMHEADER, "Item") & @CRLF & _
							"-->Button:" & @TAB & DllStructGetData($tNMHEADER, "Button"))
					Return False ; Um dem Control das automatische Platzieren und Neu-Ordnen des Items zu erlauben
;~ 						Return True  ; Um das Platieren des Items zu verhindern
				Case $HDN_ENDTRACK, $HDN_ENDTRACKW ; Benachrichtigt das &uuml;bergeordnete Fenster des Header-Controls, dass der Benutzer mit dem verschieben eines Trenners fertig ist
					$tNMHEADER = DllStructCreate($tagNMHEADER, $ilParam)
					_DebugPrint("$HDN_ENDTRACK" & @CRLF & "--> hWndFrom:" & @TAB & DllStructGetData($tNMHEADER, "hWndFrom") & @CRLF & _
							"-->IDFrom:" & @TAB & DllStructGetData($tNMHEADER, "IDFrom") & @CRLF & _
							"-->Code:" & @TAB & DllStructGetData($tNMHEADER, "Code") & @CRLF & _
							"-->Item:" & @TAB & DllStructGetData($tNMHEADER, "Item") & @CRLF & _
							"-->Button:" & @TAB & DllStructGetData($tNMHEADER, "Button"))
					; Kein R&uuml;ckgabewert
				Case $HDN_FILTERBTNCLICK ; Benachrichtigt das &uuml;bergeordnete Fenster des Header-Controls, dass der Filter-Button angeklickt wurde oder das eine Antwort auf eine $HDM_SETITEM-Nachricht gekommen ist
					$tNMHDFILTERBTNCLICK = DllStructCreate($tagNMHDFILTERBTNCLICK, $ilParam)
					_DebugPrint("$HDN_FILTERBTNCLICK" & @CRLF & "--> hWndFrom:" & @TAB & DllStructGetData($tNMHDFILTERBTNCLICK, "hWndFrom") & @CRLF & _
							"-->IDFrom:" & @TAB & DllStructGetData($tNMHDFILTERBTNCLICK, "IDFrom") & @CRLF & _
							"-->Code:" & @TAB & DllStructGetData($tNMHDFILTERBTNCLICK, "Code") & @CRLF & _
							"-->Item:" & @TAB & DllStructGetData($tNMHDFILTERBTNCLICK, "Item") & @CRLF & _
							"-->Left:" & @TAB & DllStructGetData($tNMHDFILTERBTNCLICK, "Left") & @CRLF & _
							"-->Top:" & @TAB & DllStructGetData($tNMHDFILTERBTNCLICK, "Top") & @CRLF & _
							"-->Right:" & @TAB & DllStructGetData($tNMHDFILTERBTNCLICK, "Right") & @CRLF & _
							"-->Bottom:" & @TAB & DllStructGetData($tNMHDFILTERBTNCLICK, "Bottom"))
;~ 						Return True  ; Eine $HDN_FILTERCHANGE-Nachricht wird an das &uuml;bergeordnete Fenster des Header-Controls gesendet
					; Diese Nachricht erm&ouml;glicht dem &uuml;bergeordneten Fenster, seine UI-Items zu synchronisieren
					Return False ; Falls keine Nachricht gesendet werden soll
				Case $HDN_FILTERCHANGE ; Benachrichtigt das &uuml;bergeordnete Fenster des Header-Controls, dass die Attribute des Header-Controlfilters ge&auml;ndert wurden
					$tNMHEADER = DllStructCreate($tagNMHEADER, $ilParam)
					_DebugPrint("$HDN_FILTERCHANGE" & @CRLF & "--> hWndFrom:" & @TAB & DllStructGetData($tNMHEADER, "hWndFrom") & @CRLF & _
							"-->IDFrom:" & @TAB & DllStructGetData($tNMHEADER, "IDFrom") & @CRLF & _
							"-->Code:" & @TAB & DllStructGetData($tNMHEADER, "Code") & @CRLF & _
							"-->Item:" & @TAB & DllStructGetData($tNMHEADER, "Item") & @CRLF & _
							"-->Button:" & @TAB & DllStructGetData($tNMHEADER, "Button"))
					; Kein R&uuml;ckgabewert
				Case $HDN_GETDISPINFO, $HDN_GETDISPINFOW ; Sendet dem Besitzer des Header-Controls eine Nachricht, dass das Control Informationen &uuml;ber ein Callback-Headeritem ben&ouml;tigt
					$tNMHDDISPINFO = DllStructCreate($tagNMHDDISPINFO, $ilParam)
					_DebugPrint("$HDN_GETDISPINFO" & @CRLF & "--> hWndFrom:" & @TAB & DllStructGetData($tNMHDDISPINFO, "hWndFrom") & @CRLF & _
							"-->IDFrom:" & @TAB & DllStructGetData($tNMHDDISPINFO, "IDFrom") & @CRLF & _
							"-->Code:" & @TAB & DllStructGetData($tNMHDDISPINFO, "Code") & @CRLF & _
							"-->Item:" & @TAB & DllStructGetData($tNMHDDISPINFO, "Item"))
;~ 						Return LRESULT
				Case $HDN_ITEMCHANGED, $HDN_ITEMCHANGEDW ; Benachrichtigt das &uuml;bergeordnete Fenster des Header-Controls, dass sich die Attribute eines Header-Items ge&auml;ndert haben
					$tNMHEADER = DllStructCreate($tagNMHEADER, $ilParam)
					_DebugPrint("$HDN_ITEMCHANGED" & @CRLF & "--> hWndFrom:" & @TAB & DllStructGetData($tNMHEADER, "hWndFrom") & @CRLF & _
							"-->IDFrom:" & @TAB & DllStructGetData($tNMHEADER, "IDFrom") & @CRLF & _
							"-->Code:" & @TAB & DllStructGetData($tNMHEADER, "Code") & @CRLF & _
							"-->Item:" & @TAB & DllStructGetData($tNMHEADER, "Item") & @CRLF & _
							"-->Button:" & @TAB & DllStructGetData($tNMHEADER, "Button"))
					; Kein R&uuml;ckgabewert
				Case $HDN_ITEMCHANGING, $HDN_ITEMCHANGINGW ; Benachrichtigt das &uuml;bergeordnete Fenster des Header-Controls, dass sich die Attribute eines Headeritems &auml;ndern
					$tNMHEADER = DllStructCreate($tagNMHEADER, $ilParam)
					_DebugPrint("$HDN_ITEMCHANGING" & @CRLF & "--> hWndFrom:" & @TAB & DllStructGetData($tNMHEADER, "hWndFrom") & @CRLF & _
							"-->IDFrom:" & @TAB & DllStructGetData($tNMHEADER, "IDFrom") & @CRLF & _
							"-->Code:" & @TAB & DllStructGetData($tNMHEADER, "Code") & @CRLF & _
							"-->Item:" & @TAB & DllStructGetData($tNMHEADER, "Item") & @CRLF & _
							"-->Button:" & @TAB & DllStructGetData($tNMHEADER, "Button"))
					Return False ; Um &Auml;nderungen zu erlauben
;~ 						Return True  ; Verhindert dies
				Case $HDN_ITEMCLICK, $HDN_ITEMCLICKW ; Benachrichtigt das &uuml;bergeordnete Fenster des Header-Controls, dass der Benutzer einen Einfachklick auf das Control durchgef&uuml;hrt hat
					$tNMHEADER = DllStructCreate($tagNMHEADER, $ilParam)
					_DebugPrint("$HDN_ITEMCLICK" & @CRLF & "--> hWndFrom:" & @TAB & DllStructGetData($tNMHEADER, "hWndFrom") & @CRLF & _
							"-->IDFrom:" & @TAB & DllStructGetData($tNMHEADER, "IDFrom") & @CRLF & _
							"-->Code:" & @TAB & DllStructGetData($tNMHEADER, "Code") & @CRLF & _
							"-->Item:" & @TAB & DllStructGetData($tNMHEADER, "Item") & @CRLF & _
							"-->Button:" & @TAB & DllStructGetData($tNMHEADER, "Button"))
					; Kein R&uuml;ckgabewert
				Case $HDN_ITEMDBLCLICK, $HDN_ITEMDBLCLICKW ; Benachrichtigt das &uuml;bergeordnete Fenster des Header-Controls, dass der Benutzer einen Doppelklick auf das Control durchgef&uuml;hrt hat
					$tNMHEADER = DllStructCreate($tagNMHEADER, $ilParam)
					_DebugPrint("$HDN_ITEMDBLCLICK" & @CRLF & "--> hWndFrom:" & @TAB & DllStructGetData($tNMHEADER, "hWndFrom") & @CRLF & _
							"-->IDFrom:" & @TAB & DllStructGetData($tNMHEADER, "IDFrom") & @CRLF & _
							"-->Code:" & @TAB & DllStructGetData($tNMHEADER, "Code") & @CRLF & _
							"-->Item:" & @TAB & DllStructGetData($tNMHEADER, "Item") & @CRLF & _
							"-->Button:" & @TAB & DllStructGetData($tNMHEADER, "Button"))
					; Kein R&uuml;ckgabewert
				Case $HDN_TRACK, $HDN_TRACKW ; Benachrichtigt das &uuml;bergeordnete Fenster des Header-Controls, dass der Benutzer einen Trenner im Header-Control verschiebt
					$tNMHEADER = DllStructCreate($tagNMHEADER, $ilParam)
					_DebugPrint("$HDN_TRACK" & @CRLF & "--> hWndFrom:" & @TAB & DllStructGetData($tNMHEADER, "hWndFrom") & @CRLF & _
							"-->IDFrom:" & @TAB & DllStructGetData($tNMHEADER, "IDFrom") & @CRLF & _
							"-->Code:" & @TAB & DllStructGetData($tNMHEADER, "Code") & @CRLF & _
							"-->Item:" & @TAB & DllStructGetData($tNMHEADER, "Item") & @CRLF & _
							"-->Button:" & @TAB & DllStructGetData($tNMHEADER, "Button"))
					Return False ; Um das Verschieben das Trenners fortzusetzen
;~ 						Return True  ; Um das Verschieben zu beenden
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY

Func _DebugPrint($s_text, $line = @ScriptLineNumber)
	ConsoleWrite( _
			"!===========================================================" & @CRLF & _
			"+======================================================" & @CRLF & _
			"-->Zeile(" & StringFormat("%04d", $line) & "):" & @TAB & $s_text & @CRLF & _
			"+======================================================" & @CRLF)
EndFunc   ;==>_DebugPrint

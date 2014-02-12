#include <GUIConstantsEx.au3>
#include <GuiHeader.au3>

Global $hHeader, $iMemo, $iLabel, $bShowMe = True


Example()

Func Example()
	Local $hGUI

	; Erstellt eine GUI
	$hGUI = GUICreate("Header", 500, 350)
	$hHeader = _GUICtrlHeader_Create($hGUI)
	$iMemo = GUICtrlCreateEdit("", 2, 74, 496, 274, -1)
	$iLabel = GUICtrlCreateLabel("&Auml;ndere die Reihenfolge der Header-Items (durch Verschieben mit der Maus) und beobachte den Text!", 8, 40)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUICtrlSetFont($iLabel, 8, 400, 0, "MS Sans Serif")
	GUISetState(@SW_SHOW)

	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY") ; Eigene Nachrichtenbehandlung registrieren

	; F&uuml;gt die Spalten hinzu
	_GUICtrlHeader_AddItem($hHeader, "Spalte 1", 125)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 2", 125)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 3", 125)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 4", 125)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
		; Wenn die EndDrag-Nachricht empfangen wurde, dann Text ausgeben
		If $bShowMe Then
			; Ermittelt den Index f&uuml;r ein Item, das an dritter Stelle steht (0-basiert), zeigt au&szlig;erdem dessen Itemtext an
			MemoWrite("Index des Items, das an 3. Stelle steht: " & _GUICtrlHeader_OrderToIndex($hHeader, 2) & _
					" (" & _GUICtrlHeader_GetItemText($hHeader, _GUICtrlHeader_OrderToIndex($hHeader, 2)) & ")")
			; Ermittelt die Position des 3. Items (mit dem Index 2, da 0-basiert) in der Headerleiste (0-basiert)
			MemoWrite(@CRLF & "Position des 3. Items (Spalte 3): " & _GUICtrlHeader_GetItemOrder($hHeader, 2) & @CRLF & @CRLF)
			$bShowMe = False
		EndIf
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example


; EndDrag-Nachricht abfangen
Func WM_NOTIFY($hWnd, $iMsg, $iwParam, $ilParam)
	Local $hWndFrom, $iIDFrom, $iCode
	Local $tNMHDR, $tNMHEADER
	$tNMHDR = DllStructCreate($tagNMHDR, $ilParam)
	$hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	$iIDFrom = DllStructGetData($tNMHDR, "IDFrom")
	$iCode = DllStructGetData($tNMHDR, "Code")
	Switch $hWndFrom
		Case $hHeader
			Switch $iCode
				Case $HDN_ENDDRAG ; Wird vom Header-Control gesendet, wenn eine Drag-Operation auf einem seiner Items endet
					$tNMHEADER = DllStructCreate($tagNMHEADER, $ilParam)
					$bShowMe = True
					Return False ; Erlaubt dem Control, das Item automatisch einzuordnen und zu platzieren
					;Return True  ; Verbietet dem Control, das Item zu platzieren
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG ; Standard-Nachrichtenbehandlung ausf&uuml;hren
EndFunc   ;==>WM_NOTIFY

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

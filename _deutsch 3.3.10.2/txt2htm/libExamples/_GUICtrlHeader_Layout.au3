#include <GuiConstantsEx.au3>
#include <GuiHeader.au3>
#include <WinAPI.au3>

Global $iMemo

Example()

Func Example()
	Local $hGUI, $hHeader, $tRect, $tPos

	; Erstellt eine GUI
	$hGUI = GUICreate("Header", 400, 300)
	$hHeader = _GUICtrlHeader_Create($hGUI)
	$iMemo = GUICtrlCreateEdit("", 2, 24, 396, 274, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; F&uuml;gt die Spalten hinzu
	_GUICtrlHeader_AddItem($hHeader, "Spalte 1", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 2", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 3", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 4", 100)

	; Ermittelt die korrekte Gr&ouml;&szlig;e und Position des Controls
	$tRect = _WinAPI_GetClientRect($hGUI)
	$tPos = _GUICtrlHeader_Layout($hHeader, $tRect)

	; Zeigt die korrekte Gr&ouml;&szlig;e und Position des Controls
	MemoWrite("Fenster Handle .....: " & DllStructGetData($tPos, "hWnd"))
	MemoWrite("Z Reihenfolge Handle: " & DllStructGetData($tPos, "InsertAfter"))
	MemoWrite("Horizontale Position: " & DllStructGetData($tPos, "X"))
	MemoWrite("Vertikale Position .: " & DllStructGetData($tPos, "Y"))
	MemoWrite("Breite .............: " & DllStructGetData($tPos, "CX"))
	MemoWrite("H&ouml;he... ............: " & DllStructGetData($tPos, "CY"))
	MemoWrite("Flags ..............: " & DllStructGetData($tPos, "Flags"))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

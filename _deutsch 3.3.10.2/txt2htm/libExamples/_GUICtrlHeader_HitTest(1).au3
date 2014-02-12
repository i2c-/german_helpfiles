#include <GuiConstantsEx.au3>
#include <GuiHeader.au3>

Global $iMemo

Example()

Func Example()
	Local $hGUI, $hHeader, $aHT

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

	; Testet einen Punkt (Spalte2), um zu ermitteln, welches Item sich an dem festgelegten Punkt befindet.
	$aHT = _GUICtrlHeader_HitTest($hHeader, 110, 10)
	MemoWrite("Itemindex ................................: " & $aHT[0])
	MemoWrite("Im Fenster ...............................: " & $aHT[1])
	MemoWrite("Im Rechteck des Controls ...........: " & $aHT[2])
	MemoWrite("Zwischen zwei Items ......................: " & $aHT[3])
	MemoWrite("Auf einem Item welches die Breite 0 hat: " & $aHT[4])
	MemoWrite("&Uuml;ber einem Filterbereich .................: " & $aHT[5])
	MemoWrite("Auf dem Filterbutton .....................: " & $aHT[6])
	MemoWrite("&Uuml;ber dem begrenzenden Rechteck ...........: " & $aHT[7])
	MemoWrite("Unterhalb des begrenzenden Rechtecks .....: " & $aHT[8])
	MemoWrite("Rechts des begrenzenden Rechtecks ........: " & $aHT[9])
	MemoWrite("Links des begrenzenden Rechtecks .........: " & $aHT[10])

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Schreibt eine Zeile in das Memo Control
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

#include <GuiConstantsEx.au3>
#include <GuiHeader.au3>

Global $iMemo

Example()

Func Example()
	Local $hGUI, $hHeader

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

	; Zeigt das Unicode Format
	MemoWrite("Verwendung von Unicode Zeichen: " & _GUICtrlHeader_GetUnicodeFormat($hHeader))

	; Setzt das Unicode Format
	_GUICtrlHeader_SetUnicodeFormat($hHeader, True)

	; Zeigt das Unicode Format
	MemoWrite("Verwendung von Unicode Zeichen: " & _GUICtrlHeader_GetUnicodeFormat($hHeader))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

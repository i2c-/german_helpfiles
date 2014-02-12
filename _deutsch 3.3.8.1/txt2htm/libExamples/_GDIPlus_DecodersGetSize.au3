#include <GuiConstantsEx.au3>
#include <GDIPlus.au3>
#include <WindowsConstants.au3>

Global $iMemo

_Main()

Func _Main()
	; Erstellt eine GUI
	GUICreate("GDI+", 600, 400)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 596, 396, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; Initialisiert (startet) Microsoft Windows GDI+
	_GDIPlus_Startup()

	; Zeigt die Anzahl von Decodern/Encodern
	MemoWrite("Decoder Anzahl : " & _GDIPlus_DecodersGetCount());
	MemoWrite("Decoder Gr&ouml;&szlig;e .: " & _GDIPlus_DecodersGetSize());
	MemoWrite("Encoder Anzahl : " & _GDIPlus_EncodersGetCount());
	MemoWrite("Encoder Gr&ouml;&szlig;e .: " & _GDIPlus_EncodersGetSize());

	; Gibt die durch Microsoft Windows GDI+ verwendeten Ressourcen wieder frei
	_GDIPlus_Shutdown()

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>_Main

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage = '')
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

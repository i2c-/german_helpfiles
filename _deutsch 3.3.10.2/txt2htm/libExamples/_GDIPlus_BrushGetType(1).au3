#include <GuiConstantsEx.au3>
#include <GDIPlus.au3>
#include <WindowsConstants.au3>

Global $iMemo

Example()

Func Example()
	Local $hBrush1, $hBrush2

	; Erstellt eine GUI
	GUICreate("GDI+", 400, 300)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 596, 396, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Erstellt das F&uuml;llmuster
	_GDIPlus_Startup()
	$hBrush1 = _GDIPlus_BrushCreateSolid()
	$hBrush2 = _GDIPlus_BrushClone($hBrush1)

	; Zeigt Informationen &uuml;ber das F&uuml;llmuster
	MemoWrite("F&uuml;llmuster 1 Handle : 0x" & Hex($hBrush1))
	MemoWrite("F&uuml;llmuster 1 Typ ...: " & _GDIPlus_BrushGetType($hBrush1))
	MemoWrite("F&uuml;llmuster 2 Handle : 0x" & Hex($hBrush2))
	MemoWrite("F&uuml;llmuster 2 Typ ...: " & _GDIPlus_BrushGetType($hBrush2))

	; Ressourcen freigeben
	_GDIPlus_BrushDispose($hBrush2)
	_GDIPlus_BrushDispose($hBrush1)
	_GDIPlus_Shutdown()

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage = '')
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

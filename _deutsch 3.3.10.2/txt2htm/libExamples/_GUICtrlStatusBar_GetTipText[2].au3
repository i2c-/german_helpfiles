#include <GuiConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <WinAPI.au3>
#include <WindowsConstants.au3>

Global $iMemo

Example()

Func Example()
	Local $hGUI, $hStatus
	Local $aParts[4] = [75, 150, 300, 400]

	; Erstellt eine GUI
	$hGUI = GUICreate("(Beispiel 2) StatusBar: Ermittelt den Tiptext", 400, 300)
	$hStatus = _GUICtrlStatusBar_Create($hGUI, -1, "", $SBARS_TOOLTIPS)

	; Erstellt ein Memo Control
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 274, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Setzt die Abschnitte
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)
	_GUICtrlStatusBar_SetText($hStatus, "Erzwungene Tips werden anzeigt, wenn der Text nicht in die Box passt", 1)

	; Setzt das Icon
	_GUICtrlStatusBar_SetIcon($hStatus, 0, 23, "shell32.dll")

	; Setzt den Tiptext
	_GUICtrlStatusBar_SetTipText($hStatus, 0, "Tip funktioniert, wenn nur das Icon in dem Abschnitt oder Text die Abschnitte &uuml;berschreitet")
	_GUICtrlStatusBar_SetTipText($hStatus, 1, "Erzwungene Tips werden anzeigt, wenn der Text nicht in die Box passt")

	MemoWrite("Den Mauszeiger &uuml;ber den Abschnitten halten, um den Tipp anzuzeigen." & @CRLF)

	; Zeigt den Tiptext
	MemoWrite("Tiptext 1 .: " & _GUICtrlStatusBar_GetTipText($hStatus, 0) & @CRLF)
	MemoWrite("Tiptext 2 .: " & _GUICtrlStatusBar_GetTipText($hStatus, 1))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

#include <GuiRichEdit.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Main()

Func Main()
	Local $hGui, $hRichEdit, $iMsg
	$hGui = GUICreate("Beispiel (" & StringTrimRight(@ScriptName, 4) & ")", 320, 350, -1, -1)
	$hRichEdit = _GUICtrlRichEdit_Create($hGui, "Das ist ein Test.", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	GUISetState()

	_GUICtrlRichEdit_AppendText($hRichEdit, "Absatz mit Standard Randeinstellung ")
	MsgBox(4096, "", "Die Standard Randeinstellungen f&uuml;r den Absatz sind " & _GUICtrlRichEdit_GetParaBorder($hRichEdit))

	_GUICtrlRichEdit_AppendText($hRichEdit, @CR & "Zweiter Absatz")
	_GUICtrlRichEdit_SetParaBorder($hRichEdit, "o", 3, "mag", 0.25)
	MsgBox(4096, "", "Randeinstellung f&uuml;r den 2. Absatz sind " & _GUICtrlRichEdit_GetParaBorder($hRichEdit))

	_GUICtrlRichEdit_SetSel($hRichEdit, 10, -1)
	Sleep(1000)
	MsgBox(4096, "", "Randeinstellungen f&uuml;r den ersten Absatz der Auswahl sind " & _GUICtrlRichEdit_GetParaBorder($hRichEdit))

	;  Wechsel von Aussenbegrenzung  zu Linksbegrenzung
	_GUICtrlRichEdit_SetParaBorder($hRichEdit, "l")

	; Legt eine Datei auf dem Desktop an, damit man sich die Randeinstellungen in Word ansehen kann
	_GUICtrlRichEdit_Deselect($hRichEdit)
	_GUICtrlRichEdit_StreamToFile($hRichEdit, @DesktopDir & "\gcre.rtf")

	While True
		$iMsg = GUIGetMsg()
		Select
			Case $iMsg = $GUI_EVENT_CLOSE
				_GUICtrlRichEdit_Destroy($hRichEdit) ; wird ben&ouml;tigt, da sonst das Skript abst&uuml;rzt
;~ 				GUIDelete() 	; ist auch in Ordnung
				Exit
		EndSelect
	WEnd
EndFunc   ;==>Main

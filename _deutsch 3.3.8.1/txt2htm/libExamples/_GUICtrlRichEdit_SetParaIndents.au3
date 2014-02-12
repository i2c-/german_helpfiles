#include <GuiRichEdit.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Global $lblMsg, $hRichEdit

Main()

Func Main()
	Local $hGui, $iMsg, $btnNext, $iStep = 0
	$hGui = GUICreate("Beispiel (" & StringTrimRight(@ScriptName, 4) & ")", 320, 350, -1, -1)
	$hRichEdit = _GUICtrlRichEdit_Create($hGui, "Dies ist ein Test.", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$lblMsg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	$btnNext = GUICtrlCreateButton("Weiter", 270, 310, 40, 30)
	GUISetState()

	_GUICtrlRichEdit_SetText($hRichEdit, "Erster Absatz")
	Report("Absatz mit den Standardeigenschaften")

	While True
		$iMsg = GUIGetMsg()
		Select
			Case $iMsg = $GUI_EVENT_CLOSE
				_GUICtrlRichEdit_Destroy($hRichEdit) ; wird ben&ouml;tigt, da sonst das Skript abst&uuml;rzt
;~ 				GUIDelete() 	; ist auch in Ordnung
				Exit
			Case $iMsg = $btnNext
				$iStep += 1
				Switch $iStep
					Case 1
						_GUICtrlRichEdit_AppendText($hRichEdit, @CR & "Zweiter Absatz")
						Report("F&uuml;ge einen weiteren Absatz hinzu")
					Case 2
						_GUICtrlRichEdit_SetParaIndents($hRichEdit, 0.25, .1)
						Report("&Auml;ndere die Eigenschaften des zweiten Absatzes")
					Case 3
						_GUICtrlRichEdit_SetSel($hRichEdit, 10, 26)
						_GUICtrlRichEdit_SetParaIndents($hRichEdit, Default, 0, .2)
						Report("&Auml;ndere die Eigenschaften beider Abs&auml;tze")
					Case 4
						; Zeichnet allen Text in einer Datei auf dem Desktop auf, um dessen Eigenschaften in Word anzuzeigen
						_GUICtrlRichEdit_Deselect($hRichEdit)
						_GUICtrlRichEdit_StreamToFile($hRichEdit, @DesktopDir & "\gcre.rtf")
						GUICtrlSetState($btnNext, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Main

Func Report($sMsg)
	$sMsg = $sMsg & @CR & @CR & "Die R&uuml;ckgaben der Funktion " & @CR & _GUICtrlRichEdit_GetParaIndents($hRichEdit)
	GUICtrlSetData($lblMsg, $sMsg)
	ControlFocus($hRichEdit, "", "")
EndFunc   ;==>Report

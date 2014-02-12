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
	GUISetState(@SW_SHOW)

	_GUICtrlRichEdit_AppendText($hRichEdit, "Erster Absatz")
	Report("Erster Absatz: Standardeigenschaften")

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
						_GUICtrlRichEdit_SetParaAttributes($hRichEdit, "-hyp")
						Report("Zweiter Absatz: Silbentrennung aus")
					Case 2
						_GUICtrlRichEdit_SetSel($hRichEdit, 10, -1)
						_GUICtrlRichEdit_SetParaAttributes($hRichEdit, "-hyp;+fpg;+kpn")
						Report("Eigenschaften des ersten Absatzes der Auswahl")
					Case 3
						; Zeichnet allen Text in einer Datei auf dem Desktop auf, um dessen Eigenschaften in Word anzuzeigen
						_GUICtrlRichEdit_Deselect($hRichEdit)
						_GUICtrlRichEdit_StreamToFile($hRichEdit, @DesktopDir & "\gcre.rtf")
						GUICtrlSetState($btnNext, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Main

Func Report($sMsg)
	$sMsg = $sMsg & @CR & @CR & "Die R&uuml;ckgaben der Funktion " & @CR & _GUICtrlRichEdit_GetParaAttributes($hRichEdit)
	GUICtrlSetData($lblMsg, $sMsg)
EndFunc   ;==>Report

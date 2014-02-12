#include <GuiRichEdit.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Global $lblMsg, $hRichEdit

Main()

Func Main()
	Local $hGui, $iMsg, $iStep = 0, $btnNext
	$hGui = GUICreate("Beispiel (" & StringTrimRight(@ScriptName, 4) & ")", 320, 350, -1, -1)
	$hRichEdit = _GUICtrlRichEdit_Create($hGui, "Dies ist ein Test.", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$lblMsg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	$btnNext = GUICtrlCreateButton("Weiter", 250, 310, 60, 30)
	GUISetState(@SW_SHOW)

	_GUICtrlRichEdit_AppendText($hRichEdit, "Erster Absatz")
	Report("0. Erster Absatz: Standardeinstellungen")

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
						_GUICtrlRichEdit_SetParaBorder($hRichEdit, "o", 3, "mag", 0.25)
						Report("1. Zweiter Absatz: mit Rand (sollte in Word angezeigt werden)")
					Case 2
						_GUICtrlRichEdit_SetSel($hRichEdit, 10, -1)
						Report("2. Einstellungen des ersten Absatzes in der Markierung")
					Case 3
						_GUICtrlRichEdit_SetParaBorder($hRichEdit, "l", 6, "blu")
						Report("3. Einstellungen beider Abs&auml;tze ge&auml;ndert")
					Case 4
						_GUICtrlRichEdit_SetParaBorder($hRichEdit, Default, ".75gd")
						Report("4. Zeilenstil ge&auml;ndert")
					Case 5
						; Streamt den kompletten Text in eine Datei auf dem Desktop. Die R&auml;ndereinstellungen k&ouml;nnen in Word eingesehen werden
						_GUICtrlRichEdit_Deselect($hRichEdit)
						_GUICtrlRichEdit_StreamToFile($hRichEdit, @DesktopDir & "\gcre.rtf")
						GUICtrlSetState($btnNext, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Main

Func Report($sMsg)
	$sMsg = $sMsg & @CR & @CR & "Funktionsr&uuml;ckgabe " & @CR & _GUICtrlRichEdit_GetParaBorder($hRichEdit)
	GUICtrlSetData($lblMsg, $sMsg)
EndFunc   ;==>Report

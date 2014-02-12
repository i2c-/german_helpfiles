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

	_GUICtrlRichEdit_SetText($hRichEdit, "Erster Absatz")
	Report("0. Absatz mit den Standardeinstellungen")

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
						_GUICtrlRichEdit_SetParaSpacing($hRichEdit, "2 lines", .2, .25)
						Report("1. Der Abstand des zweiten Absatzes ist ")
					Case 2
						_GUICtrlRichEdit_SetSel($hRichEdit, 0, 2)
						Report("2. Die Einstellungen des ersten Absatzes in der Auswahl sind ")
					Case 3
						_GUICtrlRichEdit_SetSel($hRichEdit, 10, 26)
						_GUICtrlRichEdit_SetParaSpacing($hRichEdit, Default, .1)
						Report("3. &Auml;ndere den Abstand beider Abs&auml;tze")
					Case 4
						; Streamt den Text in eine Datei auf dem Desktop, um dessen Eigenschaften in Word ansehen zu k&ouml;nnen.
						_GUICtrlRichEdit_Deselect($hRichEdit)
						_GUICtrlRichEdit_StreamToFile($hRichEdit, @DesktopDir & "\gcre.rtf")
						GUICtrlSetState($btnNext, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Main

Func Report($sMsg)
	$sMsg = $sMsg & @CR & @CR & "R&uuml;ckgaben der Funktion " & @CR & _GUICtrlRichEdit_GetParaSpacing($hRichEdit)
	GUICtrlSetData($lblMsg, $sMsg)
EndFunc   ;==>Report

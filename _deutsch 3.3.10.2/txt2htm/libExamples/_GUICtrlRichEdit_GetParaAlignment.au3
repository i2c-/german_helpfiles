#include <GuiRichEdit.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Global $lblMsg, $hRichEdit

Main()

Func Main()
	Local $hGui, $iMsg, $iCp, $btnNext, $iStep = 0
	$hGui = GUICreate("Beispiel (" & StringTrimRight(@ScriptName, 4) & ")", 320, 350, -1, -1)
	$hRichEdit = _GUICtrlRichEdit_Create($hGui, "Dies ist ein Test.", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$lblMsg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	$btnNext = GUICtrlCreateButton("Weiter", 270, 310, 40, 30)
	GUISetState(@SW_SHOW)

	_GUICtrlRichEdit_SetText($hRichEdit, "Erster Absatz")
	Report("Erster Absatz")
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
						_GUICtrlRichEdit_SetParaAlignment($hRichEdit, "r")
						Report("Erster Absatz")
					Case 2
						_GUICtrlRichEdit_AppendText($hRichEdit, @CR & "Zweiter Absatz")
						_GUICtrlRichEdit_SetParaAlignment($hRichEdit, "c")
						Report("Zweiter Absatz")
					Case 3
						_GUICtrlRichEdit_AppendText($hRichEdit, @CR & "Dritter Absatz")
						_GUICtrlRichEdit_SetParaAlignment($hRichEdit, "l")
						Report("Dritter Absatz")
					Case 4
						$iCp = _GUICtrlRichEdit_GetFirstCharPosOnLine($hRichEdit, 2)
						_GUICtrlRichEdit_SetSel($hRichEdit, $iCp, -1)
						Report("Ausrichtung der Abs&auml;tze in der Auswahl")
						GUICtrlSetState($btnNext, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Main

Func Report($sMsg)
	$sMsg = $sMsg & @CR & @CR & " Die R&uuml;ckgaben der Funktion " & @CR & _GUICtrlRichEdit_GetParaAlignment($hRichEdit)
	GUICtrlSetData($lblMsg, $sMsg)
EndFunc   ;==>Report

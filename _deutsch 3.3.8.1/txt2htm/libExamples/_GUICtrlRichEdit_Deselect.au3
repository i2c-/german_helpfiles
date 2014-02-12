#include <GuiRichEdit.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Global $lblMsg, $hRichEdit

Main()

Func Main()
	Local $hGui, $iMsg, $ai, $btnNext, $iStep = 0
	$hGui = GUICreate("Beispiel (" & StringTrimRight(@ScriptName, 4) & ")", 320, 350, -1, -1)
	$hRichEdit = _GUICtrlRichEdit_Create($hGui, "Das ist ein Test.", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$lblMsg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	$btnNext = GUICtrlCreateButton("Weiter", 270, 310, 40, 30)
	GUISetState()

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
						_GUICtrlRichEdit_SetSel($hRichEdit, 5, 12)
						$ai = _GUICtrlRichEdit_GetSel($hRichEdit)
						Report("1.Selektierter Text von Position  " & $ai[0] & " bis " & $ai[1])
					Case 2
						_GUICtrlRichEdit_Deselect($hRichEdit)
						$ai = _GUICtrlRichEdit_GetSel($hRichEdit)
						If $ai[0] = $ai[1] Then Report("2.Jetzt ist kein Text mehr selektiert")
						GUICtrlSetState($btnNext, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Main

Func Report($sMsg)
	GUICtrlSetData($lblMsg, $sMsg)
EndFunc   ;==>Report

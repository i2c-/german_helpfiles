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
	_GUICtrlRichEdit_PauseRedraw($hRichEdit)
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
						_GUICtrlRichEdit_SetSel($hRichEdit, 5, 2)
						Report("1.Aktualisierung ist pausiert")
					Case 2
						_GUICtrlRichEdit_InsertText($hRichEdit, "EINGEF&Uuml;GT_2")
						Report("2.Text wurde am aktiven Punkt der Auswahl eingef&uuml;gt")
					Case 3
						_GUICtrlRichEdit_GotoCharPos($hRichEdit, 20)
						_GUICtrlRichEdit_InsertText($hRichEdit, "EINGEF&Uuml;GT_3")
						Report("3.Text wurde am Einf&uuml;gungspunkt eingef&uuml;gt und die Aktualisierung ist wieder aktiviert")
						_GUICtrlRichEdit_ResumeRedraw($hRichEdit)
						GUICtrlSetState($btnNext, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Main

Func Report($sMsg)
	GUICtrlSetData($lblMsg, $sMsg)
EndFunc   ;==>Report

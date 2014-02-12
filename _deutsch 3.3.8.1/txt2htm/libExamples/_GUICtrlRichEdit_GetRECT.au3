#include <GuiRichEdit.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Global $lblMsg, $hRichEdit

Main()

Func Main()
	Local $hGui, $iMsg, $btnNext, $iStep = 0
	$hGui = GUICreate("Beispiel (" & StringTrimRight(@ScriptName, 4) & ")", 320, 350, -1, -1)
	$hRichEdit = _GUICtrlRichEdit_Create($hGui, "", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$lblMsg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	$btnNext = GUICtrlCreateButton("Weiter", 270, 310, 40, 30)
	GUISetState()

	_GUICtrlRichEdit_SetText($hRichEdit, "Erster Absatz")
	_GUICtrlRichEdit_AppendText($hRichEdit, @CR & "Zweiter Absatz")

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
						Report("1. Standardeinstellungen ")
					Case 2
						_GUICtrlRichEdit_SetRECT($hRichEdit, 10, 10, 100, 100)
						Report("2. Einstellungen ")
					Case 3
						_GUICtrlRichEdit_SetRECT($hRichEdit)
						Report("3. Einstellungen wieder auf Standard")
						GUICtrlSetState($btnNext, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Main

Func Report($sMsg)
	Local $aRect = _GUICtrlRichEdit_GetRECT($hRichEdit)
	$sMsg = $sMsg & @CR & @CR & "Links=" & $aRect[0] & " Oben=" & $aRect[1] & " Rechts=" & $aRect[2] & " Unten=" & $aRect[3]
	GUICtrlSetData($lblMsg, $sMsg)
	ControlFocus($hRichEdit, "", "")
EndFunc   ;==>Report

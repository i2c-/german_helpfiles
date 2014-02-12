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

	For $i = 1 To 20
		_GUICtrlRichEdit_AppendText($hRichEdit, "Zeile " & $i & @CR)
	Next
	_GUICtrlRichEdit_AppendText($hRichEdit, "Zeile 21")

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
						_GUICtrlRichEdit_ScrollLines($hRichEdit, -10.2)
						Report("Sichtfeld nach oben verschoben")
					Case 2
						_GUICtrlRichEdit_ScrollLines($hRichEdit, +100)
						Report("Sichtfeld nach unten verschoben, sodass nur die letzte Zeile zu sehen ist")
					Case 3
						_GUICtrlRichEdit_ScrollLines($hRichEdit, -200)
						Report("Sichtfeld zur&uuml;ckgeschoben")
						GUICtrlSetState($btnNext, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Main

Func Report($sMsg)
	GUICtrlSetData($lblMsg, $sMsg)
	ControlFocus($hRichEdit, "", "")
EndFunc   ;==>Report

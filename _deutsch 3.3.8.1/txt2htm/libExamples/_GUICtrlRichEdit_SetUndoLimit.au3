#include <GuiRichEdit.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Main()

Func Main()
	Local $hGui, $iMsg, $btnNext, $iStep = 0, $lblMsg, $hRichEdit
	$hGui = GUICreate("Beispiel (" & StringTrimRight(@ScriptName, 4) & ")", 320, 350, -1, -1)
	$hRichEdit = _GUICtrlRichEdit_Create($hGui, "Dies ist ein Test.", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$lblMsg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	$btnNext = GUICtrlCreateButton("Weiter", 270, 310, 40, 30)
	GUISetState()

	_GUICtrlRichEdit_SetText($hRichEdit, "Erster Absatz")
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
						_GUICtrlRichEdit_SetUndoLimit($hRichEdit, 200)
						GUICtrlSetData($lblMsg, 'Anzahl der Aktionen, die in der R&uuml;ckg&auml;ngig-Schlange gespeichert werden k&ouml;nnen, von 100 auf 200 erh&ouml;ht')
					Case 2
						_GUICtrlRichEdit_SetUndoLimit($hRichEdit, 0)
						GUICtrlSetData($lblMsg, "R&uuml;ckg&auml;ngig ist deaktiviert")
						GUICtrlSetState($btnNext, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Main

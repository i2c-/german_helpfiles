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
						DoIt("lu", "Eine Zeile nach oben gescrollt.")
					Case 2
						DoIt("pu", "Eine Seite nach oben gescrollt.")
					Case 3
						DoIt("pd", "Eine Seite nach unten gescrollt.")
					Case 4
						DoIt("pd", "Versuch, um eine weitere Seite zu scrollen.")
						GUICtrlSetState($btnNext, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Main

Func DoIt($sAction, $sMsg)
	Local $iQlines
	$iQlines = _GUICtrlRichEdit_ScrollLineOrPage($hRichEdit, $sAction)
	GUICtrlSetData($lblMsg, $sMsg & @CR & @CR & "Gescrollt um " & $iQlines & " Zeilen.")
EndFunc   ;==>DoIt

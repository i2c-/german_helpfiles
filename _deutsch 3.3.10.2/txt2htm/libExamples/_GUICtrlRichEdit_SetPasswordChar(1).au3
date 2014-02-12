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

	Report("Status nach Erstellung:")

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
						_GUICtrlRichEdit_SetPasswordChar($hRichEdit, "*")
						Report("Passwortzeichen ge&auml;ndert. Gib etwas ein.")
					Case 2
						_GUICtrlRichEdit_SetPasswordChar($hRichEdit, "")
						Report("Zur&uuml;ck ge&auml;ndert.")
						GUICtrlSetState($btnNext, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Main

Func Report($sMsg)
	Local $ch
	$ch = _GUICtrlRichEdit_GetPasswordChar($hRichEdit)
	If $ch = "" Then
		$sMsg &= @CR & "Zeichen werden angezeigt, wie sie getippt wurden."
	Else
		$sMsg = $sMsg & @CR & 'Zeichen werden als " ' & $ch & ' " angezeigt'
	EndIf
	GUICtrlSetData($lblMsg, $sMsg)
EndFunc   ;==>Report

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

	_GUICtrlRichEdit_SetText($hRichEdit, "Absatz 1")
	For $i = 2 To 20
		_GUICtrlRichEdit_AppendText($hRichEdit, @CRLF & "Absatz " & $i)
	Next
	Report("0. Zuerst verschoben, um die Einf&uuml;gemarke zu zeigen")

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
						_GUICtrlRichEdit_SetScrollPos($hRichEdit, 0, 0)
						Report("1. Zum Anfang verschoben")
					Case 2
						_GUICtrlRichEdit_SetScrollPos($hRichEdit, 7, 22)
						Report("2. Nach rechts unten verschoben")
						GUICtrlSetState($btnNext, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Main

Func Report($sMsg)
	Local $aPos = _GUICtrlRichEdit_GetScrollPos($hRichEdit)
	$sMsg = $sMsg & @CR & @CR & "Die Position ist " & $aPos[0] & ";" & $aPos[1]
	GUICtrlSetData($lblMsg, $sMsg)
	ControlFocus($hRichEdit, "", "")
EndFunc   ;==>Report

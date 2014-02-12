#include <GuiRichEdit.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Color.au3>

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
						Report("1. Standard")
					Case 2
						_GUICtrlRichEdit_SetCharColor($hRichEdit, "304050")
						Report("2. Einstellungen jetzt")
					Case 3
						_GUICtrlRichEdit_SetSel($hRichEdit, 1, 5)
						_GUICtrlRichEdit_SetCharColor($hRichEdit)
						Report("3. Farbe einiger Zeichen ge&auml;ndert")
					Case 4
						_GUICtrlRichEdit_SetSel($hRichEdit, 6, -1)
						; Zeichnet allen Text in einer Datei auf dem Desktop auf, um dessen Eigenschaften in Word anzuzeigen
						_GUICtrlRichEdit_Deselect($hRichEdit)
						_GUICtrlRichEdit_StreamToFile($hRichEdit, @DesktopDir & "\gcre.rtf")
						Report("4. In Datei gespeichert")
						GUICtrlSetState($btnNext, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Main

Func Report($sMsg)
	Local $iColor = _GUICtrlRichEdit_GetCharColor($hRichEdit)
;~ 	Local $sMixed = _Iif(@extended, "Eine Farbe in der Auswahl", "Verschiedene Farben in der Auswahl")
	Local $sMixed = @extended
	Local $aRet = _ColorGetRGB($iColor)
	$sMsg = $sMsg & @CR & @CR & $aRet[0] & "; " & $aRet[1] & "; " & $aRet[2] & "  Hex=0x" & StringTrimLeft(Hex($iColor), 2) & _
			@CR & "@extended = " & $sMixed
	GUICtrlSetData($lblMsg, $sMsg)
	ControlFocus($hRichEdit, "", "")
EndFunc   ;==>Report

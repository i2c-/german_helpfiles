#include <GuiRichEdit.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Color.au3>

Global $lblMsg, $hRichEdit

Main()

Func Main()
	Local $hGui, $iMsg, $btnNext, $iStep = 0
	$hGui = GUICreate("Beispiel (" & StringTrimRight(@ScriptName, 4) & ")", 370, 350, -1, -1)
	$hRichEdit = _GUICtrlRichEdit_Create($hGui, "", 10, 10, 350, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$lblMsg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	$btnNext = GUICtrlCreateButton("Weiter", 320, 310, 40, 30)
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
						Report("1. Grundeinstellung")
					Case 2
						_GUICtrlRichEdit_SetSel($hRichEdit, 2, 5)
						_GUICtrlRichEdit_SetCharBkColor($hRichEdit, "304050")
						Report("2. Aktuelle Einstellung")
					Case 3
						_GUICtrlRichEdit_SetCharBkColor($hRichEdit)
						Report("3. Hintergrund einiger Zeichen ge&auml;ndert")
					Case 4
						_GUICtrlRichEdit_SetSel($hRichEdit, 0, -1)
						; Streamt den kompletten Text in eine Datei auf dem Desktop, so kann man die Einstellungen in Word ansehen
						_GUICtrlRichEdit_Deselect($hRichEdit)
						_GUICtrlRichEdit_StreamToFile($hRichEdit, @DesktopDir & "\gcre.rtf")
						Report("4. In Datei gespeichert")
						GUICtrlSetState($btnNext, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Main

Func Report($sMsg)
	Local $iBkColor = _GUICtrlRichEdit_GetCharBkColor($hRichEdit)
	Local $sMixed = _Iif(@extended, "+", "~")
	Local $aRet = _ColorGetRGB($iBkColor)
	$sMsg = $sMsg & @CR & @CR & $aRet[0] & ";" & $aRet[1] & ";" & $aRet[2] & " BkColor=0x" & StringTrimLeft(Hex($iBkColor), 2) & ": " & $sMixed
	GUICtrlSetData($lblMsg, $sMsg)
	ControlFocus($hRichEdit, "", "")
EndFunc   ;==>Report

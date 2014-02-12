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
	$btnNext = GUICtrlCreateButton("Weiter", 250, 310, 60, 30)
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
						_GUICtrlRichEdit_SetCharBkColor($hRichEdit, "304050")
						Report("2. Aktuelle Einstellung")
					Case 3
						_GUICtrlRichEdit_SetSel($hRichEdit, 1, 5)
						_GUICtrlRichEdit_SetCharBkColor($hRichEdit, "sys")
						_GUICtrlRichEdit_SetSel($hRichEdit, 0, 0)
						Report("3. Hintergrund einiger Zeichen ge&auml;ndert")
					Case 4
						_GUICtrlRichEdit_Deselect($hRichEdit)
						; Speichert den kompletten Text in eine Datei auf dem Desktop, sodass man die Einstellungen in Word ansehen kann
						_GUICtrlRichEdit_StreamToFile($hRichEdit, @DesktopDir & "\gcre.rtf")
						GUICtrlSetState($btnNext, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Main

Func Report($sMsg)
	Local $iColor = _GUICtrlRichEdit_GetCharBkColor($hRichEdit)
	Local $aRet = _ColorGetRGB($iColor)
	$sMsg = $sMsg & @CR & @CR & $aRet[0] & ";" & $aRet[1] & ";" & $aRet[2] & " BkColor=0x" & StringTrimLeft(Hex($iColor), 2)
	GUICtrlSetData($lblMsg, $sMsg)
EndFunc   ;==>Report

#include <GuiRichEdit.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Global $lblMsg, $hRichEdit

Main()

Func Main()
	Local $hGui, $iMsg, $btnNext, $iStep = 0, $iCp1
	$hGui = GUICreate("Beispiel (" & StringTrimRight(@ScriptName, 4) & ")", 320, 350, -1, -1)
	$hRichEdit = _GUICtrlRichEdit_Create($hGui, "Dies ist ein Test.", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL, $ES_NOHIDESEL))
	$lblMsg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	$btnNext = GUICtrlCreateButton("Weiter", 270, 310, 40, 30)
	GUISetState(@SW_SHOW)

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
						_GUICtrlRichEdit_SetSel($hRichEdit, 0, 3)
						Report("1. Zeichen-Attribute am Anfang von Zeile 1 sind")
					Case 2
						_GUICtrlRichEdit_AutoDetectURL($hRichEdit, True)
						_GUICtrlRichEdit_AppendText($hRichEdit, @CR & "http://www.autoitscript.com")
						$iCp1 = _GUICtrlRichEdit_GetFirstCharPosOnLine($hRichEdit, 2)
						_GUICtrlRichEdit_SetSel($hRichEdit, $iCp1, $iCp1 + 3)
						Report("2. Zeichen-Attribute am Anfang von Zeile 2 sind")
						GUICtrlSetState($btnNext, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Main

Func Report($sMsg)
	Local $sRet = _GUICtrlRichEdit_GetCharAttributes($hRichEdit)
	$sMsg = $sMsg & @CR & @CR & "Zeichen-Attribute = " & $sRet
	GUICtrlSetData($lblMsg, $sMsg)
EndFunc   ;==>Report

#include <GuiRichEdit.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Global $lblMsg, $hRichEdit

Main()

Func Main()
	Local $hGui, $iMsg, $btnNext, $iStep = 0
	$hGui = GUICreate("Beispiel (" & StringTrimRight(@ScriptName, 4) & ")", 370, 350, -1, -1)
	$hRichEdit = _GUICtrlRichEdit_Create($hGui, "Dies ist ein Test.", 10, 10, 350, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$lblMsg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	$btnNext = GUICtrlCreateButton("Weiter", 270, 310, 40, 30)
	GUISetState(@SW_SHOW)

	_GUICtrlRichEdit_SetText($hRichEdit, "Erster Absatz")
	Report("0. Absatz mit Standardeinstellungen")

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
						_GUICtrlRichEdit_AppendText($hRichEdit, @CR & "Zweiter Absatz")
						_GUICtrlRichEdit_SetParaTabStops($hRichEdit, ".3l ;1c ;2.5r.")
						Report("1. Tabstopps des zweiten Absatzes")
					Case 2
						_GUICtrlRichEdit_SetSel($hRichEdit, 0, 2)
						Report("2. Tabstopps des ersten Absatzes")
					Case 3
						_GUICtrlRichEdit_SetSel($hRichEdit, 10, 26)
						Report("Tabstopps des ersten Absatzes in der Auswahl")
					Case 4
						_GUICtrlRichEdit_SetParaTabStops($hRichEdit, "2.3r=")
						Report("3. &Auml;ndere die Tabstopps beider Abs&auml;tze")
					Case 5
						; Schreibt den Text in eine Datei auf dem Desktop, um die Einstellungen in Word anschauen zu k&ouml;nnen
						_GUICtrlRichEdit_Deselect($hRichEdit)
						_GUICtrlRichEdit_StreamToFile($hRichEdit, @DesktopDir & "\gcre.rtf")
						GUICtrlSetState($btnNext, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Main

Func Report($sMsg)
	$sMsg = $sMsg & @CR & @CR & "R&uuml;ckgabewerte von _GetParaTabStops: " & @CR & _GUICtrlRichEdit_GetParaTabStops($hRichEdit)
	GUICtrlSetData($lblMsg, $sMsg)
EndFunc   ;==>Report

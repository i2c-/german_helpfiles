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
	GUISetState()

	_GUICtrlRichEdit_SetText($hRichEdit, "Absatz 1")
	_GUICtrlRichEdit_AppendText($hRichEdit, @CR & @TAB & "Absatz 2")
	_GUICtrlRichEdit_AppendText($hRichEdit, @CR & @TAB & @TAB & "Absatz 3")
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
						_GUICtrlRichEdit_SetTabStops($hRichEdit, 1)
						GUICtrlSetData($lblMsg, "1. Setzt die Tabstops bei jedem Inch (1 Inch = 2,54 cm)")
					Case 2
						_GUICtrlRichEdit_SetTabStops($hRichEdit, "0.5;1.5")
						GUICtrlSetData($lblMsg, "2. Setzt die Tabstops auf 0,5 und 1,5 Inch")

						; Speichert den Text in einer Datei auf dem Desktop, damit Sie die Einstellungen in Word sehen k&ouml;nnen
						_GUICtrlRichEdit_Deselect($hRichEdit)
						_GUICtrlRichEdit_StreamToFile($hRichEdit, @DesktopDir & "\gcre.rtf")
						GUICtrlSetState($btnNext, $GUI_DISABLE)
				EndSwitch
		EndSelect
	WEnd
EndFunc   ;==>Main

#include <GuiRichEdit.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Global $lblMsg, $hRichEdit

Main()

Func Main()
	Local $hGui, $iMsg, $btnNext, $iCp = 200
	$hGui = GUICreate("Beispiel (" & StringTrimRight(@ScriptName, 4) & ")", 320, 350, -1, -1)
	$hRichEdit = _GUICtrlRichEdit_Create($hGui, "Dies ist ein Test.", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$lblMsg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	$btnNext = GUICtrlCreateButton("Weiter", 270, 310, 40, 30)
	GUISetState()

	_GUICtrlRichEdit_AppendText($hRichEdit, "AutoIt v3 ist eine kostenlose, BASIC-artige Skriptsprache, die f&uuml;r " _
			 & "die Automatisierung der Windows-Oberfl&auml;che und allgemeines Skripten entwickelt wurde.")

	While True
		$iMsg = GUIGetMsg()
		Select
			Case $iMsg = $GUI_EVENT_CLOSE
				_GUICtrlRichEdit_Destroy($hRichEdit) ; wird ben&ouml;tigt, da sonst das Skript abst&uuml;rzt
;~ 				GUIDelete() 	; ist auch in Ordnung
				Exit
			Case $iMsg = $btnNext
				$iCp = _GUICtrlRichEdit_GetCharPosOfPreviousWord($hRichEdit, $iCp)
				GUICtrlSetData($lblMsg, $iCp)
				ControlFocus($hRichEdit, "", "")
				_GUICtrlRichEdit_GotoCharPos($hRichEdit, $iCp)
		EndSelect
	WEnd
EndFunc   ;==>Main

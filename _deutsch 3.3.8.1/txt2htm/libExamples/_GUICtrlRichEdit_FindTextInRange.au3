#include <GuiRichEdit.au3>
#include <GUIConstantsEx.au3>
#include <GuiRichEdit.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Global $lblMsg, $hRichEdit

Main()

Func Main()
	Local $hGui, $iMsg, $ai
	$hGui = GUICreate("Beispiel (" & StringTrimRight(@ScriptName, 4) & ")", 320, 350, -1, -1)
	$hRichEdit = _GUICtrlRichEdit_Create($hGui, "Dies ist ein Test.", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$lblMsg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	GUISetState()

	_GUICtrlRichEdit_AppendText($hRichEdit, @CR & "Dies ist der angeh&auml;ngte Text.")

	$ai = _GUICtrlRichEdit_FindTextInRange($hRichEdit, "test", 20, 6)
	Report('"Test" gefunden zwischen den Zeichenpositionen ' & $ai[0] & " und " & $ai[1])

	While True
		$iMsg = GUIGetMsg()
		Select
			Case $iMsg = $GUI_EVENT_CLOSE
				_GUICtrlRichEdit_Destroy($hRichEdit) ; wird ben&ouml;tigt, da sonst das Skript abst&uuml;rzt
;~ 				GUIDelete() 	; ist auch in Ordnung
				Exit
		EndSelect
	WEnd
EndFunc   ;==>Main

Func Report($sMsg)
	GUICtrlSetData($lblMsg, $sMsg)
EndFunc   ;==>Report

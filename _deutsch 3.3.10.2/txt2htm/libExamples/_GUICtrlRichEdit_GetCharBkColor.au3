#include <GuiRichEdit.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Color.au3>

Global $lblMsg, $hRichEdit

Example()

Func Example()
	Local $hGui, $btnNext, $iStep = 0
	$hGui = GUICreate(StringTrimRight(@ScriptName, 4), 420, 350, -1, -1)
	$hRichEdit = _GUICtrlRichEdit_Create($hGui, 'Dies ist ein Test.', 10, 10, 400, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	$lblMsg = GUICtrlCreateLabel("", 10, 235, 300, 60)
	$btnNext = GUICtrlCreateButton("N&auml;chste", 270, 310, 60, 30)
	GUISetState(@SW_SHOW)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				_GUICtrlRichEdit_Destroy($hRichEdit) ; wird ben&ouml;tigt, da sonst das Skript abst&uuml;rzt
				GUIDelete()
				Exit
			Case $btnNext
				$iStep += 1
				Switch $iStep
					Case 1
						Report("1. Grundeinstellung")
					Case 2
						_GUICtrlRichEdit_SetCharBkColor($hRichEdit, Dec('00FF00'))
						Report("2. Aktuelle Einstellung")
					Case 3
						_GUICtrlRichEdit_SetSel($hRichEdit, 1, 5)
						_GUICtrlRichEdit_SetCharBkColor($hRichEdit, Dec('8888FF'))
						Report("3. Hintergrund einiger Zeichen ge&auml;ndert")
					Case 4
						; Streamt den kompletten Text in eine Datei auf dem Desktop, so kann man die Einstellungen in Word ansehen
						_GUICtrlRichEdit_StreamToFile($hRichEdit, @DesktopDir & "\gcre.rtf")
						GUICtrlSetState($btnNext, $GUI_DISABLE)
						GUICtrlSetData($lblMsg, "4. Es wurde eine Datei namens gcre.rtf auf dem Desktop gespeichert")
				EndSwitch
		EndSwitch
	WEnd
EndFunc   ;==>Example

Func Report($sMsg)
	Local $iColor = _GUICtrlRichEdit_GetCharBkColor($hRichEdit)
	Local $aRet = _ColorGetRGB($iColor)
	$sMsg &= @CRLF & @CRLF & $aRet[0] & ";" & $aRet[1] & ";" & $aRet[2] & " BkColor=0x" & Hex($iColor)
	GUICtrlSetData($lblMsg, $sMsg)
EndFunc   ;==>Report

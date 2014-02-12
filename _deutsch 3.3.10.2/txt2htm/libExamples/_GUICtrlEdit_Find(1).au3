#include <GuiEdit.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

; verwendet die AutoIt-Funktion

Example_Internal()

Func Example_Internal()
	Local $s_texttest = "Das ist ein Test." & @CRLF & _
			"Das ist nur ein Test." & @CRLF & _
			"Das Testen sollte bei dir genauso funktionieren wie bei mir!"
	Local $Button1, $Button2, $msg, $hEdit

	GUICreate('Beispiel: Suchen und Ersetzen mit AutoIt ' & FileGetVersion(@AutoItExe), 622, 448, 192, 125)
	$hEdit = GUICtrlCreateEdit($s_texttest, 64, 24, 505, 233, _
			BitOR($ES_AUTOVSCROLL, $WS_VSCROLL, $ES_MULTILINE, $WS_HSCROLL, $ES_NOHIDESEL))
	$Button1 = GUICtrlCreateButton("Suchen", 176, 288, 121, 33, 0)
	$Button2 = GUICtrlCreateButton("Suchen und Ersetzen", 368, 288, 121, 33, 0)
	GUISetState(@SW_SHOW)

	While 1
		$msg = GUIGetMsg()
		Select
			Case $msg = $GUI_EVENT_CLOSE
				ExitLoop
			Case $msg = $Button1
				_GUICtrlEdit_Find($hEdit)
			Case $msg = $Button2
				_GUICtrlEdit_Find($hEdit, True)
			Case Else
				;;;;;;;
		EndSelect
	WEnd
	GUIDelete()
EndFunc   ;==>Example_Internal

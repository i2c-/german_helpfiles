#include <GuiEdit.au3>
#include <GuiConstantsEx.au3>
#include <WindowsConstants.au3>

$Debug_Ed = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Edit-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Example_Internal() ; Test in der eigenen GUI
Example_External() ; Test im Notepad-Editor

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
	GUISetState()

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

Func Example_External()
	Local $s_texttest = 'Beispiel: Suchen und Ersetzen mit AutoIt ' & FileGetVersion(@AutoItExe) & @LF & _
			"Das ist ein Test." & @LF & _
			"Das ist nur ein Test." & @LF & _
			"Das Testen sollte bei dir genauso funktionieren wie bei mir!"
	Local $whandle, $handle
	Local $Title = "[CLASS:Notepad]"

	Run("notepad.exe", "", @SW_MAXIMIZE)

	; Wartet bis der Fenstertitel "Unbenannt" existiert"
	WinWait($Title)

	; Ermittelt das Handle eines Notepad-Fensters
	$whandle = WinGetHandle($Title)
	If @error Then
		MsgBox(4096, "Fehler", "Das korrekte Fenster konnte nicht gefunden worden")
	Else
		$handle = ControlGetHandle($whandle, "", "Edit1")
		If @error Then
			MsgBox(4096, "Fehler", "Das korrekte Control konnte nicht gefunden worden")
		Else
			; Sendet etwas Text direkt zu dem Edit-Control des Notepad-Fensters
			ControlSend($whandle, "", "Edit1", $s_texttest)
			_GUICtrlEdit_Find($handle, True)
		EndIf
	EndIf
EndFunc   ;==>Example_External

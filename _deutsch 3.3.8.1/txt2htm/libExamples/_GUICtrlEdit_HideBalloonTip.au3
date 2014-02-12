#include <GuiEdit.au3>
#include <GuiConstantsEx.au3>

$Debug_Ed = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Edit-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hGui, $hEdit, $sTitle = "ShowBalloonTip", $sText = "Zeigt einen Balloontip, der mit einem Edit-Control verbunden ist"

	; Erstellt eine GUI
	$hGui = GUICreate("Edit: Versteckt einen Balloontip", 400, 300)
	$hEdit = GUICtrlCreateEdit("", 2, 2, 394, 268)
	GUISetState()

	; Setzt den Text
	_GUICtrlEdit_SetText($hEdit, "Dies ist ein Text" & @CRLF & "Eine andere Zeile" & @CRLF & "An das Ende anh&auml;ngen?" & @CRLF & @CRLF)

	_GUICtrlEdit_ShowBalloonTip($hEdit, $sTitle, $sText, $TTI_INFO)
	Sleep(1000)
	Local $bool = _GUICtrlEdit_HideBalloonTip($hEdit)
	_GUICtrlEdit_AppendText($hEdit, "BalloonTip verstecken= " & $bool & @CRLF)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

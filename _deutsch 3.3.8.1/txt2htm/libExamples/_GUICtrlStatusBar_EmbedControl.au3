#include <GuiConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <ProgressConstants.au3>
#include <SendMessage.au3>

$Debug_SB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die StatusBar-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()

	Local $hGUI, $hProgress, $hInput, $input, $progress, $hStatus
	Local $aParts[4] = [80, 160, 300, -1]

	; Erstellt eine GUI
	$hGUI = GUICreate("StatusBar: Control einbinden", 400, 300)

	;===============================================================================
	; Standard ist 1 Abschnitt und kein Text
	$hStatus = _GUICtrlStatusBar_Create($hGUI)
	_GUICtrlStatusBar_SetMinHeight($hStatus, 20)

	;===============================================================================
	GUISetState()

	; Initialisiert drei Abschnitte
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 1")
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 2", 1)

	; Bindet eine Progressbar in das Control ein
	If @OSType = "WIN32_WINDOWS" Then
		$progress = GUICtrlCreateProgress(0, 0, -1, -1, $PBS_SMOOTH)
		$hProgress = GUICtrlGetHandle($progress)
		_GUICtrlStatusBar_EmbedControl($hStatus, 2, $hProgress)
	Else
		$progress = GUICtrlCreateProgress(0, 0, -1, -1, $PBS_MARQUEE) ; Der Stil 'marquee' funktioniert bei Windows XP und neuer
		$hProgress = GUICtrlGetHandle($progress)
		_GUICtrlStatusBar_EmbedControl($hStatus, 2, $hProgress)
		_SendMessage($hProgress, $PBM_SETMARQUEE, True, 200) ; Der Stil 'marquee' funktioniert bei Windows XP und neuer
	EndIf

	$input = GUICtrlCreateInput("Dies wurde eingebunden", 0, 0)
	$hInput = GUICtrlGetHandle($input)
	_GUICtrlStatusBar_EmbedControl($hStatus, 3, $hInput, 3)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

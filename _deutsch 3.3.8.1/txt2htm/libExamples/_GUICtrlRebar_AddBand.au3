#include <GuiReBar.au3>
#include <GuiComboBox.au3>
#include <GuiDateTimePicker.au3>
#include <WindowsConstants.au3>
#include <Constants.au3>
#include <GuiConstantsEx.au3>

$Debug_RB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Rebar-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hgui, $btnExit, $hCombo, $hReBar, $hDTP, $hInput

	$hgui = GUICreate("Rebar", 400, 396, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU, $WS_MAXIMIZEBOX))

	; Erstellt ein Rebar-Control
	$hReBar = _GUICtrlRebar_Create($hgui, BitOR($CCS_TOP, $WS_BORDER, $RBS_VARHEIGHT, $RBS_AUTOSIZE, $RBS_BANDBORDERS))

	; Erstellt eine Combobox in der Rebar
	$hCombo = _GUICtrlComboBox_Create($hgui, "", 0, 0, 120)

	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, @WindowsDir & "\*.exe")
	_GUICtrlComboBox_EndUpdate($hCombo)

	; Erstellt ein DTP in der Rebar
	$hDTP = _GUICtrlDTP_Create($hgui, 0, 0, 190)

	; Erstellt eine Inputbox in der Rebar
	$hInput = GUICtrlCreateInput("Input-Control", 0, 0, 120, 20)

	; F&uuml;gt eine Gruppe mit Controls ein
	_GUICtrlRebar_AddBand($hReBar, $hCombo, 120, 200, "Dir *.exe")

	; Hinzuf&uuml;gen und in die zweite Zeile
	_GUICtrlRebar_AddBand($hReBar, $hDTP, 120)
	_GUICtrlRebar_SetBandStyleBreak($hReBar, 1)

	; Am Anfang der Rebar hinzuf&uuml;gen
	_GUICtrlRebar_AddBand($hReBar, GUICtrlGetHandle($hInput), 120, 200, "Name:", 0)

	$btnExit = GUICtrlCreateButton("Exit", 150, 360, 100, 25)
	GUISetState(@SW_SHOW)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $btnExit
				Exit
		EndSwitch
	WEnd
EndFunc   ;==>_Main

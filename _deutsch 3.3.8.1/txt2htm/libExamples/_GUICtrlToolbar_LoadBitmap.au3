#include <GuiToolbar.au3>
#include <GuiConstantsEx.au3>

$Debug_TB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Toolbar-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hGUI, $hToolbar, $pfad_autoit
	Local Enum $idRed = 1000, $idGreen, $idBlue

	; Installationsordner von AutoIt ermitteln
	$pfad_autoit = RegRead('HKEY_LOCAL_MACHINE\SOFTWARE\AutoIt v3\AutoIt', 'InstallDir')

	; Erstellt eine GUI
	$hGUI = GUICreate("Toolbar", 400, 300)
	$hToolbar = _GUICtrlToolbar_Create($hGUI)
	GUISetState()

	; F&uuml;gt Bitmaps hinzu
	_GUICtrlToolbar_LoadBitmap($hToolbar, $pfad_autoit & "\Examples\GUI\advanced\images\Red.bmp")
	_GUICtrlToolbar_LoadBitmap($hToolbar, $pfad_autoit & "\Examples\GUI\advanced\Images\Green.bmp")
	_GUICtrlToolbar_LoadBitmap($hToolbar, $pfad_autoit & "\Examples\GUI\advanced\Images\Blue.bmp")

	; F&uuml;gt die Buttons hinzu
	_GUICtrlToolbar_AddButton($hToolbar, $idRed, 0)
	_GUICtrlToolbar_AddButton($hToolbar, $idGreen, 1)
	_GUICtrlToolbar_AddButton($hToolbar, $idBlue, 2)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

EndFunc   ;==>_Main

#Auto#AutoIt3Wrapper_au3check_parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#include <GUIListBox.au3>
#include <WinAPI.au3>
#include <GuiConstantsEx.au3>
#include <Constants.au3>

$Debug_LB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ListBox-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $iLocale, $hListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Set Locale", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296)
	GUISetState()

	$iLocale = _WinAPI_MAKELCID(_WinAPI_MAKELANGID($LANG_ENGLISH, $SUBLANG_ENGLISH_US), $SORT_DEFAULT)

	MsgBox(8256, "Information", "Bisherige Spracheinstellung: " & _GUICtrlListBox_SetLocale($hListBox, $iLocale))

	$iLocale = _WinAPI_MAKELCID(_WinAPI_MAKELANGID($LANG_GERMAN, $SUBLANG_GERMAN), $SORT_DEFAULT)

	MsgBox(8256, "Information", "Aktuelle Spracheinstellung: " & _GUICtrlListBox_SetLocale($hListBox, $iLocale))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

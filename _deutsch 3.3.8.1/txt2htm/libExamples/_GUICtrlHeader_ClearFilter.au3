#include <GuiConstantsEx.au3>
#include <GuiHeader.au3>

$Debug_HDR = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Header-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hGUI, $hHeader

	; Erstellt eine GUI
	$hGUI = GUICreate("Header", 400, 300)
	$hHeader = _GUICtrlHeader_Create($hGUI)
	GUISetState()

	; F&uuml;gt die Spalten hinzu
	_GUICtrlHeader_AddItem($hHeader, "Spalte 1", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 2", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 3", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 4", 100)

	; Startet das &Auml;ndern in dem festgelegten Filter
	_GUICtrlHeader_EditFilter($hHeader, 0)
	Send("Filter 1")
	Sleep(1000)
	Send("{ENTER}")
	_GUICtrlHeader_EditFilter($hHeader, 1)
	Send("Filter 2")
	Sleep(1000)
	Send("{ENTER}")

	; Bereinigt den Filter
	_GUICtrlHeader_ClearFilter($hHeader, 0)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>_Main
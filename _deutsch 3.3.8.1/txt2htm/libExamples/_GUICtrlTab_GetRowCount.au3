#include <GuiConstantsEx.au3>
#include <GuiTab.au3>

$Debug_TAB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Tab-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hTab

	; Erstellt eine GUI
	GUICreate("Tab-Control: Ermittelt die aktuelle Anzahl von Zeilen", 500, 300)
	$hTab = GUICtrlCreateTab(2, 2, 396, 296, $TCS_MULTILINE)
	GUISetState()

	; Tabs hinzuf&uuml;gen
	For $x = 0 To 10
		_GUICtrlTab_InsertItem($hTab, $x, "Tab " & $x + 1)
	Next

	; Ermittelt die aktuelle Anzahl von Zeilen
	MsgBox(4160, "Information", "Anzahl von Zeilen: " & _GUICtrlTab_GetRowCount($hTab))

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

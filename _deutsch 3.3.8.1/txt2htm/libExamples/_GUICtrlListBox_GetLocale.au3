#include <GUIListBox.au3>
#include <GuiConstantsEx.au3>

$Debug_LB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ListBox-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Ermittelt das Gebietsschema", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296)
	GUISetState()

	; Zeigt die Gebietsschema-Einstellung, den L&auml;ndercode und die Sprach-Identifizierer an
	MsgBox(4160, "Information", _
			"Gebietsschema ...: " & _GUICtrlListBox_GetLocale($hListBox) & @LF & _
			"L&auml;ndercode ......: " & _GUICtrlListBox_GetLocaleCountry($hListBox) & @LF & _
			"Sprach-ID........: " & _GUICtrlListBox_GetLocaleLang($hListBox) & @LF & _
			"Prim&auml;re Sprach-ID: " & _GUICtrlListBox_GetLocalePrimLang($hListBox) & @LF & _
			"Sub-Sprach-ID ...: " & _GUICtrlListBox_GetLocaleSubLang($hListBox))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

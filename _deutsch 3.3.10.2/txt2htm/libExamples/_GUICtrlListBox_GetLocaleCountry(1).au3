#include <GuiListBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Ermittelt den L&auml;ndercode", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; Zeigt die Gebietsschema-Einstellung, den L&auml;ndercode und die Sprach-Identifizierer an
	MsgBox($MB_SYSTEMMODAL, "Information", _
			"Gebietsschema ...: " & _GUICtrlListBox_GetLocale($hListBox) & @CRLF & _
			"L&auml;ndercode ......: " & _GUICtrlListBox_GetLocaleCountry($hListBox) & @CRLF & _
			"Sprach-ID........: " & _GUICtrlListBox_GetLocaleLang($hListBox) & @CRLF & _
			"Prim&auml;re Sprach-ID: " & _GUICtrlListBox_GetLocalePrimLang($hListBox) & @CRLF & _
			"Sub-Sprach-ID ...: " & _GUICtrlListBox_GetLocaleSubLang($hListBox))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

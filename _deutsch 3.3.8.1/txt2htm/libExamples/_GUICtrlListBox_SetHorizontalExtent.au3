#include <GUIListBox.au3>
#include <GuiConstantsEx.au3>
#include <WindowsConstants.au3>

$Debug_LB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ListBox-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Setzt die horizontale Ausdehnung", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296, BitOR($WS_BORDER, $WS_VSCROLL, $LBS_NOTIFY, $LBS_DISABLENOSCROLL, $WS_HSCROLL))
	GUISetState()

	; F&uuml;gt einen langen String hinzu
	_GUICtrlListBox_AddString($hListBox, "AutoIt v3 Ist eine Freeware BASIC-&auml;hnliche Skript Sprache, die entwickelt wurde um die Windows-GUI zu automatisieren.")

	; Zeigt die aktuelle horizontale Ausdehnung
	MsgBox(4160, "Information", "Horizontale Ausdehnung: " & _GUICtrlListBox_GetHorizontalExtent($hListBox))

	_GUICtrlListBox_SetHorizontalExtent($hListBox, 500)

	; Zeigt die aktuelle horizontale Ausdehnung
	MsgBox(4160, "Information", "Horizontale Ausdehnung: " & _GUICtrlListBox_GetHorizontalExtent($hListBox))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

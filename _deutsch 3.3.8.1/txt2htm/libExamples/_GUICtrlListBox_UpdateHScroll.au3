#include <GUIListBox.au3>
#include <GuiConstantsEx.au3>
#include <WindowsConstants.au3>

$Debug_LB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ListBox-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Aktualisiert die horizontale Scrollbar", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296, BitOR($LBS_NOTIFY, $LBS_SORT, $WS_HSCROLL, $WS_VSCROLL))
	GUISetState()

	; F&uuml;gt einen langen String hinzu
	_GUICtrlListBox_AddString($hListBox, "AutoIt v3 ist eine BASIC-artige Freeware-Skriptsprache. Sie wurde entwickelt, um die Windows-GUI zu automatisieren.")

	; Ermittelt von einer Listbox die scrollbare Breite
	MsgBox(4160, "Information", "scrollbare Breite: " & _GUICtrlListBox_GetHorizontalExtent($hListBox))

	; Aktualisiert die horizontale Scrollbar basierend auf dem l&auml;ngsten String
	_GUICtrlListBox_UpdateHScroll($hListBox)

	; Ermittelt von einer Listbox die scrollbare Breite
	MsgBox(4160, "Information", "scrollbare Breite: " & _GUICtrlListBox_GetHorizontalExtent($hListBox))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

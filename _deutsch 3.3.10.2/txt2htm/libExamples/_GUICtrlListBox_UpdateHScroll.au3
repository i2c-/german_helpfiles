#include <GuiListBox.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Aktualisiert die horizontale Scrollbar", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296, BitOR($LBS_NOTIFY, $LBS_SORT, $WS_HSCROLL, $WS_VSCROLL))
	GUISetState(@SW_SHOW)

	; F&uuml;gt einen langen String hinzu
	_GUICtrlListBox_AddString($hListBox, "AutoIt v3 ist eine BASIC-artige Freeware-Skriptsprache. Sie wurde entwickelt, um die Windows-GUI zu automatisieren.")

	; Ermittelt von einer Listbox die scrollbare Breite
	MsgBox($MB_SYSTEMMODAL, "Information", "scrollbare Breite: " & _GUICtrlListBox_GetHorizontalExtent($hListBox))

	; Aktualisiert die horizontale Scrollbar basierend auf dem l&auml;ngsten String
	_GUICtrlListBox_UpdateHScroll($hListBox)

	; Ermittelt von einer Listbox die scrollbare Breite
	MsgBox($MB_SYSTEMMODAL, "Information", "scrollbare Breite: " & _GUICtrlListBox_GetHorizontalExtent($hListBox))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

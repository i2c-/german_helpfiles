#include <GuiListBox.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Ermittelt die horizontale Ausdehnung", 400, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296, BitOR($WS_BORDER, $WS_VSCROLL, $LBS_NOTIFY, $LBS_DISABLENOSCROLL, $WS_HSCROLL))
	GUISetState(@SW_SHOW)

	; Einen langen String hinzuf&uuml;gen
	_GUICtrlListBox_AddString($hListBox, "AutoIt v3 Ist ein Freeware, BASIC-&auml;hnliche Script-Sprache um die Windows-GUI zu automatisieren.")

	; Zeigt die horizontale Ausdehnung
	MsgBox($MB_SYSTEMMODAL, "Information", "Horizontale Ausdehnung: " & _GUICtrlListBox_GetHorizontalExtent($hListBox))

	_GUICtrlListBox_SetHorizontalExtent($hListBox, 500)

	; Zeigt die aktuelle horizontale Ausdehnung
	MsgBox($MB_SYSTEMMODAL, "Information", "Horizontale Ausdehnung: " & _GUICtrlListBox_GetHorizontalExtent($hListBox))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

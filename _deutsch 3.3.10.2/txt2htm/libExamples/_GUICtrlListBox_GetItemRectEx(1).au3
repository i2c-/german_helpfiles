#include <GuiListBox.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $tRect, $hListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Ermittelt das Rechteck, welches ein Item begrenzt", 500, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 396, 296)
	GUISetState(@SW_SHOW)

	; F&uuml;gt Strings hinzu
	_GUICtrlListBox_BeginUpdate($hListBox)
	For $iI = 1 To 9
		_GUICtrlListBox_AddString($hListBox, StringFormat("%03d : Zufallstring", Random(1, 100, 1)))
	Next
	_GUICtrlListBox_EndUpdate($hListBox)

	; Zeigt das Rechteck, welches ein Item begrenzt
	$tRect = _GUICtrlListBox_GetItemRectEx($hListBox, 4)
	MsgBox($MB_SYSTEMMODAL, "Information", "Rechteck von Item 5: " & _
			DllStructGetData($tRect, "Left") & ", " & _
			DllStructGetData($tRect, "Top") & ", " & _
			DllStructGetData($tRect, "Right") & ", " & _
			DllStructGetData($tRect, "Bottom"))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

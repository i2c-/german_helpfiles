#include <GUIListBox.au3>
#include <GuiConstantsEx.au3>

$Debug_LB = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ListBox-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $hListBox

	; Erstellt eine GUI
	GUICreate("ListBox: Ermittelt den Index des Items am angegebenen Punkt", 520, 296)
	$hListBox = GUICtrlCreateList("", 2, 2, 516, 296)
	GUISetState()

	; F&uuml;gt Strings hinzu
	_GUICtrlListBox_BeginUpdate($hListBox)
	For $iI = 1 To 9
		_GUICtrlListBox_AddString($hListBox, StringFormat("%d : Zufallstring " & $iI, Random(1, 99, 1)))
	Next
	_GUICtrlListBox_EndUpdate($hListBox)

	; Ermittelt den 0-basierenden Index des Items, das den angegebenen Koordinaten am n&auml;chsten liegt
	MsgBox(8256, "Information", "Index des Items, das den Koordinaten 30,30 am n&auml;chsten ist: " & @CRLF & @CRLF & @TAB & _
			"Itemindex: " & _GUICtrlListBox_ItemFromPoint($hListBox, 30, 30) & _
			" " & @TAB & "Itemtext: '" & _GUICtrlListBox_GetText($hListBox, _GUICtrlListBox_ItemFromPoint($hListBox, 30, 30)) & "'")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

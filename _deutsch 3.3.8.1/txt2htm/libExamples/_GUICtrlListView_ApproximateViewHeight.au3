#include <GuiConstantsEx.au3>
#include <GuiListView.au3>
#include <Constants.au3>

$Debug_LV = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ListView-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

_Main()

Func _Main()
	Local $iY, $hListView

	GUICreate("ListView: Berechnet die ungef&auml;hre H&ouml;he", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState()

	; Spalte hinzuf&uuml;gen
	_GUICtrlListView_InsertColumn($hListView, 0, "Spalte 1", 80)

	; F&uuml;gt die Items hinzu
	For $iI = 0 To 9
		_GUICtrlListView_AddItem($hListView, "Zeile " & $iI)
	Next

	MsgBox(4096, "Information", "Berechne nun die ungef&auml;hre H&ouml;he f&uuml;r die Anzeige der Eintr&auml;ge.")
	; Neuaufbau des Listviews
	$iY = _GUICtrlListView_ApproximateViewHeight($hListView)
	_WinAPI_SetWindowPos(GUICtrlGetHandle($hListView), 0, 2, 2, 394, $iY, $SWP_NOZORDER)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

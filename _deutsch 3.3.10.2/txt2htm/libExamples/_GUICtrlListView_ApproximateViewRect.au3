#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <Constants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $aXY, $hListView

	GUICreate("ListView: Berechnet die ungef&auml;hre Gr&ouml;&szlig;e", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; Spalte hinzuf&uuml;gen
	_GUICtrlListView_InsertColumn($hListView, 0, "Spalte 1", 60)

	; F&uuml;gt die Items hinzu
	For $iI = 0 To 9
		_GUICtrlListView_AddItem($hListView, "Zeile " & $iI)
	Next

	MsgBox($MB_SYSTEMMODAL, "Information", "Berechne nun die ungef&auml;hre Gr&ouml;&szlig;e, welche f&uuml;r die Darstellung einer gegebenen Anzahl von Items notwendig ist")
	; Neuaufbau des Listviews
	$aXY = _GUICtrlListView_ApproximateViewRect($hListView)
	_WinAPI_SetWindowPos(GUICtrlGetHandle($hListView), 0, 2, 2, $aXY[0] + 5, $aXY[1], $SWP_NOZORDER); Die +5 ist eine Sicherheitszugabe
	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

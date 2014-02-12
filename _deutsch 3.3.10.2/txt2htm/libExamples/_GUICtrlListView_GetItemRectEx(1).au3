#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $tRect, $hListView

	GUICreate("ListView: Ermittelt das begrenzende Rechteck", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; F&uuml;gt die Spalten hinzu
	_GUICtrlListView_AddColumn($hListView, "Items", 100)

	; F&uuml;gt die Items hinzu
	_GUICtrlListView_AddItem($hListView, "Item 1")
	_GUICtrlListView_AddItem($hListView, "Item 2")
	_GUICtrlListView_AddItem($hListView, "Item 3")

	; Ermittelt das begrenzende Rechteck f&uuml;r Item 2
	$tRect = _GUICtrlListView_GetItemRectEx($hListView, 1)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Rechteck f&uuml;r Item 2 : [%d, %d, %d, %d]", DllStructGetData($tRect, "Left"), _
			DllStructGetData($tRect, "Top"), DllStructGetData($tRect, "Right"), DllStructGetData($tRect, "Bottom")))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

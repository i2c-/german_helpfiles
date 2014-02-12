#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $tInfo, $iI, $hListView

	GUICreate("ListView: Sucht ein Item", 400, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	GUISetState(@SW_SHOW)

	; F&uuml;gt die Spalten hinzu
	_GUICtrlListView_AddColumn($hListView, "Items", 100)

	; F&uuml;gt die Items hinzu
	_GUICtrlListView_BeginUpdate($hListView)
	For $iI = 1 To 100
		_GUICtrlListView_AddItem($hListView, "Item " & $iI)
	Next
	_GUICtrlListView_EndUpdate($hListView)

	; Setzt f&uuml;r Item 50 einen Parameterwert
	_GUICtrlListView_SetItemParam($hListView, 49, 1234)

	; Suche nach Zielitem
	$tInfo = DllStructCreate($tagLVFINDINFO)
	DllStructSetData($tInfo, "Flags", $LVFI_PARAM)
	DllStructSetData($tInfo, "Parameter", 1234)
	$iI = _GUICtrlListView_FindItem($hListView, -1, $tInfo)
	MsgBox($MB_SYSTEMMODAL, "Information", "Zielitemindex: " & $iI)
	_GUICtrlListView_EnsureVisible($hListView, $iI)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

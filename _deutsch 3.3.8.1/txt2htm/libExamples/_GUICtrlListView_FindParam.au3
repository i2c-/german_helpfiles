#include <GuiConstantsEx.au3>
#include <GuiListView.au3>

$Debug_LV = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die ListView-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

; Warnung: SetItemParam ist nicht bei einem mit GuiCtrlCreateListViewItem erzeugtem Item zu verwenden!
; Der Parameter ist die Control-ID des Items

_Main()

Func _Main()
	Global $GUI, $iI, $hListView

	; Erstellt eine GUI
	$GUI = GUICreate("(UDF) ListView: Sucht ein Item mit einem bestimmten Parameter", 550, 300)
	$hListView = _GUICtrlListView_Create($GUI, "", 2, 2, 544, 268)
	GUISetState()

	; F&uuml;gt die Spalten hinzu
	_GUICtrlListView_AddColumn($hListView, "Items", 100)

	; F&uuml;gt die Items hinzu
	_GUICtrlListView_BeginUpdate($hListView)
	For $iI = 1 To 100
		_GUICtrlListView_AddItem($hListView, "Item " & $iI)
	Next
	_GUICtrlListView_EndUpdate($hListView)

	; Setzt den Parameterwert 1234 f&uuml;r das 50. Item
	_GUICtrlListView_SetItemParam($hListView, 49, 1234)

	; Sucht das Item mit dem Parameter 1234
	$iI = _GUICtrlListView_FindParam($hListView, 1234)
	MsgBox(4160, "Information", "Index des Zielitems: " & $iI)
	_GUICtrlListView_EnsureVisible($hListView, $iI)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

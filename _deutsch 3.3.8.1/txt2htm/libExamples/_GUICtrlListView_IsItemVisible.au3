#include <GUIConstantsEx.au3>
#include <GuiListView.au3>


Example()

Func Example()
	Local $listview, $msg, $iIndex

	GUICreate("ListView: Pr&uuml;fen, ob das Item sichtbar ist", 235, 250, 100, 200)
	GUISetBkColor(0x00E0FFFF) ; &Auml;ndert die Hintergrundfarbe

	$listview = GUICtrlCreateListView("Spalte 1  |Spalte 2|Spalte 3  ", 10, 10, 215, 150);,$LVS_SORTDESCENDING)
	For $x = 1 To 30
		GUICtrlCreateListViewItem("Eintrag " & $x & "|Spalte " & $x & "2|Spalte " & $x & "3", $listview)
	Next
	GUISetState()

	$iIndex = Random(0, 29, 1)
	MsgBox(8192 + 64, "Information", "Eintrag " & $iIndex & " ist sichtbar: " & _GUICtrlListView_IsItemVisible($listview, $iIndex))

	Do
		$msg = GUIGetMsg()
	Until $msg = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

#include <GUIConstantsEx.au3>
#include <ListViewConstants.au3>

;Sortiert Unterschiede in 3 Spalten

Global $nCurCol = -1
Global $nSortDir = 1
Global $bSet = 0
Global $nCol = -1

Example()

Func Example()
	Local $lv, $msg

	GUICreate("Test", 300, 200)

	$lv = GUICtrlCreateListView("Spalte1|Spalte2|Spalte3", 10, 10, 280, 180)
	GUICtrlRegisterListViewSort(-1, "LVSort") ; Registriere die Funktion "SortLV" f&uuml;r das Sortier-Callback

	GUICtrlCreateListViewItem("ABC|666|10.05.2004", $lv)
	GUICtrlSetImage(-1, "shell32.dll", 7)
	GUICtrlCreateListViewItem("DEF|444|11.05.2005", $lv)
	GUICtrlSetImage(-1, "shell32.dll", 12)
	GUICtrlCreateListViewItem("CDE|444|12.05.2004", $lv)
	GUICtrlSetImage(-1, "shell32.dll", 3)

	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;s
	While 1
		$msg = GUIGetMsg()
		Switch $msg
			Case $GUI_EVENT_CLOSE
				ExitLoop

			Case $lv
				$bSet = 0
				$nCurCol = $nCol
				GUICtrlSendMsg($lv, $LVM_SETSELECTEDCOLUMN, GUICtrlGetState($lv), 0)
				DllCall("user32.dll", "int", "InvalidateRect", "hwnd", GUICtrlGetHandle($lv), "int", 0, "int", 1)
		EndSwitch
	WEnd
EndFunc   ;==>Example


; Unsere Sortier-Callback-Funktionen
Func LVSort($hWnd, $nItem1, $nItem2, $nColumn)
	Local $val1, $val2, $nResult

	; Schaltet die Sortierrichtung um
	If $nColumn = $nCurCol Then
		If Not $bSet Then
			$nSortDir = $nSortDir * - 1
			$bSet = 1
		EndIf
	Else
		$nSortDir = 1
	EndIf
	$nCol = $nColumn

	$val1 = GetSubItemText($hWnd, $nItem1, $nColumn)
	$val2 = GetSubItemText($hWnd, $nItem2, $nColumn)

	; Wenn es die dritte Spalte ist (startet bei 0), dann vergleiche die Daten
	If $nColumn = 2 Then
		$val1 = StringRight($val1, 4) & StringMid($val1, 4, 2) & StringLeft($val1, 2)
		$val2 = StringRight($val2, 4) & StringMid($val2, 4, 2) & StringLeft($val2, 2)
	EndIf

	$nResult = 0 ; Keine &Auml;nderung in item1 und item2 Positionen

	If $val1 < $val2 Then
		$nResult = -1 ; Setzt item2 vor item1
	ElseIf $val1 > $val2 Then
		$nResult = 1 ; Setzt item2 hinter item1
	EndIf

	$nResult = $nResult * $nSortDir

	Return $nResult
EndFunc   ;==>LVSort


; Text eines Treeview-Items in einer bestimmten Spalte abrufen
Func GetSubItemText($nCtrlID, $nItemID, $nColumn)
	Local $stLvfi = DllStructCreate("uint;ptr;int;int[2];int")
	Local $nIndex, $stBuffer, $stLvi, $sItemText

	DllStructSetData($stLvfi, 1, $LVFI_PARAM)
	DllStructSetData($stLvfi, 3, $nItemID)

	$stBuffer = DllStructCreate("char[260]")

	$nIndex = GUICtrlSendMsg($nCtrlID, $LVM_FINDITEM, -1, DllStructGetPtr($stLvfi))

	$stLvi = DllStructCreate("uint;int;int;uint;uint;ptr;int;int;int;int")

	DllStructSetData($stLvi, 1, $LVIF_TEXT)
	DllStructSetData($stLvi, 2, $nIndex)
	DllStructSetData($stLvi, 3, $nColumn)
	DllStructSetData($stLvi, 6, DllStructGetPtr($stBuffer))
	DllStructSetData($stLvi, 7, 260)

	GUICtrlSendMsg($nCtrlID, $LVM_GETITEMA, 0, DllStructGetPtr($stLvi));

	$sItemText = DllStructGetData($stBuffer, 1)

	$stLvi = 0
	$stLvfi = 0
	$stBuffer = 0

	Return $sItemText
EndFunc   ;==>GetSubItemText

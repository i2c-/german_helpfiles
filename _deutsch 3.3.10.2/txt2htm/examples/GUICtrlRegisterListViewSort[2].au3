#include <GUIConstantsEx.au3>
#include <ListViewConstants.au3>

Global $nCurCol = -1
Global $nSortDir = 1
Global $bSet = 0
Global $nCol = -1

;Sortierung mit selbsterzeugten Items per DllCall

Example()

Func Example()
	Local $hGUI, $lv, $msg

	$nCurCol = -1
	$nSortDir = 1
	$bSet = 0
	$nCol = -1

	$hGUI = GUICreate("Test", 300, 200)

	$lv = GUICtrlCreateListView("Spalte1|Spalte2|Spalte3", 10, 10, 280, 180)
	GUICtrlRegisterListViewSort(-1, "LVSort") ; Registriere die Funktion "SortLV" f&uuml;r das Sortier-Callback

	MyGUICtrlCreateListViewItem("ABC|666|10.05.2004", $lv, -1)
	MyGUICtrlCreateListViewItem("DEF|444|11.05.2005", $lv, -1)
	MyGUICtrlCreateListViewItem("CDE|444|12.05.2004", $lv, -1)

	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		$msg = GUIGetMsg()
		Switch $msg
			Case $GUI_EVENT_CLOSE
				ExitLoop

			Case $lv
				$bSet = 0
				$nCurCol = $nCol
				GUICtrlSendMsg($lv, $LVM_SETSELECTEDCOLUMN, GUICtrlGetState($lv), 0)
				DllCall("user32.dll", "int", "InvalidateRect", "hwnd", ControlGetHandle($hGUI, "", $lv), "int", 0, "int", 1)
		EndSwitch
	WEnd
EndFunc   ;==>Example

; Unsere Sortier-Callback-Funktionen
Func LVSort2($hWnd, $nItem1, $nItem2, $nColumn)
	Local $val1, $val2, $nResult

	; Wechselt die Sortierrichtung
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

	$nResult = 0 ; Keine &Auml;nderung der Position von item1 und item2

	If $val1 < $val2 Then
		$nResult = -1 ; Setzt item2 vor item1
	ElseIf $val1 > $val2 Then
		$nResult = 1 ; Setzt item2 hinter item1
	EndIf

	$nResult = $nResult * $nSortDir

	Return $nResult
EndFunc   ;==>LVSort2

; Erzeugt und f&uuml;gt Items direkt in Treeview ein
Func MyGUICtrlCreateListViewItem($sText, $nCtrlID, $nIndex)
	Local $stLvItem = DllStructCreate("uint;int;int;uint;uint;ptr;int;int;int;int;")
	Local $stText = DllStructCreate("char[260]")
	Local $arText = StringSplit($sText, "|")

	If $nIndex = -1 Then $nIndex = GUICtrlSendMsg($nCtrlID, $LVM_GETITEMCOUNT, 0, 0)

	DllStructSetData($stText, 1, $arText[1]) ; Speichere Text in die Struktur

	DllStructSetData($stLvItem, 1, BitOR($LVIF_TEXT, $LVIF_PARAM))
	DllStructSetData($stLvItem, 2, $nIndex)
	DllStructSetData($stLvItem, 6, DllStructGetPtr($stText))
	; Setzt den lParam der Struktur zu dem Zeilenindex - einmalig in die Treeview
	DllStructSetData($stLvItem, 9, $nIndex)

	$nIndex = GUICtrlSendMsg($nCtrlID, $LVM_INSERTITEMA, 0, DllStructGetPtr($stLvItem))

	If $nIndex > -1 Then
		; F&uuml;gt nun den Rest des Spaltentextes ein
		For $i = 2 To $arText[0]
			DllStructSetData($stText, 1, $arText[$i])
			DllStructSetData($stLvItem, 3, $i - 1) ; Speichere den Subitem-Index

			GUICtrlSendMsg($nCtrlID, $LVM_SETITEMTEXTA, $nIndex, DllStructGetPtr($stLvItem))
		Next
	EndIf

	$stText = 0
	$stLvItem = 0

	; Passe die Spaltenbreite dem Text an
	For $i = 0 To 2
		GUICtrlSendMsg($nCtrlID, $LVM_SETCOLUMNWIDTH, $i, -1)
		GUICtrlSendMsg($nCtrlID, $LVM_SETCOLUMNWIDTH, $i, -2)
	Next
EndFunc   ;==>MyGUICtrlCreateListViewItem

; Text eines Treeview-Items in einer bestimmten Spalte abrufen
Func GetSubItemText($nCtrlID, $nItemID, $nColumn)
	Local $stLvfi = DllStructCreate("uint;ptr;int;int[2];int")
	Local $stBuffer, $nIndex, $stLvi, $sItemText

	DllStructSetData($stLvfi, 1, $LVFI_PARAM) ; Finde das Item durch unseren gespeicherten Index
	DllStructSetData($stLvfi, 3, $nItemID)

	$stBuffer = DllStructCreate("char[260]")

	$nIndex = GUICtrlSendMsg($nCtrlID, $LVM_FINDITEM, -1, DllStructGetPtr($stLvfi));

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

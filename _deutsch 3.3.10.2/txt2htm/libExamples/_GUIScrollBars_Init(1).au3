#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <StructureConstants.au3>
#include <GuiScrollBars.au3>

; Hinweis: Die Buttons im Beispiel haben keinerlei Funktion, sie sollen nur verdeutlichen, dass beim Scrollen alle zur betreffenden GUI geh&ouml;renden Items verschoben werden!

Example()

Func Example()
	Local $nFileMenu, $nExititem, $GUIMsg, $hGUI, $h_cGUI, $h_cGUI2
	Local $listview, $button

	; Erstellen der GUI
	$hGUI = GUICreate("ScrollBar: Beispiel", 400, 400, -1, -1, BitOR($WS_MINIMIZEBOX, $WS_CAPTION, $WS_POPUP, $WS_SYSMENU, $WS_SIZEBOX))
	GUISetBkColor(0x88AABB)

	; Men&uuml; erstellen
	$nFileMenu = GUICtrlCreateMenu("Datei")
	$nExititem = GUICtrlCreateMenuitem("Beenden", $nFileMenu)

	; ListView und Button erstellen
	$listview = GUICtrlCreateListView("Spalte1  |Spalte2|Spalte3", 10, 10, 200, 150);,$LVS_SORTDESCENDING)
	For $x = 1 To 30
		GUICtrlCreateListViewItem("Item" & $x & "|Spalte2|Spalte3", $listview)
	Next
	GUICtrlSetResizing($listview, $GUI_DOCKALL)
	$button = GUICtrlCreateButton("Wert?", 75, 170, 70, 20)
	GUICtrlSetResizing($button, $GUI_DOCKALL)

	; Einen Nachfahren von $hGUI erstellen (ein so genanntes Tochter- oder Child-Fenster)
	$h_cGUI = GUICreate("1. Child-GUI", 200, 200, 10, 200, $WS_CHILD, $WS_EX_CLIENTEDGE, $hGUI)
	; Einen Button in der neuen GUI erstellen
	GUICtrlCreateButton("Ein Button in Child-GUI 1", 10, 10, 150, 20)
	GUISetBkColor(0X006400) ; Hintergrundfarbe Gr&uuml;n
	GUISetState(@SW_SHOW)
	GUICtrlSetResizing($h_cGUI, $GUI_DOCKALL)

	; Zur urpr&uuml;nglichen GUI wechseln
	GUISwitch($hGUI)

	; Einen weiteren Nachfahren von $hGUI erstellen (ein so genanntes Tochter- oder Child-Fenster)
	$h_cGUI2 = GUICreate("2. Child-GUI", 200, 200, 215, 10, $WS_CHILD, $WS_EX_CLIENTEDGE, $hGUI)
	; Einen Button in der neuen GUI erstellen
	GUICtrlCreateButton("Ein Button in Child-GUI 2", 10, 10, 150, 20)
	GUISetBkColor(0XA40000) ; Hintergrundfarbe Rot
	GUISetState(@SW_SHOW)
	GUICtrlSetResizing($h_cGUI2, $GUI_DOCKALL)

	; Zur urpr&uuml;nglichen GUI wechseln
	GUISwitch($hGUI)

	; Selbstbehandelte Nachrichten registrieren
	GUIRegisterMsg($WM_SIZE, "WM_SIZE") ; Fenstergr&ouml;&szlig;e &auml;ndern
	GUIRegisterMsg($WM_VSCROLL, "WM_VSCROLL") ; Vertikales Scrollen
	GUIRegisterMsg($WM_HSCROLL, "WM_HSCROLL") ; Horizontales Scrollen

	GUISetState(@SW_SHOW)

	_GUIScrollBars_Init($hGUI)
	_GUIScrollBars_Init($h_cGUI)

	; Endlosschleife, in der Aktionen, die zum Beenden des Skripts f&uuml;hren sollen, abgefangen und bearbeitet werden
	While 1
		$GUIMsg = GUIGetMsg()
		Switch $GUIMsg
			Case $GUI_EVENT_CLOSE, $nExititem
				ExitLoop
		EndSwitch
	WEnd

	Exit
EndFunc   ;==>Example

; Fenstergr&ouml;&szlig;e wurde ge&auml;ndert
Func WM_SIZE($hWnd, $Msg, $wParam, $lParam)
	#forceref $Msg, $wParam
	Local $index = -1, $yChar, $xChar, $xClientMax, $xClient, $yClient, $ivMax
	For $x = 0 To UBound($aSB_WindowInfo) - 1
		If $aSB_WindowInfo[$x][0] = $hWnd Then
			$index = $x
			$xClientMax = $aSB_WindowInfo[$index][1]
			$xChar = $aSB_WindowInfo[$index][2]
			$yChar = $aSB_WindowInfo[$index][3]
			$ivMax = $aSB_WindowInfo[$index][7]
			ExitLoop
		EndIf
	Next
	If $index = -1 Then Return 0

	Local $tSCROLLINFO = DllStructCreate($tagSCROLLINFO)

	; Ermittelt die Abmessungen der Arbeitsfl&auml;che.
	$xClient = BitAND($lParam, 0x0000FFFF)
	$yClient = BitShift($lParam, 16)
	$aSB_WindowInfo[$index][4] = $xClient
	$aSB_WindowInfo[$index][5] = $yClient

	; Setzt den vertikalen Scrollbereich und die Seitengr&ouml;&szlig;e
	DllStructSetData($tSCROLLINFO, "fMask", BitOR($SIF_RANGE, $SIF_PAGE))
	DllStructSetData($tSCROLLINFO, "nMin", 0)
	DllStructSetData($tSCROLLINFO, "nMax", $ivMax)
	DllStructSetData($tSCROLLINFO, "nPage", $yClient / $yChar)
	_GUIScrollBars_SetScrollInfo($hWnd, $SB_VERT, $tSCROLLINFO)

	; Setzt den horizontalen Scrollbereich und die Seitengr&ouml;&szlig;e
	DllStructSetData($tSCROLLINFO, "fMask", BitOR($SIF_RANGE, $SIF_PAGE))
	DllStructSetData($tSCROLLINFO, "nMin", 0)
	DllStructSetData($tSCROLLINFO, "nMax", 2 + $xClientMax / $xChar)
	DllStructSetData($tSCROLLINFO, "nPage", $xClient / $xChar)
	_GUIScrollBars_SetScrollInfo($hWnd, $SB_HORZ, $tSCROLLINFO)

	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_SIZE

; Horizontales Scrollen
Func WM_HSCROLL($hWnd, $Msg, $wParam, $lParam)
	#forceref $Msg, $lParam
	Local $nScrollCode = BitAND($wParam, 0x0000FFFF)

	Local $index = -1, $xChar, $xPos
	Local $Min, $Max, $Page, $Pos, $TrackPos

	For $x = 0 To UBound($aSB_WindowInfo) - 1
		If $aSB_WindowInfo[$x][0] = $hWnd Then
			$index = $x
			$xChar = $aSB_WindowInfo[$index][2]
			ExitLoop
		EndIf
	Next
	If $index = -1 Then Return 0

	; Ermittelt alle Informationen der horizontalen Scrollbar
	Local $tSCROLLINFO = _GUIScrollBars_GetScrollInfoEx($hWnd, $SB_HORZ)
	$Min = DllStructGetData($tSCROLLINFO, "nMin")
	$Max = DllStructGetData($tSCROLLINFO, "nMax")
	$Page = DllStructGetData($tSCROLLINFO, "nPage")
	$xPos = DllStructGetData($tSCROLLINFO, "nPos")
	$TrackPos = DllStructGetData($tSCROLLINFO, "nTrackPos")
	; Speichert die x-Position f&uuml;r einen sp&auml;teren Vergleich
	$Pos = $xPos
	#forceref $Min, $Max
	; Auswertung der vom System gemeldeten Scroll-Nachricht
	Switch $nScrollCode
		Case $SB_LINELEFT ; Der Anwender klickte auf den linken Pfeil
			DllStructSetData($tSCROLLINFO, "nPos", $Pos - 1)

		Case $SB_LINERIGHT ; Der Anwender klickte auf den rechten Pfeil
			DllStructSetData($tSCROLLINFO, "nPos", $Pos + 1)

		Case $SB_PAGELEFT ; Der Anwender klickte links neben dem Scrollbalken
			DllStructSetData($tSCROLLINFO, "nPos", $Pos - $Page)

		Case $SB_PAGERIGHT ; Der Anwender klickte rechts neben dem Scrollbalken
			DllStructSetData($tSCROLLINFO, "nPos", $Pos + $Page)

		Case $SB_THUMBTRACK ; Der Anwender zog den Scrollbalken
			DllStructSetData($tSCROLLINFO, "nPos", $TrackPos)
	EndSwitch

;~    // Setzt die neue Position und ermittelt sie danach erneut.
;~    // Abh&auml;ngig von den Windows-Einstellungen kann es sein, dass die gelesenen Werte nicht die gleichen sind, wie die vorher gesetzten.

	DllStructSetData($tSCROLLINFO, "fMask", $SIF_POS)
	_GUIScrollBars_SetScrollInfo($hWnd, $SB_HORZ, $tSCROLLINFO)
	_GUIScrollBars_GetScrollInfo($hWnd, $SB_HORZ, $tSCROLLINFO)
	; // Falls sich die x-Position der Scrollbar ge&auml;ndert hat, den Fensterbereich verschieben und aktualisieren
	$Pos = DllStructGetData($tSCROLLINFO, "nPos")
	If ($Pos <> $xPos) Then _GUIScrollBars_ScrollWindow($hWnd, $xChar * ($xPos - $Pos), 0)
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_HSCROLL

; Vertikales Scrollen
Func WM_VSCROLL($hWnd, $Msg, $wParam, $lParam)
	#forceref $Msg, $wParam, $lParam
	Local $nScrollCode = BitAND($wParam, 0x0000FFFF)
	Local $index = -1, $yChar, $yPos
	Local $Min, $Max, $Page, $Pos, $TrackPos

	For $x = 0 To UBound($aSB_WindowInfo) - 1
		If $aSB_WindowInfo[$x][0] = $hWnd Then
			$index = $x
			$yChar = $aSB_WindowInfo[$index][3]
			ExitLoop
		EndIf
	Next
	If $index = -1 Then Return 0

	; Ermittelt alle Informationen der vertikalen Scrollbar
	Local $tSCROLLINFO = _GUIScrollBars_GetScrollInfoEx($hWnd, $SB_VERT)
	$Min = DllStructGetData($tSCROLLINFO, "nMin")
	$Max = DllStructGetData($tSCROLLINFO, "nMax")
	$Page = DllStructGetData($tSCROLLINFO, "nPage")
	$yPos = DllStructGetData($tSCROLLINFO, "nPos")
	$TrackPos = DllStructGetData($tSCROLLINFO, "nTrackPos")
	; Speichert die y-Position f&uuml;r einen sp&auml;teren Vergleich
	$Pos = $yPos

	; Auswertung der vom System gemeldeten Scroll-Nachricht
	Switch $nScrollCode
		Case $SB_TOP ; Der Anwender klickte auf die "Pos1"-Taste
			DllStructSetData($tSCROLLINFO, "nPos", $Min)

		Case $SB_BOTTOM ; Der Anwender klickte auf die "Ende"-Taste
			DllStructSetData($tSCROLLINFO, "nPos", $Max)

		Case $SB_LINEUP ; Der Anwender klickte auf den oberen Pfeil
			DllStructSetData($tSCROLLINFO, "nPos", $Pos - 1)

		Case $SB_LINEDOWN ; Der Anwender klickte auf den unteren Pfeil
			DllStructSetData($tSCROLLINFO, "nPos", $Pos + 1)

		Case $SB_PAGEUP ; Der Anwender klickte oberhalb des Scrollbalkens
			DllStructSetData($tSCROLLINFO, "nPos", $Pos - $Page)

		Case $SB_PAGEDOWN ; Der Anwender klickte unterhalb des Scrollbalkens
			DllStructSetData($tSCROLLINFO, "nPos", $Pos + $Page)

		Case $SB_THUMBTRACK ; Der Anwender zog den Scrollbalken
			DllStructSetData($tSCROLLINFO, "nPos", $TrackPos)
	EndSwitch

;~    // Setzt die neue Position und ermittelt sie danach erneut.
;~    // Abh&auml;ngig von den Windows-Einstellungen kann es sein, dass die gelesenen Werte nicht die gleichen sind, wie die vorher gesetzten.

	DllStructSetData($tSCROLLINFO, "fMask", $SIF_POS)
	_GUIScrollBars_SetScrollInfo($hWnd, $SB_VERT, $tSCROLLINFO)
	_GUIScrollBars_GetScrollInfo($hWnd, $SB_VERT, $tSCROLLINFO)
	; // Falls sich die y-Position der Scrollbar ge&auml;ndert hat, den Fensterbereich verschieben und aktualisieren
	$Pos = DllStructGetData($tSCROLLINFO, "nPos")
	If ($Pos <> $yPos) Then
		_GUIScrollBars_ScrollWindow($hWnd, 0, $yChar * ($yPos - $Pos))
		$yPos = $Pos
	EndIf

	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_VSCROLL

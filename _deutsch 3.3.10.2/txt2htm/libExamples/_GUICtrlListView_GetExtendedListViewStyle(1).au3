#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <GuiImageList.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hImage, $hListView

	GUICreate("ListView: Ermittelt die erweiterten ListView Stile", 420, 300)
	$hListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	_GUICtrlListView_SetExtendedListViewStyle($hListView, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_SUBITEMIMAGES))
	GUISetState(@SW_SHOW)

	; L&auml;dt die Bilder
	$hImage = _GUIImageList_Create()
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap(GUICtrlGetHandle($hListView), 0xFF0000, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap(GUICtrlGetHandle($hListView), 0x00FF00, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap(GUICtrlGetHandle($hListView), 0x0000FF, 16, 16))
	_GUICtrlListView_SetImageList($hListView, $hImage, 1)

	; F&uuml;gt die Spalten hinzu
	_GUICtrlListView_AddColumn($hListView, "Spalte 1", 100)
	_GUICtrlListView_AddColumn($hListView, "Spalte 2", 100)
	_GUICtrlListView_AddColumn($hListView, "Spalte 3", 100)

	_GUICtrlListView_InsertItem($hListView, "Zeile 1: Spalte 1", -1, 0)
	_GUICtrlListView_AddSubItem($hListView, 0, "Zeile 1: Spalte 2", 1, 1)
	_GUICtrlListView_AddSubItem($hListView, 0, "Zeile 1: Spalte 3", 2, 2)
	_GUICtrlListView_InsertItem($hListView, "Zeile 2: Spalte 1", -1, 1)
	_GUICtrlListView_AddSubItem($hListView, 1, "Zeile 2: Spalte 2", 1, 2)
	_GUICtrlListView_InsertItem($hListView, "Zeile 3: Spalte 1", -1, 2)

	MsgBox($MB_SYSTEMMODAL, "Information", "Erweiterten ListView Stile: 0x" & _GUICtrlListView_GetExtendedListViewStyle($hListView) & @CRLF & _
			_DisplayExtendStringList($hListView))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

Func _DisplayExtendStringList($hListView)
	Local $Styles = @CRLF & @CRLF & @TAB
	If (BitAND(_GUICtrlListView_GetExtendedListViewStyle($hListView), $LVS_EX_BORDERSELECT) = $LVS_EX_BORDERSELECT) Then $Styles &= "$LVS_EX_BORDERSELECT" & @CRLF & @TAB
	If (BitAND(_GUICtrlListView_GetExtendedListViewStyle($hListView), $LVS_EX_CHECKBOXES) = $LVS_EX_CHECKBOXES) Then $Styles &= "$LVS_EX_CHECKBOXES" & @CRLF & @TAB
	If (BitAND(_GUICtrlListView_GetExtendedListViewStyle($hListView), $LVS_EX_DOUBLEBUFFER) = $LVS_EX_DOUBLEBUFFER) Then $Styles &= "$LVS_EX_DOUBLEBUFFER" & @CRLF & @TAB
	If (BitAND(_GUICtrlListView_GetExtendedListViewStyle($hListView), $LVS_EX_FLATSB) = $LVS_EX_FLATSB) Then $Styles &= "$LVS_EX_FLATSB" & @CRLF & @TAB
	If (BitAND(_GUICtrlListView_GetExtendedListViewStyle($hListView), $LVS_EX_FULLROWSELECT) = $LVS_EX_FULLROWSELECT) Then $Styles &= "$LVS_EX_FULLROWSELECT" & @CRLF & @TAB
	If (BitAND(_GUICtrlListView_GetExtendedListViewStyle($hListView), $LVS_EX_GRIDLINES) = $LVS_EX_GRIDLINES) Then $Styles &= "$LVS_EX_GRIDLINES" & @CRLF & @TAB
	If (BitAND(_GUICtrlListView_GetExtendedListViewStyle($hListView), $LVS_EX_HEADERDRAGDROP) = $LVS_EX_HEADERDRAGDROP) Then $Styles &= "$LVS_EX_HEADERDRAGDROP" & @CRLF & @TAB
	If (BitAND(_GUICtrlListView_GetExtendedListViewStyle($hListView), $LVS_EX_INFOTIP) = $LVS_EX_INFOTIP) Then $Styles &= "$LVS_EX_INFOTIP" & @CRLF & @TAB
	If (BitAND(_GUICtrlListView_GetExtendedListViewStyle($hListView), $LVS_EX_LABELTIP) = $LVS_EX_LABELTIP) Then $Styles &= "$LVS_EX_LABELTIP" & @CRLF & @TAB
	If (BitAND(_GUICtrlListView_GetExtendedListViewStyle($hListView), $LVS_EX_MULTIWORKAREAS) = $LVS_EX_MULTIWORKAREAS) Then $Styles &= "$LVS_EX_MULTIWORKAREAS" & @CRLF & @TAB
	If (BitAND(_GUICtrlListView_GetExtendedListViewStyle($hListView), $LVS_EX_ONECLICKACTIVATE) = $LVS_EX_ONECLICKACTIVATE) Then $Styles &= "$LVS_EX_ONECLICKACTIVATE" & @CRLF & @TAB
	If (BitAND(_GUICtrlListView_GetExtendedListViewStyle($hListView), $LVS_EX_REGIONAL) = $LVS_EX_REGIONAL) Then $Styles &= "$LVS_EX_REGIONAL" & @CRLF & @TAB
	If (BitAND(_GUICtrlListView_GetExtendedListViewStyle($hListView), $LVS_EX_SIMPLESELECT) = $LVS_EX_SIMPLESELECT) Then $Styles &= "$LVS_EX_SIMPLESELECT" & @CRLF & @TAB
	If (BitAND(_GUICtrlListView_GetExtendedListViewStyle($hListView), $LVS_EX_SUBITEMIMAGES) = $LVS_EX_SUBITEMIMAGES) Then $Styles &= "$LVS_EX_SUBITEMIMAGES" & @CRLF & @TAB
	If (BitAND(_GUICtrlListView_GetExtendedListViewStyle($hListView), $LVS_EX_TRACKSELECT) = $LVS_EX_TRACKSELECT) Then $Styles &= "$LVS_EX_TRACKSELECT" & @CRLF & @TAB
	If (BitAND(_GUICtrlListView_GetExtendedListViewStyle($hListView), $LVS_EX_TWOCLICKACTIVATE) = $LVS_EX_TWOCLICKACTIVATE) Then $Styles &= "$LVS_EX_TWOCLICKACTIVATE" & @CRLF & @TAB
	If (BitAND(_GUICtrlListView_GetExtendedListViewStyle($hListView), $LVS_EX_UNDERLINECOLD) = $LVS_EX_UNDERLINECOLD) Then $Styles &= "$LVS_EX_UNDERLINECOLD" & @CRLF & @TAB
	If (BitAND(_GUICtrlListView_GetExtendedListViewStyle($hListView), $LVS_EX_UNDERLINEHOT) = $LVS_EX_UNDERLINEHOT) Then $Styles &= "$LVS_EX_UNDERLINEHOT" & @CRLF & @TAB
	Return $Styles
EndFunc   ;==>_DisplayExtendStringList

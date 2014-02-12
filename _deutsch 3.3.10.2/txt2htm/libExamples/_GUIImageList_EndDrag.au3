#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <GuiImageList.au3>
#include <WindowsConstants.au3>

#region Globals *************************************************************************
Global $hDragImageList, $hListView, $bDragging = False, $LV_Height
Global $a_index[2] ; Von und zu

Global Const $DebugIt = 1

#endregion Globals *************************************************************************

Opt("WinTitleMatchMode", 2)

Example()

Func Example()
	Local Const $image_width = 20
	Local Const $image_height = 20
	Local $himages, $main_GUI, $iIndex

	$main_GUI = GUICreate("ImageList: Beendet das Ziehen eines Bildes", 425, 400)

	$hListView = _GUICtrlListView_Create($main_GUI, "Name|Kategorie", 5, 75, 220, 280, -1, BitOR($WS_EX_CLIENTEDGE, $WS_EX_STATICEDGE))
	$LV_Height = 280 - 75
	_GUICtrlListView_SetColumnWidth($hListView, 0, 100)
	_GUICtrlListView_SetColumnWidth($hListView, 1, 100)
	_GUICtrlListView_SetExtendedListViewStyle($hListView, BitOR($LVS_EX_GRIDLINES, $LVS_EX_FULLROWSELECT, $LVS_EX_CHECKBOXES))
	;------------------------------------------------------
	; Es werden Subitem-Bilder verwendet
	;------------------------------------------------------
	_GUICtrlListView_SetExtendedListViewStyle($hListView, BitOR($LVM_SETEXTENDEDLISTVIEWSTYLE, $LVS_EX_SUBITEMIMAGES))

	;------------------------------------------------------
	; Erstellt eine Imagelist
	;------------------------------------------------------
	$himages = _GUIImageList_Create($image_width, $image_height, 5, 1)
	For $x = 1 To 21
		_GUIImageList_AddIcon($himages, @SystemDir & "\shell32.dll", $x)
	Next

	_GUICtrlListView_SetImageList($hListView, $himages, $LVSIL_SMALL)

	;------------------------------------------------------
	; Event-Funktionen registrieren
	;------------------------------------------------------
	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")
	GUIRegisterMsg($WM_LBUTTONUP, "WM_LBUTTONUP")
	GUIRegisterMsg($WM_MOUSEMOVE, "WM_MOUSEMOVE")

	;------------------------------------------------------
	; F&uuml;gt Listviewitems mit Bilder hinzu
	;------------------------------------------------------
	Local $y = 1
	For $x = 0 To 9
		$iIndex = _GUICtrlListView_AddItem($hListView, "Name " & $x + 1, $y) ; Handle, String, Bilderindex
		_GUICtrlListView_AddSubItem($hListView, $iIndex, "Kategorie " & $x + 1, 1, $y + 1) ; Handle, index, String, Subitem, Bilderindex
		$y += 2
	Next

	GUISetState(@SW_SHOW)

	While 1

		Switch GUIGetMsg()

			;-----------------------------------------------------------------------------------------
			; Diese Case-Anweisung existiert und aktualisiert den Code falls ben&ouml;tigt
			Case $GUI_EVENT_CLOSE
				ExitLoop
				;-----------------------------------------------------------------------------------------
				; Hier ist der diverse Inhalt hinzuschreiben
			Case Else
				;;;
		EndSwitch
	WEnd
	;------------------------------------------------------
	;------------------------------------------------------
	;------------------------------------------------------
	_GUIImageList_Destroy($himages)
	;------------------------------------------------------
	;------------------------------------------------------
	;------------------------------------------------------
	GUIDelete()
EndFunc   ;==>Example

#region Item Function(s) **********************************************************************************************
;------------------------------------------------------
;------------------------------------------------------
;------------------------------------------------------
Func _LVInsertItem($i_FromItem, $i_ToItem)
	Local $item_state, $i_newIndex
	Local $struct_LVITEM = DllStructCreate($tagLVITEM)
	Local $struct_String = DllStructCreate("char Buffer[4096]")
	Local $sBuffer_pointer = DllStructGetPtr($struct_String)

	; F&uuml;gt das Item an der neuen Stelle ein
	DllStructSetData($struct_LVITEM, "Mask", BitOR($LVIF_STATE, $LVIF_IMAGE, $LVIF_INDENT, $LVIF_PARAM, $LVIF_TEXT))
	DllStructSetData($struct_LVITEM, "StateMask", $LVIS_STATEIMAGEMASK)
	DllStructSetData($struct_LVITEM, "Item", $i_FromItem)
	DllStructSetData($struct_LVITEM, "SubItem", 0)
	DllStructSetData($struct_LVITEM, "TextMax", 4096)
	DllStructSetData($struct_LVITEM, "Text", $sBuffer_pointer)
	_GUICtrlListView_GetItemEx($hListView, $struct_LVITEM)
	If @error Then Return SetError(-1, -1, -1)
	$item_state = DllStructGetData($struct_LVITEM, "State")
	DllStructSetData($struct_LVITEM, "Item", $i_ToItem)
	$i_newIndex = _GUICtrlListView_InsertItem($hListView, DllStructGetData($struct_String, "Buffer"), $i_ToItem, DllStructGetData($struct_LVITEM, "Image"))
	If @error Then Return SetError(-1, -1, -1)

	; Stellt den vorherigen Status wieder her
	If $DebugIt Then _DebugPrint("$i_newIndex = " & $i_newIndex)
	DllStructSetData($struct_LVITEM, "Mask", $LVIF_STATE)
	DllStructSetData($struct_LVITEM, "Item", $i_newIndex)
	DllStructSetData($struct_LVITEM, "State", $item_state)
	DllStructSetData($struct_LVITEM, "StateMask", $LVIS_STATEIMAGEMASK)
	_GUICtrlListView_SetItemState($hListView, $i_newIndex, $item_state, $LVIS_STATEIMAGEMASK)
	If @error Then Return SetError(-1, -1, -1)
	Return $i_newIndex
EndFunc   ;==>_LVInsertItem
;------------------------------------------------------
;------------------------------------------------------
;------------------------------------------------------
Func _LVCopyItem($i_FromItem, $i_ToItem, $i_SubItem = 0)
	Local $struct_LVITEM = DllStructCreate($tagLVITEM)
	Local $struct_String = DllStructCreate("char Buffer[4096]")
	Local $sBuffer_pointer = DllStructGetPtr($struct_String)

	; Iteminfos erhalten
	DllStructSetData($struct_LVITEM, "Mask", BitOR($LVIF_STATE, $LVIF_IMAGE, $LVIF_INDENT, $LVIF_PARAM, $LVIF_TEXT))
	DllStructSetData($struct_LVITEM, "StateMask", $LVIS_STATEIMAGEMASK)
	DllStructSetData($struct_LVITEM, "Item", $i_FromItem)
	DllStructSetData($struct_LVITEM, "SubItem", $i_SubItem)
	DllStructSetData($struct_LVITEM, "TextMax", 4096)
	DllStructSetData($struct_LVITEM, "Text", $sBuffer_pointer)
	_GUICtrlListView_GetItemEx($hListView, $struct_LVITEM)

	; Setzen zu
	DllStructSetData($struct_LVITEM, "Item", $i_ToItem)
	; Text setzen
	DllStructSetData($struct_LVITEM, "Mask", $LVIF_TEXT)
	DllStructSetData($struct_LVITEM, "Text", $sBuffer_pointer)
	DllStructSetData($struct_LVITEM, "TextMax", 4096)
	_GUICtrlListView_SetItemEx($hListView, $struct_LVITEM)
	If @error Then Return SetError(@error, @error, @error)
	; Status setzen
	DllStructSetData($struct_LVITEM, "Mask", $LVIF_STATE)
	_GUICtrlListView_SetItemEx($hListView, $struct_LVITEM)
	; Bild setzen
	DllStructSetData($struct_LVITEM, "Mask", $LVIF_IMAGE)
	DllStructSetData($struct_LVITEM, "State", $LVIF_IMAGE)
	_GUICtrlListView_SetItemEx($hListView, $struct_LVITEM)
	; Status setzen
	DllStructSetData($struct_LVITEM, "Mask", $LVIF_STATE)
	DllStructSetData($struct_LVITEM, "State", $LVIF_STATE)
	_GUICtrlListView_SetItemEx($hListView, $struct_LVITEM)
	; Einr&uuml;ckung setzen
	DllStructSetData($struct_LVITEM, "Mask", $LVIF_INDENT)
	DllStructSetData($struct_LVITEM, "State", $LVIF_INDENT)
	_GUICtrlListView_SetItemEx($hListView, $struct_LVITEM)
	; Parameter setzen
	DllStructSetData($struct_LVITEM, "Mask", $LVIF_PARAM)
	DllStructSetData($struct_LVITEM, "State", $LVIF_PARAM)
	_GUICtrlListView_SetItemEx($hListView, $struct_LVITEM)
EndFunc   ;==>_LVCopyItem
#endregion Item Function(s) **********************************************************************************************

#region Event Function(s) **********************************************************************************************
;------------------------------------------------------
;------------------------------------------------------
;------------------------------------------------------
; WM_MOUSEMOVE-Eventhandler
;------------------------------------------------------
;------------------------------------------------------
;------------------------------------------------------
Func WM_MOUSEMOVE($hWndGUI, $MsgID, $wParam, $lParam)
	#forceref $MsgID, $wParam
	;------------------------------------------------------
	; Nicht gezogene Items werden hier eingetragen
	;------------------------------------------------------
	If $bDragging = False Then Return $GUI_RUNDEFMSG

	;------------------------------------------------------
	; Aktualisiert die Bilder w&auml;hrend dem Bewegen
	;------------------------------------------------------
	Local $lpos = ControlGetPos($hWndGUI, "", $hListView)
	Local $x = BitAND($lParam, 0xFFFF) - $lpos[0]
	Local $y = BitShift($lParam, 16) - $lpos[1]
	If $y > $LV_Height - 20 Then
		_GUICtrlListView_Scroll($hListView, 0, $y)
	ElseIf $y < 20 Then
		_GUICtrlListView_Scroll($hListView, 0, $y * - 1)
	EndIf
	_GUIImageList_DragMove($x, $y)
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_MOUSEMOVE
;------------------------------------------------------
;------------------------------------------------------
;------------------------------------------------------
; WM_LBUTTONUP-Eventhandler
;------------------------------------------------------
;------------------------------------------------------
;------------------------------------------------------
Func WM_LBUTTONUP($hWndGUI, $MsgID, $wParam, $lParam)
	#forceref $MsgID, $wParam
	$bDragging = False
	Local $lpos = ControlGetPos($hWndGUI, "", $hListView)
	Local $x = BitAND($lParam, 0xFFFF) - $lpos[0]
	Local $y = BitShift($lParam, 16) - $lpos[1]
	If $DebugIt Then _DebugPrint("$x = " & $x)
	If $DebugIt Then _DebugPrint("$y = " & $y)
	;------------------------------------------------------
	; Das Ziehen ist beendet
	;------------------------------------------------------
	_GUIImageList_DragLeave($hListView)
	;------------------------------------------------------
	;------------------------------------------------------
	;------------------------------------------------------
	_GUIImageList_EndDrag()
	;------------------------------------------------------
	;------------------------------------------------------
	;------------------------------------------------------
	_GUIImageList_Destroy($hDragImageList[0])
	_WinAPI_ReleaseCapture()
	;------------------------------------------------------
	; Vollziehe den Hit-Test, um zu sehen ob das Ziehen in dem ListView beendet ist
	;------------------------------------------------------
	Local $struct_LVHITTESTINFO = DllStructCreate($tagLVHITTESTINFO)

	DllStructSetData($struct_LVHITTESTINFO, "X", $x)
	DllStructSetData($struct_LVHITTESTINFO, "Y", $y)
	$a_index[1] = _SendMessage($hListView, $LVM_HITTEST, 0, DllStructGetPtr($struct_LVHITTESTINFO), 0, "wparam", "ptr")
	Local $flags = DllStructGetData($struct_LVHITTESTINFO, "Flags")
	If $DebugIt Then _DebugPrint("$flags: " & $flags)
	;------------------------------------------------------
;~ 	// Au&szlig;erhalb des ListViews??
	;------------------------------------------------------
	If $a_index[1] == -1 Then Return $GUI_RUNDEFMSG
	;------------------------------------------------------
;~ 	// Nicht in einem Item?
	;------------------------------------------------------
	If BitAND($flags, $LVHT_ONITEMLABEL) == 0 And BitAND($flags, $LVHT_ONITEMSTATEICON) == 0 And BitAND($flags, $LVHT_ONITEMICON) = 0 Then Return $GUI_RUNDEFMSG
	;------------------------------------------------------
	; Es wird sichergestellt, dass das Item mindestens 2 Items &uuml;ber oder unter dem Item eingef&uuml;gt wird, damit keine Kopie entsteht
	;------------------------------------------------------
	If $a_index[0] < $a_index[1] - 1 Or $a_index[0] > $a_index[1] + 1 Then
		If $DebugIt Then _DebugPrint("To = " & $a_index[1])
		Local $i_newIndex = _LVInsertItem($a_index[0], $a_index[1])
		If @error Then Return SetError(-1, -1, $GUI_RUNDEFMSG)
		Local $From_index = $a_index[0]
		If $a_index[0] > $a_index[1] Then $From_index = $a_index[0] + 1
		;------------------------------------------------------
		; Itembilder,Subitembilder, Text und Status kopieren
		;------------------------------------------------------
		For $x = 1 To _GUICtrlListView_GetColumnCount($hListView) - 1
			_LVCopyItem($From_index, $i_newIndex, $x)
			If @error Then Return SetError(-1, -1, $GUI_RUNDEFMSG)
		Next
		;------------------------------------------------------
		; L&ouml;schen von
		;------------------------------------------------------
		_GUICtrlListView_DeleteItem($hListView, $From_index)
	EndIf
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_LBUTTONUP
;------------------------------------------------------
;------------------------------------------------------
;------------------------------------------------------
; WM_NOTIFY-Eventhandler
;------------------------------------------------------
;------------------------------------------------------
;------------------------------------------------------
Func WM_NOTIFY($hWndGUI, $MsgID, $wParam, $lParam)
	#forceref $hWndGUI, $MsgID, $wParam
	Local $tNMHDR, $code, $x, $y, $tNMLISTVIEW, $hwndFrom, $tDraw, $dwDrawStage, $dwItemSpec
	$tNMHDR = DllStructCreate($tagNMHDR, $lParam) ; NMHDR (hwndFrom, idFrom, code)
	If @error Then Return
	$code = DllStructGetData($tNMHDR, "Code")
	$hwndFrom = DllStructGetData($tNMHDR, "hWndFrom")
	Switch $hwndFrom
		Case $hListView
			Switch $code
				Case $LVN_BEGINDRAG
					If $DebugIt Then _DebugPrint("$LVN_BEGINDRAG")
					$x = BitAND($lParam, 0xFFFF)
					$y = BitShift($lParam, 16)
					$tNMLISTVIEW = DllStructCreate($tagNMLISTVIEW, $lParam)
					$a_index[0] = DllStructGetData($tNMLISTVIEW, "Item")
					$hDragImageList = _GUICtrlListView_CreateDragImage($hListView, $a_index[0])
					If @error Then Return SetError(-1, -1, $GUI_RUNDEFMSG)
					_GUIImageList_BeginDrag($hDragImageList[0], 0, 0, 0)
					If @error Then Return SetError(-1, -1, $GUI_RUNDEFMSG)
					If $DebugIt Then _DebugPrint("From = " & $a_index[0])
					_GUIImageList_DragEnter($hListView, $x, $y)
					_WinAPI_SetCapture($hWndGUI)
					$bDragging = True
				Case $NM_CUSTOMDRAW
					If $DebugIt Then _DebugPrint("$NM_CUSTOMDRAW")
					$tDraw = DllStructCreate($tagNMLVCUSTOMDRAW, $lParam)
					$dwDrawStage = DllStructGetData($tDraw, "dwDrawStage")
					$dwItemSpec = DllStructGetData($tDraw, "dwItemSpec")
					Switch $dwDrawStage
						Case $CDDS_PREPAINT
							If $DebugIt Then _DebugPrint("$CDDS_PREPAINT")
							Return $CDRF_NOTIFYITEMDRAW
						Case $CDDS_ITEMPREPAINT
							If $DebugIt Then _DebugPrint("$CDDS_ITEMPREPAINT")
							If BitAND($dwItemSpec, 1) = 1 Then
								DllStructSetData($tDraw, "clrTextBk", $CLR_AQUA)
							Else
								DllStructSetData($tDraw, "clrTextBk", $CLR_WHITE)
							EndIf
							Return $CDRF_NEWFONT
					EndSwitch
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY
#endregion Event Function(s) **********************************************************************************************

Func _DebugPrint($s_text)
	$s_text = StringReplace($s_text, @CRLF, @CRLF & "-->")
	ConsoleWrite("!===========================================================" & @CRLF & _
			"+===========================================================" & @CRLF & _
			"-->" & $s_text & @CRLF & _
			"+===========================================================" & @CRLF)
EndFunc   ;==>_DebugPrint

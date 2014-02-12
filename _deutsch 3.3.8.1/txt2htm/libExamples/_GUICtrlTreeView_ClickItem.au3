#include <GuiConstantsEx.au3>
#include <GuiTreeView.au3>
#include <GuiImageList.au3>
#include <WindowsConstants.au3>

$Debug_TV = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die TreeView-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $hTreeView

_Main()

Func _Main()

	Local $hItem, $hImage, $iImage
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)

	GUICreate("TreeView: Item anklicken", 400, 300)

	$hTreeView = GUICtrlCreateTreeView(2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState()

	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	$hImage = _GUIImageList_Create(16, 16, 5, 3)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 110)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 131)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 165)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 168)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 137)
	_GUIImageList_AddIcon($hImage, "shell32.dll", 146)
	_GUICtrlTreeView_SetNormalImageList($hTreeView, $hImage)

	_GUICtrlTreeView_BeginUpdate($hTreeView)
	For $x = 1 To Random(2, 10, 1)
		$iImage = Random(0, 5, 1)
		$hItem = _GUICtrlTreeView_Add($hTreeView, 0, StringFormat("[%02d] Neues Item", $x), $iImage, $iImage)
		For $y = 1 To Random(2, 10, 1)
			$iImage = Random(0, 5, 1)
			_GUICtrlTreeView_AddChild($hTreeView, $hItem, StringFormat("[%02d] Neues Child", $y), $iImage, $iImage)
		Next
	Next
	_GUICtrlTreeView_EndUpdate($hTreeView)

	_GUICtrlTreeView_ClickItem($hTreeView, $hItem, "left", False, 2)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

Func WM_NOTIFY($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg, $iwParam
	Local $hWndFrom, $iIDFrom, $iCode, $tNMHDR, $hWndTreeview
	$hWndTreeview = $hTreeView
	If Not IsHWnd($hTreeView) Then $hWndTreeview = GUICtrlGetHandle($hTreeView)

	$tNMHDR = DllStructCreate($tagNMHDR, $ilParam)
	$hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	$iIDFrom = DllStructGetData($tNMHDR, "IDFrom")
	$iCode = DllStructGetData($tNMHDR, "Code")
	Switch $hWndFrom
		Case $hWndTreeview
			Switch $iCode
				Case $NM_CLICK ; Der Benutzer hat mit der linken Maustaste innerhalb des Controls geklickt
					_DebugPrint("$NM_CLICK" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
;~ 					Return 1 ; Nonzero erlaubt keine Stanard-Abarbeitung
					Return 0 ; 0 erlaubt Standard-Abarbeitung
				Case $NM_DBLCLK ; Der Benutzer hat einen Doppelklick mit der linken Maustaste innerhalb des Controls durchgef&uuml;hrt
					_DebugPrint("$NM_DBLCLK" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
;~ 					Return 1 ; Nonzero erlaubt keine Stanard-Abarbeitung
					Return 0 ; 0 erlaubt Standard-Abarbeitung
				Case $NM_RCLICK ; Der Benutzer hat mit der rechten Maustaste innerhalb des Controls geklickt
					_DebugPrint("$NM_RCLICK" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
;~ 					Return 1 ; Nonzero erlaubt keine Stanard-Abarbeitung
					Return 0 ; 0 erlaubt Standard-Abarbeitung
				Case $NM_RDBLCLK ; Der Benutzer hat einen Doppelklick mit der rechten Maustaste innerhalb des Controls durchgef&uuml;hrt
					_DebugPrint("$NM_RDBLCLK" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
;~ 					Return 1 ; Nonzero erlaubt keine Stanard-Abarbeitung
					Return 0 ; 0 erlaubt Standard-Abarbeitung
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY

Func _DebugPrint($s_text, $line = @ScriptLineNumber)
	ConsoleWrite( _
			"!===========================================================" & @LF & _
			"+======================================================" & @LF & _
			"-->Zeile(" & StringFormat("%04d", $line) & "):" & @TAB & $s_text & @LF & _
			"+======================================================" & @LF)
EndFunc   ;==>_DebugPrint

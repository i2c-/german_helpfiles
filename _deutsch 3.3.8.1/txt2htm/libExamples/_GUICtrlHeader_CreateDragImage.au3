#include <GuiConstantsEx.au3>
#include <GuiHeader.au3>
#include <GuiImageList.au3>
#include <WinAPI.au3>

$Debug_HDR = False ; Pr&uuml;ft den Klassennamen (ClassName), der an die Header-Funktion &uuml;bergeben wird. Setze dies versuchsweise auf True und verwende dann ein Handle zu einem anderen Control, um die Funktionsweise zu verstehen.

Global $iMemo
_Main()

Func _Main()
	Local $hGUI, $hHeader, $hImage, $iMsg, $aSize, $tPos, $tRect, $hDC

	; Erstellt eine GUI
	$hGUI = GUICreate("Header", 400, 300)
	$hHeader = _GUICtrlHeader_Create($hGUI)
	$iMemo = GUICtrlCreateEdit("", 2, 32, 396, 266, 0)
	GUISetState()

	; F&uuml;gt die Spalten hinzu
	_GUICtrlHeader_AddItem($hHeader, "Spalte 1", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 2", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 3", 100)
	_GUICtrlHeader_AddItem($hHeader, "Spalte 4", 100)

	; Erstellt eine halbtransparente Version eines Itembildes zur Verwendung als ziehendes Bild
	$hImage = _GUICtrlHeader_CreateDragImage($hHeader, 1)
	$aSize = _GUIImageList_GetIconSize($hImage)
	$hDC = _WinAPI_GetDC($hGUI)

	MemoWrite("Bild drag Handle: " & "0x" & Hex($hImage))
	MemoWrite("IsPtr  = " & IsPtr($hImage) & " IsHWnd  = " & IsHWnd($hImage))

	; Erstellt eine halbtransparente Version eines Itembildes zur Verwendung als ziehendes Bild an der aktueller Cursorposition bis die GUI geschlossen wird
	Do
		$iMsg = GUIGetMsg()
		If $iMsg = $GUI_EVENT_MOUSEMOVE Then
			If $tPos <> 0 Then
				$tRect = DllStructCreate($tagRECT)
				DllStructSetData($tRect, "Left", DllStructGetData($tPos, "X"))
				DllStructSetData($tRect, "Top", DllStructGetData($tPos, "Y"))
				DllStructSetData($tRect, "Right", DllStructGetData($tPos, "X") + $aSize[0])
				DllStructSetData($tRect, "Bottom", DllStructGetData($tPos, "Y") + $aSize[1])
				_WinAPI_InvalidateRect($hGUI, $tRect)
			EndIf
			$tRect = _WinAPI_GetClientRect($hGUI)
			$tPos = _WinAPI_GetMousePos(True, $hGUI)
			If _WinAPI_PtInRect($tRect, $tPos) Then
				_GUIImageList_Draw($hImage, 0, $hDC, DllStructGetData($tPos, "X"), DllStructGetData($tPos, "Y"))
			EndIf
		EndIf
	Until $iMsg = $GUI_EVENT_CLOSE
EndFunc   ;==>_Main

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

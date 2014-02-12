#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <GuiButton.au3>
#include <GuiImageList.au3>

Global $iMemo

Example()

Func Example()
	Local $hImage, $y = 70, $iIcon = 125, $btn[6], $aImageListInfo

	GUICreate("Buttons", 510, 400)
	$iMemo = GUICtrlCreateEdit("", 119, 10, 376, 374, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	$hImage = _GUIImageList_Create(32, 32, 5, 3, 6)
	For $x = 6 To 11
		_GUIImageList_AddIcon($hImage, "shell32.dll", $x, True)
	Next

	$btn[0] = GUICtrlCreateButton("Button 1", 10, 10, 90, 50)
	_GUICtrlButton_SetImageList($btn[0], $hImage)


	For $x = 1 To 5
		$btn[$x] = GUICtrlCreateButton("Button " & $x + 1, 10, $y, 90, 50)
		_GUICtrlButton_SetImageList($btn[$x], _GetImageListHandle("shell32.dll", $iIcon + $x, True), $x)
		$y += 60
	Next


	For $x = 0 To 5
		$aImageListInfo = _GUICtrlButton_GetImageList($btn[$x])
		MemoWrite("Button " & $x + 1 & " Infos zur Imagelist" & @CRLF & "--------------------------------")
		MemoWrite("Handle der Imagelist ..: " & $aImageListInfo[0])
		MemoWrite("Linker Rand des Icons ...: " & $aImageListInfo[1])
		MemoWrite("Oberer Rand des Icons ...: " & $aImageListInfo[2])
		MemoWrite("Rechter Rand des Icons ..: " & $aImageListInfo[3])
		MemoWrite("Unterer Rand des Icons ..: " & $aImageListInfo[4])
		MemoWrite("Ausrichtung: " & _ExplainAlignment($aImageListInfo[5]))
		MemoWrite("--------------------------------" & @CRLF)
	Next

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd

	Exit
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

; Verwendet die Imagelist um ein Bild zu setzen und Text auf dem Button anzuzeigen
Func _GetImageListHandle($sFile, $nIconID = 0, $fLarge = False)
	Local $iSize = 16
	If $fLarge Then $iSize = 32

	Local $hImage = _GUIImageList_Create($iSize, $iSize, 5, 3)
	If StringUpper(StringMid($sFile, StringLen($sFile) - 2)) = "BMP" Then
		_GUIImageList_AddBitmap($hImage, $sFile)
	Else
		_GUIImageList_AddIcon($hImage, $sFile, $nIconID, $fLarge)
	EndIf
	Return $hImage
EndFunc   ;==>_GetImageListHandle

Func _ExplainAlignment($iAlign)
	Switch $iAlign
		Case 0
			Return "Das Bild ist am linken Rand ausgerichtet."
		Case 1
			Return "Das Bild ist am rechten Rand ausgerichtet."
		Case 2
			Return "Das Bild ist am oberen Rand ausgerichtet."
		Case 3
			Return "Das Bild ist am unteren Rand ausgerichtet."
		Case 4
			Return "Das Bild ist zentriert."
	EndSwitch
EndFunc   ;==>_ExplainAlignment

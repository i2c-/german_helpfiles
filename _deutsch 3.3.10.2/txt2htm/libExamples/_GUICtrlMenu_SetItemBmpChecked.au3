#include <GuiMenu.au3>
#include <GuiConstantsEx.au3>
#include <WinAPI.au3>

Global $iMemo

Example()

Func Example()
	Local $hGUI, $hFile, $hEdit, $hHelp, $hMain, $hBmp1, $hBmp2
	Local Enum $idNew = 1000, $idOpen, $idSave, $idExit, $idCut, $idCopy, $idPaste, $idAbout

	; Erstellt eine GUI
	$hGUI = GUICreate("Menu", 400, 300)

	; Erstellt den Men&uuml;punkt Datei
	$hFile = _GUICtrlMenu_CreateMenu()
	_GUICtrlMenu_InsertMenuItem($hFile, 0, "&Neu", $idNew)
	_GUICtrlMenu_InsertMenuItem($hFile, 1, "&&Ouml;ffnen", $idOpen)
	_GUICtrlMenu_InsertMenuItem($hFile, 2, "&Speichern", $idSave)
	_GUICtrlMenu_InsertMenuItem($hFile, 3, "", 0)
	_GUICtrlMenu_InsertMenuItem($hFile, 4, "B&eenden", $idExit)

	; Erstellt den Men&uuml;punkt "Bearbeiten"
	$hEdit = _GUICtrlMenu_CreateMenu()
	_GUICtrlMenu_InsertMenuItem($hEdit, 0, "&Ausschneiden", $idCut)
	_GUICtrlMenu_InsertMenuItem($hEdit, 1, "K&opieren", $idCopy)
	_GUICtrlMenu_InsertMenuItem($hEdit, 2, "&Einf&uuml;gen", $idPaste)

	; Erstellt den Men&uuml;punkt Hilfe
	$hHelp = _GUICtrlMenu_CreateMenu()
	_GUICtrlMenu_InsertMenuItem($hHelp, 0, "&&Uuml;ber", $idAbout)

	; Erstellt das Hauptmen&uuml;
	$hMain = _GUICtrlMenu_CreateMenu()
	_GUICtrlMenu_InsertMenuItem($hMain, 0, "&Datei", 0, $hFile)
	_GUICtrlMenu_InsertMenuItem($hMain, 1, "&Bearbeiten", 0, $hEdit)
	_GUICtrlMenu_InsertMenuItem($hMain, 2, "&Hilfe", 0, $hHelp)

	; Setzt das neue Men&uuml;
	_GUICtrlMenu_SetMenu($hGUI, $hMain)

	; Erstellt ein Memo Control
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 276, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Setzt das Bitmap je nachdem, ob das Item ausgew&auml;hlt ist
	$hBmp1 = _WinAPI_CreateSolidBitmap($hGUI, 0xFF0000, 11, 11)
	$hBmp2 = _WinAPI_CreateSolidBitmap($hGUI, 0x00FF00, 11, 11)
	_GUICtrlMenu_SetItemBmpChecked($hFile, 0, $hBmp1)
	_GUICtrlMenu_SetItemBmpChecked($hFile, 1, $hBmp1)
	_GUICtrlMenu_SetItemBmpChecked($hFile, 2, $hBmp1)
	_GUICtrlMenu_SetItemBmpUnchecked($hFile, 0, $hBmp2)
	_GUICtrlMenu_SetItemBmpUnchecked($hFile, 1, $hBmp2)
	_GUICtrlMenu_SetItemBmpUnchecked($hFile, 2, $hBmp2)

	; W&auml;hlt den Men&uuml;punkt '&Ouml;ffnen' aus
	_GUICtrlMenu_CheckMenuItem($hFile, 1)

	; Zeigt das die Handles der Bitmaps passen
	MemoWrite("Handle vom angehakten Item................: 0x" & Hex($hBmp1))
	MemoWrite("Handle vom abgehakten Item ...............: 0x" & Hex($hBmp2))
	MemoWrite("Handle vom angehakten Itempunkt '&Ouml;ffnen' .: 0x" & Hex(_GUICtrlMenu_GetItemBmpChecked($hFile, 0)))
	MemoWrite("Handle vom abgehakten Itempunkt '&Ouml;ffnen' .: 0x" & Hex(_GUICtrlMenu_GetItemBmpUnchecked($hFile, 0)))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

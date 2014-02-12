#include <GuiMenu.au3>
#include <GuiConstantsEx.au3>


Global $iMemo

Example()

Func Example()
	Local $hGUI, $hFile, $hEdit, $hHelp, $hMain
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
	_GUICtrlMenu_InsertMenuItem($hMain, 2, "&Hilfe", 0, 0)

	; Setzt das neue Men&uuml;
	_GUICtrlMenu_SetMenu($hGUI, $hMain)

	; Erstellt ein Memo Control
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 276, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Ermittelt/Setzt den Men&uuml;punkt 'Hilfe'
	MemoWrite("Handle des Men&uuml;punkts 'Hilfe': " & _GUICtrlMenu_GetItemSubMenu($hMain, 2))
	_GUICtrlMenu_SetItemSubMenu($hMain, 2, $hHelp)
	MemoWrite("Handle des Men&uuml;punkts 'Hilfe': " & _GUICtrlMenu_GetItemSubMenu($hMain, 2))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

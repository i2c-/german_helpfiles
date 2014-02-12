#include <GuiMenu.au3>
#include <GuiConstantsEx.au3>

_Main()

Func _Main()
	Local $hGUI, $hFile, $hEdit, $hHelp, $hMain
	Local Enum $idNew = 1000, $idOpen, $idSave, $idExit, $idCut, $idCopy, $idPaste, $idAbout

	; Erstellt eine GUI
	$hGUI = GUICreate("Menu", 400, 300)

	; Erstellt den Men&uuml;punkt Datei
	$hFile = _GUICtrlMenu_CreateMenu()
	_GUICtrlMenu_AddMenuItem($hFile, "&Neu", $idNew)
	_GUICtrlMenu_AddMenuItem($hFile, "&&Ouml;ffnen", $idOpen)
	_GUICtrlMenu_AddMenuItem($hFile, "&Speichern", $idSave)
	_GUICtrlMenu_AddMenuItem($hFile, "", 0)
	_GUICtrlMenu_AddMenuItem($hFile, "&Beenden", $idExit)

	; Erstellt den Men&uuml;punkt "Bearbeiten"
	$hEdit = _GUICtrlMenu_CreateMenu()
	_GUICtrlMenu_AddMenuItem($hEdit, "&ausschneiden", $idCut)
	_GUICtrlMenu_AddMenuItem($hEdit, "K&opieren", $idCopy)
	_GUICtrlMenu_AddMenuItem($hEdit, "&Einf&uuml;gen", $idPaste)

	; Erstellt den Men&uuml;punkt Hilfe
	$hHelp = _GUICtrlMenu_CreateMenu()
	_GUICtrlMenu_AddMenuItem($hHelp, "&&Uuml;ber", $idAbout)

	; Erstellt das Hauptmen&uuml;
	$hMain = _GUICtrlMenu_CreateMenu()
	_GUICtrlMenu_AddMenuItem($hMain, "&Datei", 0, $hFile)
	_GUICtrlMenu_AddMenuItem($hMain, "&Bearbeiten", 0, $hEdit)
	_GUICtrlMenu_AddMenuItem($hMain, "&Hilfe", 0, $hHelp)

	; Setzt das neue Men&uuml;
	_GUICtrlMenu_SetMenu($hGUI, $hMain)
	GUISetState()

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>_Main

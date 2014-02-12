#include <GuiMenu.au3>
#include <GuiConstantsEx.au3>

_Main()

Func _Main()
	Local $hGUI, $hFile, $hEdit, $hHelp, $hMain
	Local Enum $idNew = 1000, $idOpen, $idSave, $idExit, $idCut, $idCopy, $idPaste, $idAbout

	; Erstellt eine GUI
	$hGUI = GUICreate("Menu", 400, 300)

	; Erstellt den Men&uuml;punkt "Datei"
	$hFile = _GUICtrlMenu_CreateMenu()
	InsertItem($hFile, 0, "&Neu", $idNew)
	InsertItem($hFile, 1, "&&ouml;ffnen", $idOpen)
	InsertItem($hFile, 2, "&Speichern", $idSave)
	InsertItem($hFile, 3, "", 0)
	InsertItem($hFile, 4, "B&earbeiten", $idExit)

	; Erstellt den Men&uuml;punkt "Bearbeiten"
	$hEdit = _GUICtrlMenu_CreateMenu()
	InsertItem($hEdit, 0, "&Ausschneiden", $idCut)
	InsertItem($hEdit, 1, "K&opieren", $idCopy)
	InsertItem($hEdit, 2, "&Einf&uuml;gen", $idPaste)

	; Erstellt den Men&uuml;punkt "Hilfe"
	$hHelp = _GUICtrlMenu_CreateMenu()
	InsertItem($hHelp, 0, "&&Uuml;ber", $idAbout)

	; Erstellt das Hauptmen&uuml;
	$hMain = _GUICtrlMenu_CreateMenu()
	InsertItem($hMain, 0, "&Datei", 0, $hFile)
	InsertItem($hMain, 1, "&Bearbeiten", 0, $hEdit)
	InsertItem($hMain, 2, "&Hilfe", 0, $hHelp)

	; Setzt das neue Men&uuml;
	_GUICtrlMenu_SetMenu($hGUI, $hMain)
	GUISetState()

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>_Main

; F&uuml;gt ein Men&uuml; Item ein (der schwere Weg)
Func InsertItem($hMenu, $iIndex, $sText, $iCmdID = 0, $hSubMenu = 0)
	Local $tMenu, $tText

	$tMenu = DllStructCreate($tagMENUITEMINFO)
	DllStructSetData($tMenu, "Size", DllStructGetSize($tMenu))
	DllStructSetData($tMenu, "Mask", BitOR($MIIM_ID, $MIIM_STRING, $MIIM_SUBMENU))
	DllStructSetData($tMenu, "ID", $iCmdID)
	DllStructSetData($tMenu, "SubMenu", $hSubMenu)
	If $sText = "" Then
		DllStructSetData($tMenu, "Mask", $MIIM_FTYPE)
		DllStructSetData($tMenu, "Type", $MFT_SEPARATOR)
	Else
		DllStructSetData($tMenu, "Mask", BitOR($MIIM_ID, $MIIM_STRING, $MIIM_SUBMENU))
		$tText = DllStructCreate("wchar Text[" & StringLen($sText) + 1 & "]")
		DllStructSetData($tText, "Text", $sText)
		DllStructSetData($tMenu, "TypeData", DllStructGetPtr($tText))
	EndIf
	_GUICtrlMenu_InsertMenuItemEx($hMenu, $iIndex, $tMenu)
EndFunc   ;==>InsertItem

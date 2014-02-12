#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $iCancel, $iExit, $iFileItem, $iFileMenu, $iHelpMenu, $iInfoItem
	Local $iRecentFilesMenu, $iStatusLabel, $iViewMenu, $iViewStatusItem, $sFilePath, $sStatus = "Ready"

	GUICreate("Mein GUI Men&uuml;", 300, 200)

	Global $status = "Fertig"

	$iFileMenu = GUICtrlCreateMenu("&Datei")
	$iFileItem = GUICtrlCreateMenuitem("&Ouml;ffnen", $iFileMenu)
	GUICtrlSetState(-1, $GUI_DEFBUTTON)
	$iHelpMenu = GUICtrlCreateMenu("?")
	GUICtrlCreateMenuitem("Speichern", $iFileMenu)
	GUICtrlSetState(-1, $GUI_DISABLE)
	$iInfoItem = GUICtrlCreateMenuitem("Info", $iFileMenu)
	$iExit = GUICtrlCreateMenuitem("Beenden", $iFileMenu)
	$iRecentFilesMenu = GUICtrlCreateMenu("Letzte Dateien", $iFileMenu, 1)

	GUICtrlCreateMenuitem("", $iFileMenu, 2) ; Erstellt eine leere Zeile

	$iViewMenu = GUICtrlCreateMenu("Ansicht", -1, 1) ; Wird vor dem "?" Men&uuml; erstellt
	$iViewStatusItem = GUICtrlCreateMenuitem("Statuszeile", $iViewMenu)
	GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlCreateButton("OK", 50, 130, 70, 20)
	GUICtrlSetState(-1, $GUI_FOCUS)
	$iCancel = GUICtrlCreateButton("Abbrechen", 180, 130, 70, 20)

	$iStatusLabel = GUICtrlCreateLabel($sStatus, 0, 165, 300, 16, BitOR($SS_SIMPLE, $SS_SUNKEN))

	GUISetState(@SW_SHOW)

; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $iCancel, $iExit
				Exit

			Case $iInfoItem
				MsgBox($MB_SYSTEMMODAL, "Info", "Nur ein Test...")

			Case $iFileItem
				$file = FileOpenDialog("W&auml;hlen Sie eine Datei aus...", @TempDir, "Alle (*.*)")
				If @error Then
					ContinueLoop
				EndIf
				GUICtrlCreateMenuitem($sFilePath, $iRecentFilesMenu)

			Case $iViewStatusItem
				If BitAND(GUICtrlRead($iViewStatusItem), $GUI_CHECKED) = $GUI_CHECKED Then
					GUICtrlSetState($iViewStatusItem, $GUI_UNCHECKED)
					GUICtrlSetState($iStatusLabel, $GUI_HIDE)
				Else
					GUICtrlSetState($iViewStatusItem, $GUI_CHECKED)
					GUICtrlSetState($iStatusLabel, $GUI_SHOW)
				EndIf
		EndSwitch
	WEnd
EndFunc   ;==>Example

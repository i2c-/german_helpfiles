#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $defaultstatus = "Bereit", $filemenu, $fileitem
	Local $helpmenu, $infoitem, $exititem, $recentfilesmenu
	Local $viewmenu, $viewstatusitem, $cancelbutton
	Local $statuslabel, $msg, $file

	GUICreate("Mein GUI Men&uuml;", 300, 200)


	$filemenu = GUICtrlCreateMenu("&Datei")
	$fileitem = GUICtrlCreateMenuitem("&Ouml;ffnen", $filemenu)
	GUICtrlSetState(-1, $GUI_DEFBUTTON)
	$helpmenu = GUICtrlCreateMenu("?")
	GUICtrlCreateMenuitem("Speichern", $filemenu)
	GUICtrlSetState(-1, $GUI_DISABLE)
	$infoitem = GUICtrlCreateMenuitem("Info", $helpmenu)
	$exititem = GUICtrlCreateMenuitem("Beenden", $filemenu)
	$recentfilesmenu = GUICtrlCreateMenu("Letzte Dateien", $filemenu, 1)

	GUICtrlCreateMenuitem("", $filemenu, 2) ; Erstellt eine Trennlinie (hier: leere Zeile)

	$viewmenu = GUICtrlCreateMenu("Ansicht", -1, 1) ; Wird vor dem "?" Men&uuml; erstellt
	$viewstatusitem = GUICtrlCreateMenuitem("Statusbar", $viewmenu)
	GUICtrlSetState(-1, $GUI_CHECKED)
	GUICtrlCreateButton("OK", 50, 130, 70, 20)
	GUICtrlSetState(-1, $GUI_FOCUS)
	$cancelbutton = GUICtrlCreateButton("Abbrechen", 180, 130, 70, 20)

	$statuslabel = GUICtrlCreateLabel($defaultstatus, 0, 165, 300, 16, BitOR($SS_SIMPLE, $SS_SUNKEN))

	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		$msg = GUIGetMsg()

		If $msg = $fileitem Then
			$file = FileOpenDialog("W&auml;hlen Sie eine Datei aus...", @TempDir, "Alle (*.*)")
			If @error <> 1 Then GUICtrlCreateMenuitem($file, $recentfilesmenu)
		EndIf
		If $msg = $viewstatusitem Then
			If BitAND(GUICtrlRead($viewstatusitem), $GUI_CHECKED) = $GUI_CHECKED Then
				GUICtrlSetState($viewstatusitem, $GUI_UNCHECKED)
				GUICtrlSetState($statuslabel, $GUI_HIDE)
			Else
				GUICtrlSetState($viewstatusitem, $GUI_CHECKED)
				GUICtrlSetState($statuslabel, $GUI_SHOW)
			EndIf
		EndIf
		If $msg = $GUI_EVENT_CLOSE Or $msg = $cancelbutton Or $msg = $exititem Then ExitLoop
		If $msg = $infoitem Then MsgBox($MB_SYSTEMMODAL, "Info", "Nur ein Test...")
	WEnd
	GUIDelete()
EndFunc   ;==>Example

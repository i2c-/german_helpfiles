#include <GuiConstantsEx.au3>
#include <GuiAVI.au3>

Global $hAVI

Example()

Func Example()
	Local $Wow64 = ""
	If @AutoItX64 Then $Wow64 = "\Wow6432Node"
	Local $hGUI, $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $Wow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\Examples\GUI\SampleAVI.avi"

	; Erstellt eine GUI
	$hGUI = GUICreate("AVI: &Ouml;ffnen (Extern)", 300, 100)
	$hAVI = _GUICtrlAVI_Create($hGUI, "", -1, 10, 10)
	GUISetState(@SW_SHOW)

	; Spielt das Beispiel AutoIt AVI ab
	_GUICtrlAVI_Open($hAVI, $sFile)

	; Spielt das Beispiel AutoIt AVI ab
	_GUICtrlAVI_Play($hAVI)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Schlie&szlig;t den AVI Clip
	_GUICtrlAVI_Close($hAVI)


	GUIDelete()
EndFunc   ;==>Example

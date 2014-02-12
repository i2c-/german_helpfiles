#include <GUIConstantsEx.au3>
#include <GuiAVI.au3>
#include <MsgBoxConstants.au3>

Global $hAVI

Example()

Func Example()
	Local $Wow64 = ""
	If @AutoItX64 Then $Wow64 = "\Wow6432Node"
	Local $hGUI, $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $Wow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\Examples\GUI\SampleAVI.avi"

	; Erstellt eine GUI
	$hGUI = GUICreate("AVI: L&ouml;schen (Extern)", 300, 100)
	$hAVI = _GUICtrlAVI_Create($hGUI, "", -1, 10, 10)
	GUISetState(@SW_SHOW)

	; &Ouml;ffnet das Beispiel AutoIt AVI ab
	_GUICtrlAVI_Open($hAVI, $sFile)

	; Spielt das Beispiel AutoIt AVI ab
	_GUICtrlAVI_Play($hAVI)

	Sleep(3000)

	; Stoppt den AVI Clip nach 3 Sekunden
	_GUICtrlAVI_Stop($hAVI)

	; Schlie&szlig;t den AVI Clip
	_GUICtrlAVI_Close($hAVI)

	MsgBox($MB_SYSTEMMODAL, "Information", "Das AVI-Control wird zerst&ouml;rt")
	_GUICtrlAVI_Destroy($hAVI)

	; Die Schleife wiederholt sich, bis der Benutzer eine Beenden-Aktion ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE



	GUIDelete()
EndFunc   ;==>Example

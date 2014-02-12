#include <ScreenCapture.au3>

Example()

Func Example()
	Local $hGUI

	; Erstellt eine GUI
	$hGUI = GUICreate("Bildschirmaufnahme", 400, 300)
	GUISetState(@SW_SHOW)
	Sleep(250)

	; Erstellt einen Screenshot von einem Fenster
	_ScreenCapture_CaptureWnd(@MyDocumentsDir & "\GDIPlus_Image.jpg", $hGUI)

	ShellExecute(@MyDocumentsDir & "\GDIPlus_Image.jpg")
EndFunc   ;==>Example

#include <ScreenCapture.au3>

_Main()

Func _Main()
	Local $hGUI

	; Erstellt eine GUI
	$hGUI = GUICreate("Bildschirmaufnahme", 400, 300)
	GUISetState()

	; Erstellt einen Screenshot von einem Fenster
	_ScreenCapture_CaptureWnd(@MyDocumentsDir & "\GDIPlus_Image.jpg", $hGUI)

EndFunc   ;==>_Main

#include <ScreenCapture.au3>

_Main()

Func _Main()
	Local $hBmp

	; Erstellt einen Screenshot vom kompletten Bildschirm
	$hBmp = _ScreenCapture_Capture("")

	; Speichert das Bitmap in eine Datei
	_ScreenCapture_SaveImage(@MyDocumentsDir & "\GDIPlus_Image.jpg", $hBmp)

EndFunc   ;==>_Main

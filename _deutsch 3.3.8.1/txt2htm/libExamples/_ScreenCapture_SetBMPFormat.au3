#include <ScreenCapture.au3>

; Erstellt einen Screenshot vom kompletten Bildschirm
_ScreenCapture_SetBMPFormat(0) ; Setzt den Qualit&auml;tslevel, der f&uuml;r JPEG Screenshots verwendet wird
_ScreenCapture_Capture(@MyDocumentsDir & "\GDIPlus_Image.bmp")

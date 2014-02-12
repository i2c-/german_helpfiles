#include <ScreenCapture.au3>

; Erstellt einen Screenshot vom kompletten Bildschirm
_ScreenCapture_Capture(@MyDocumentsDir & "\GDIPlus_Image1.jpg")

; Erstellt einen Screenshot von einem Bereich
_ScreenCapture_Capture(@MyDocumentsDir & "\GDIPlus_Image2.jpg", 0, 0, 796, 596)

#include <GuiConstantsEx.au3>
#include <GDIPlus.au3>
#include <ScreenCapture.au3>

_Main()

Func _Main()
	Local $hGUI, $hBMP, $hBitmap, $hGraphic, $hImage, $iX, $iY, $hClone

	; Erstellt eine GUI
	$hGUI = GUICreate("GDI+", 400, 300)
	GUISetState()

	; Initialisiert (startet) Microsoft Windows GDI+
	_GDIPlus_Startup()

	; Erstellt vom kompletten Bildschirm einen Screenshot und erzeugt daraus eine 32 Bit Bitmap
	$hBMP = _ScreenCapture_Capture("")
	$hImage = _GDIPlus_BitmapCreateFromHBITMAP($hBMP)

	; Erzeugt eine Kopie einer 24 Bit Bitmap
	$iX = _GDIPlus_ImageGetWidth($hImage)
	$iY = _GDIPlus_ImageGetHeight($hImage)
	$hClone = _GDIPlus_BitmapCloneArea($hImage, 0, 0, $iX, $iY, $GDIP_PXF24RGB)

	; Speichert das Bild in eine Datei
	_GDIPlus_ImageSaveToFile($hClone, @MyDocumentsDir & "\GDIPlus_Image.bmp")

	; Ressourcen freigeben
	_GDIPlus_BitmapDispose($hClone)
	_GDIPlus_BitmapDispose($hImage)
	_WinAPI_DeleteObject($hBMP)

	; Zeichnet ein Bitmap auf die GUI
	$hBitmap = _GDIPlus_BitmapCreateFromFile(@MyDocumentsDir & "\GDIPlus_Image.bmp")
	$hGraphic = _GDIPlus_GraphicsCreateFromHWND($hGUI)
	_GDIPlus_GraphicsDrawImage($hGraphic, $hBitmap, 0, 0)

	; Ressourcen freigeben
	_GDIPlus_GraphicsDispose($hGraphic)
	_GDIPlus_BitmapDispose($hBitmap)

	; Gibt die durch Microsoft Windows GDI+ verwendeten Ressourcen wieder frei
	_GDIPlus_Shutdown()

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE


EndFunc   ;==>_Main

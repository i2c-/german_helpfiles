#include <GuiConstantsEx.au3>
#include <GDIPlus.au3>
#include <ScreenCapture.au3>

_Main()

Func _Main()
	Local $hGUI1, $hGUI2, $hImage, $hGraphic1, $hGraphic2

	; Screenshot vom linken oberen Bereich des Bildschirms speichern
	_ScreenCapture_Capture(@MyDocumentsDir & "\GDIPlus_Image.jpg", 0, 0, 400, 300)

	; Erstellt ein GUI f&uuml;r das Originalbild
	$hGUI1 = GUICreate("Original", 400, 300, 0, 0)
	GUISetState()

	; Erstellt ein GUI f&uuml;r das vergr&ouml;&szlig;erte Bild
	$hGUI2 = GUICreate("Vergr&ouml;&szlig;ert", 400, 300, 0, 400)
	GUISetState()

	; Initialisiert (startet) Microsoft Windows GDI+ und l&auml;dt das Bild
	_GDIPlus_Startup()
	$hImage = _GDIPlus_ImageLoadFromFile(@MyDocumentsDir & "\GDIPlus_Image.jpg")

	; Zeichne das Originalbild
	$hGraphic1 = _GDIPlus_GraphicsCreateFromHWND($hGUI1)
	_GDIPlus_GraphicsDrawImage($hGraphic1, $hImage, 0, 0)

	; Zeichne das vergr&ouml;&szlig;erte Bild (2fach Zoom)
	$hGraphic2 = _GDIPlus_GraphicsCreateFromHWND($hGUI2)
	_GDIPlus_GraphicsDrawImageRectRect($hGraphic2, $hImage, 0, 0, 200, 200, 0, 0, 400, 300)

	; Ressourcen freigeben
	_GDIPlus_GraphicsDispose($hGraphic1)
	_GDIPlus_GraphicsDispose($hGraphic2)
	_GDIPlus_ImageDispose($hImage)
	_GDIPlus_Shutdown()

	; Screenshot-Datei l&ouml;schen
	FileDelete(@MyDocumentsDir & "\GDIPlus_Image.jpg")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

EndFunc   ;==>_Main

#include <GDIPlus.au3>
#include <ScreenCapture.au3>
#include <WinAPI.au3>

_Main()

Func _Main()
	Local $hBitmap1, $hBitmap2, $hImage1, $hImage2, $hGraphic, $width, $height

	; Initialisiert (startet) Microsoft Windows GDI+
	_GDIPlus_Startup()

	; Erstellt vom kompletten Bildschirm einen Screenshot
	$hBitmap1 = _ScreenCapture_Capture("")
	$hImage1 = _GDIPlus_BitmapCreateFromHBITMAP($hBitmap1)

	; Erstellt von einem Bereich einen Screenshot
	$hBitmap2 = _ScreenCapture_Capture("", 0, 0, 400, 300)
	$hImage2 = _GDIPlus_BitmapCreateFromHBITMAP($hBitmap2)

	$width = _GDIPlus_ImageGetWidth($hImage2)
	$height = _GDIPlus_ImageGetHeight($hImage2)

	; Zeichnet ein Bild in ein anderes
	$hGraphic = _GDIPlus_ImageGetGraphicsContext($hImage1)

	; DrawInsert($hGraphic, $hImage2, $iX, $iY, $nAngle,    $iWidth,    $iHeight, $iARGB = 0xFF000000, $nWidth = 1)
	DrawInsert($hGraphic, $hImage2, 350, 100, 0, $width + 2, $height + 2, 0xFFFF8000, 2)
	DrawInsert($hGraphic, $hImage2, 340, 50, 15, 200, 150, 0xFFFF8000, 4)
	DrawInsert($hGraphic, $hImage2, 310, 30, 35, $width + 4, $height + 4, 0xFFFF00FF, 4)
	DrawInsert($hGraphic, $hImage2, 320, 790, -35, $width, $height)

	; Speichert das neue Bild
	_GDIPlus_ImageSaveToFile($hImage1, @MyDocumentsDir & "\GDIPlus_Image.jpg")

	; Ressourcen freigeben
	_GDIPlus_ImageDispose($hImage1)
	_GDIPlus_ImageDispose($hImage2)
	_WinAPI_DeleteObject($hBitmap1)
	_WinAPI_DeleteObject($hBitmap2)
	; Gibt die durch Microsoft Windows GDI+ verwendeten Ressourcen wieder frei
	_GDIPlus_Shutdown()

EndFunc   ;==>_Main

; #FUNCTION# ==================================================================================================
; Name...........: DrawInsert
; Beschreibung...: Zeichnet ein Bild in ein anderes
; Syntax.........: DrawInsert($hGraphic, $hImage2, $iX, $iY, $nAngle, $iWidth, $iHeight, $iARGB = 0xFF000000, $nWidth = 1)
; F&uuml;gt das Bild $hImage2 in $hGraphic ein
;
; Parameter......: $hGraphics   - Handle zum Grafikobjekt
;                  $hImage      - Handle zum einzuf&uuml;genden Bild-Objekt
;                  $iX          - X-Koordinate der oberen linken Ecke des eingef&uuml;gten Bildes
;                  $iY          - Y-Koordinate der oberen linken Ecke des eingef&uuml;gten Bildes
;                  $iWidth      - Breite des Rechteckrahmens um das eingef&uuml;gte Bild
;                  $iHeight     - H&ouml;he des Rechteckrahmens um das eingef&uuml;gte Bild
;                  $iARGB       - Alpha, Rot, Gr&uuml;n und Blau: Komponenten der Stiftfarbe des Rahmens
;                  $nWidth      - Breite des Zeichenstifts f&uuml;r den Rahmen
;                                 (die Einheit wird im $iUnit-Parameter der _GDIPlus_PenCreate-Funktion festgelegt)
;
; R&uuml;ckgabewerte..: Erfolg       - True
;                  Fehler       - False
;==================================================================================================
Func DrawInsert($hGraphic, $hImage2, $iX, $iY, $nAngle, $iWidth, $iHeight, $iARGB = 0xFF000000, $nWidth = 1)
	Local $hMatrix, $hPen2

	; Rotationsmatrix
	$hMatrix = _GDIPlus_MatrixCreate()
	_GDIPlus_MatrixRotate($hMatrix, $nAngle, "False")
	_GDIPlus_GraphicsSetTransform($hGraphic, $hMatrix)

	_GDIPlus_GraphicsDrawImage($hGraphic, $hImage2, $iX, $iY)

	; Ermittelt Stift + Farbe
	$hPen2 = _GDIPlus_PenCreate($iARGB, $nWidth)

	; Zeichnet einen Rahmen um das eingef&uuml;gte Bild
	_GDIPlus_GraphicsDrawRect($hGraphic, $iX, $iY, $iWidth, $iHeight, $hPen2)

	; Ressourcen freigeben
	_GDIPlus_MatrixDispose($hMatrix)
	_GDIPlus_PenDispose($hPen2)
	Return 1
EndFunc   ;==>DrawInsert

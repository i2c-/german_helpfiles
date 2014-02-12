#include <GDIPlus.au3>
#include <ScreenCapture.au3>

Example()

Func Example()
	Local $hImage, $sCLSID, $tData, $tParams

	; Erstellt vom kompletten Bildschirm einen Screenshot
	_ScreenCapture_Capture(@MyDocumentsDir & "\GDIPlus_Image.jpg")

	; Initialisiert (startet) Microsoft Windows GDI+
	_GDIPlus_Startup()

	; L&auml;dt ein Bild
	$hImage = _GDIPlus_ImageLoadFromFile(@MyDocumentsDir & "\GDIPlus_Image.jpg")

	; Gibt die Encoder CLSID f&uuml;r einen festgelegten Bild-Dateityp zur&uuml;ck
	$sCLSID = _GDIPlus_EncodersGetCLSID("JPG")

	; Setzt die Parameter f&uuml;r eine 90 Grad Rotation
	$tData = DllStructCreate("int Data")
	DllStructSetData($tData, "Data", $GDIP_EVTTRANSFORMROTATE90)
	$tParams = _GDIPlus_ParamInit(1)
	_GDIPlus_ParamAdd($tParams, $GDIP_EPGTRANSFORMATION, 1, $GDIP_EPTLONG, DllStructGetPtr($tData, "Data"))

	; Speichert das rotierte Bild
	_GDIPlus_ImageSaveToFileEx($hImage, @MyDocumentsDir & "\GDIPlus_Image2.jpg", $sCLSID, DllStructGetPtr($tParams))

	; Ressourcen freigeben
	_GDIPlus_ImageDispose($hImage)

	; Gibt die durch Microsoft Windows GDI+ verwendeten Ressourcen wieder frei
	_GDIPlus_Shutdown()

	ShellExecute(@MyDocumentsDir & "\GDIPlus_Image2.jpg")
EndFunc   ;==>Example

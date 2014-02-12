#include <GuiConstantsEx.au3>
#include <WindowsConstants.au3>
#include <GDIPlus.au3>
#include <ScreenCapture.au3>
#include <WinAPI.au3>


Global $iMemo

Example()

Func Example()
	Local $hBitmap, $hImage, $aRet

	; Erstellt eine GUI
	GUICreate("GDI+", 600, 400)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 606, 196, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Initialisiert (startet) Microsoft Windows GDI+
	_GDIPlus_Startup()

	; Erstellt vom kompletten Bildschirm einen Screenshot und erzeugt daraus eine 32 bit Bitmap
	$hBitmap = _ScreenCapture_Capture("")
	$hImage = _GDIPlus_BitmapCreateFromHBITMAP($hBitmap)

	; Gibt das Bildformat des Screenshots zur&uuml;ck
	$aRet = _GDIPlus_ImageGetRawFormat($hImage)
	MemoWrite("String mit dem Namen des Bildformats: " & $aRet[1]);
	MemoWrite("String mit der GUID des Dateiformats: " & $aRet[0]);
	MemoWrite();

	; Speichert die Screenshot-Bitmap in eine Datei
	_GDIPlus_ImageSaveToFile($hImage, @MyDocumentsDir & "\GDIPlus_Image.jpg")

	; Ressourcen freigeben
	_GDIPlus_ImageDispose($hImage)
	_WinAPI_DeleteObject($hBitmap)

	; L&auml;dt die Screenshot-Bitmap aus einer Datei
	$hImage = _GDIPlus_ImageLoadFromFile(@MyDocumentsDir & "\GDIPlus_Image.jpg")

	; Gibt das Bildformat der gespeicherten Datei zur&uuml;ck
	$aRet = _GDIPlus_ImageGetRawFormat($hImage)
	MemoWrite("String mit dem Namen des Bildformats: " & $aRet[1]);
	MemoWrite("String mit der GUID des Dateiformats: " & $aRet[0]);

	; Ressourcen freigeben
	_GDIPlus_ImageDispose($hImage)

	; Gibt die durch Microsoft Windows GDI+ verwendeten Ressourcen wieder frei
	_GDIPlus_Shutdown()

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage = '')
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

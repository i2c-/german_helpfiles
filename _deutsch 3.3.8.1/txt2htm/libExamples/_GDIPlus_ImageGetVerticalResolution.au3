#include <GuiConstantsEx.au3>
#include <WindowsConstants.au3>
#include <GDIPlus.au3>
#include <ScreenCapture.au3>
#include <WinAPI.au3>


Global $iMemo

_Main()

Func _Main()
	Local $hBitmap, $hImage

	; Erstellt eine GUI
	GUICreate("GDI+", 600, 400)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 596, 396, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; Initialisiert (startet) Microsoft Windows GDI+
	_GDIPlus_Startup()

	; Erstellt vom kompletten Bildschirm einen Screenshot und erzeugt daraus eine 32 bit Bitmap
	$hBitmap = _ScreenCapture_Capture("")
	$hImage = _GDIPlus_BitmapCreateFromHBITMAP($hBitmap)

	; Zeigt die vertikale Ausl&ouml;sung des Bildes in DPI (dots per inch)
	MemoWrite("VerticalResolution DPI : " & _GDIPlus_ImageGetVerticalResolution($hImage));

	; Ressourcen freigeben
	_GDIPlus_ImageDispose($hImage)
	_WinAPI_DeleteObject($hBitmap)

	; Gibt die durch Microsoft Windows GDI+ verwendeten Ressourcen wieder frei
	_GDIPlus_Shutdown()

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

EndFunc   ;==>_Main

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage = '')
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

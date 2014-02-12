#include <GuiConstantsEx.au3>
#include <GDIPlus.au3>

_Main()

Func _Main()
	Local $hGUI, $hGraphic, $hPen

	; Erstellt eine GUI
	$hGUI = GUICreate("GDI+", 400, 300)
	GUISetState()

	; Erzeugt die Ressourcen
	_GDIPlus_Startup()
	$hGraphic = _GDIPlus_GraphicsCreateFromHWND($hGUI)
	$hPen = _GDIPlus_PenCreate(0xFF000000, 4)
	_GDIPlus_PenSetEndCap($hPen, $GDIP_LINECAPARROWANCHOR)
	_GDIPlus_PenSetAlignment($hPen, 1)

	; Die Ausrichtung des Zeichenstifts anzeigen
	MsgBox(4096, "Information", "Ausrichtung des Zeichenstifts: " & _GDIPlus_PenGetAlignment($hPen))

	; Zeichnet Pfeile
	_GDIPlus_GraphicsDrawLine($hGraphic, 10, 130, 390, 130, $hPen)
	_GDIPlus_PenSetWidth($hPen, 6)
	_GDIPlus_GraphicsDrawLine($hGraphic, 10, 150, 390, 150, $hPen)
	_GDIPlus_PenSetWidth($hPen, 8)
	_GDIPlus_GraphicsDrawLine($hGraphic, 10, 170, 390, 170, $hPen)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Ressourcen freigeben
	_GDIPlus_PenDispose($hPen)
	_GDIPlus_GraphicsDispose($hGraphic)
	_GDIPlus_Shutdown()

EndFunc   ;==>_Main

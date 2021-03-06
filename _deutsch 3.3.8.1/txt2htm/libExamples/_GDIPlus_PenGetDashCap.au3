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
	$hPen = _GDIPlus_PenCreate(0xFF000000, 8)
	_GDIPlus_PenSetDashStyle($hPen, $GDIP_DASHSTYLEDASHDOT)
	_GDIPlus_PenSetDashCap($hPen, $GDIP_DASHCAPTRIANGLE)

	; Den Stil der Strich-Endkappe des Zeichenstiftes anzeigen
	MsgBox(4096, "Information", "Strich-Endkappe des Zeichenstiftes: " & _GDIPlus_PenGetDashCap($hPen))

	; Zeichnet eine Linie
	_GDIPlus_GraphicsDrawLine($hGraphic, 10, 150, 390, 150, $hPen)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Ressourcen freigeben
	_GDIPlus_PenDispose($hPen)
	_GDIPlus_GraphicsDispose($hGraphic)
	_GDIPlus_Shutdown()

EndFunc   ;==>_Main

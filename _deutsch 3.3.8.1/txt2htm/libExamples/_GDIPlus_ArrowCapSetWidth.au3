#include <GuiConstantsEx.au3>
#include <GDIPlus.au3>

_Main()

Func _Main()
	Local $hGUI, $hGraphic, $hPen, $hEndCap

	; Erstellt eine GUI
	$hGUI = GUICreate("GDI+", 400, 300)
	GUISetState()

	; Erzeugt die Ressourcen
	_GDIPlus_Startup()
	$hGraphic = _GDIPlus_GraphicsCreateFromHWND($hGUI)
	$hPen = _GDIPlus_PenCreate(0xFF000000, 4)
	$hEndCap = _GDIPlus_ArrowCapCreate(3, 6)
	_GDIPlus_PenSetCustomEndCap($hPen, $hEndCap)

	; Zeichnet Pfeil 1
	_GDIPlus_GraphicsDrawLine($hGraphic, 10, 120, 390, 120, $hPen)

	; Zeichnet Pfeil 2
	_GDIPlus_ArrowCapSetWidth($hEndCap, _GDIPlus_ArrowCapGetWidth($hEndCap) + 2)
	_GDIPlus_PenSetCustomEndCap($hPen, $hEndCap)
	_GDIPlus_GraphicsDrawLine($hGraphic, 10, 150, 390, 150, $hPen)

	; Zeichnet Pfeil 3
	_GDIPlus_ArrowCapSetWidth($hEndCap, _GDIPlus_ArrowCapGetWidth($hEndCap) + 2)
	_GDIPlus_PenSetCustomEndCap($hPen, $hEndCap)
	_GDIPlus_GraphicsDrawLine($hGraphic, 10, 190, 390, 190, $hPen)


	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Ressourcen freigeben
	_GDIPlus_ArrowCapDispose($hEndCap)
	_GDIPlus_PenDispose($hPen)
	_GDIPlus_GraphicsDispose($hGraphic)
	_GDIPlus_Shutdown()
EndFunc   ;==>_Main

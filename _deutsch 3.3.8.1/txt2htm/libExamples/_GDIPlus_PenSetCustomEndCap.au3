#include <GuiConstantsEx.au3>
#include <GDIPlus.au3>

_Main()

Func _Main()
	Local $hGUI, $hGraphic, $hPen, $hEndCap

	; Erzeugt die GUI
	$hGUI = GUICreate("GDI+", 400, 300)
	GUISetState()

	; Erzeugt die Ressourcen
	_GDIPlus_Startup()
	$hGraphic = _GDIPlus_GraphicsCreateFromHWND($hGUI)
	$hPen = _GDIPlus_PenCreate(0xFF000000, 2)
	; Pfeilspitzenform festlegen
	$hEndCap = _GDIPlus_ArrowCapCreate(3, 6)
	; Dem Linienende unsere Pfeilspitzenform zuweisen
	_GDIPlus_PenSetCustomEndCap($hPen, $hEndCap)

	; Anzeige des Zeichenstift-Handles des Linienendes
	MsgBox(4096, "Information", "Handle zum Zeichenstift des Linienendes: 0x" & Hex(_GDIPlus_PenGetCustomEndCap($hPen)))

	; Zeichnen der Linien, die aussehen wie Pfeile
	_GDIPlus_GraphicsDrawLine($hGraphic, 10, 120, 390, 120, $hPen)
	_GDIPlus_PenSetWidth($hPen, 4)
	_GDIPlus_GraphicsDrawLine($hGraphic, 10, 150, 390, 150, $hPen)
	_GDIPlus_PenSetWidth($hPen, 6)
	_GDIPlus_GraphicsDrawLine($hGraphic, 10, 180, 390, 180, $hPen)

	; Auf Schlie&szlig;en des GUI-Fensters durch den Benutzer warten
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Ressourcen freigeben
	_GDIPlus_ArrowCapDispose($hEndCap)
	_GDIPlus_PenDispose($hPen)
	_GDIPlus_GraphicsDispose($hGraphic)
	_GDIPlus_Shutdown()
EndFunc   ;==>_Main

#include <GuiConstantsEx.au3>
#include <GDIPlus.au3>
#include <WindowsConstants.au3>

_Main()

Func _Main()
	Local $hGUI, $Label1, $label2, $hGraphic, $hBrush1, $iClr1, $iClr2

	; Erstellt ein GUI
	$hGUI = GUICreate("GDI+", 345, 150)
	$Label1 = GUICtrlCreateLabel("", 2, 2, 150, 20)
	$label2 = GUICtrlCreateLabel("", 202, 2, 150, 20)
	GUISetState()
	Sleep(100)

	; Startet GDIPlus
	_GDIPlus_Startup()
	$hGraphic = _GDIPlus_GraphicsCreateFromHWND($hGUI)

	; Erstellt ein einfarbiges F&uuml;llmuster
	$hBrush1 = _GDIPlus_BrushCreateSolid()

	; Originale Farbe des einfarbigen F&uuml;llmusters abfragen
	$iClr1 = _GDIPlus_BrushGetSolidColor($hBrush1)

	; Einige Grafiken mit der originalen Farbe des F&uuml;llmusters zeichnen
	_GDIPlus_GraphicsFillEllipse($hGraphic, 25, 25, 100, 100, $hBrush1)

	; Neue F&uuml;llmusterfarbe festlegen (0xFFFF0000 = Red)
	_GDIPlus_BrushSetSolidColor($hBrush1, 0xFFFF0000)

	; Neue Farbe des F&uuml;llmusters abfragen
	$iClr2 = _GDIPlus_BrushGetSolidColor($hBrush1)

	; Einige Grafiken mit der neuen Farbe des F&uuml;llmusters zeichnen
	_GDIPlus_GraphicsFillRect($hGraphic, 220, 25, 100, 100, $hBrush1)

	; Originale F&uuml;llmusterfarbe in Label1 schreiben
	GUICtrlSetData($Label1, "F&uuml;llmuster orignale Farbe: " & Hex($iClr1))

	; Neue F&uuml;llmusterfarbe in Label2 schreiben
	GUICtrlSetData($label2, "F&uuml;llmuster neue Farbe: " & Hex($iClr2))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion des GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Ressourcen freigeben
	_GDIPlus_BrushDispose($hBrush1)
	_GDIPlus_GraphicsDispose($hGraphic)
	_GDIPlus_Shutdown()

EndFunc   ;==>_Main

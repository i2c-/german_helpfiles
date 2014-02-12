#include <GuiConstantsEx.au3>
#include <GDIPlus.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $hGUI, $Label1, $label2, $hGraphic, $hBrush1, $iClr1, $iClr2

	; Erstellt ein GUI
	$hGUI = GUICreate("GDI+", 345, 150)
	$Label1 = GUICtrlCreateLabel("", 2, 2, 150, 20)
	$label2 = GUICtrlCreateLabel("", 202, 2, 150, 20)
	GUISetState(@SW_SHOW)
	Sleep(100)

	; Startet GDIPlus
	_GDIPlus_Startup()
	$hGraphic = _GDIPlus_GraphicsCreateFromHWND($hGUI)

	; Erstellt ein vollfarbiges F&uuml;llmuster
	$hBrush1 = _GDIPlus_BrushCreateSolid()

	; Fragt Farbe des vollfarbigen F&uuml;llmusters ab (Anm: Da keine Farbe angegeben wurde, ist diese schwarz)
	$iClr1 = _GDIPlus_BrushGetSolidColor($hBrush1)

	; Zeichnet ein paar Grafiken mit dem orginalen F&uuml;llmuster
	_GDIPlus_GraphicsFillEllipse($hGraphic, 25, 25, 100, 100, $hBrush1)

	; Setzt ein neues F&uuml;llmuster (0xFFFF0000 = Red)
	_GDIPlus_BrushSetSolidColor($hBrush1, 0xFFFF0000)

	; Fragt Farbe des neuen F&uuml;llmusters ab
	$iClr2 = _GDIPlus_BrushGetSolidColor($hBrush1)

	; Zeichnet ein paar Grafiken mit der neuen F&uuml;llmusterfarbe
	_GDIPlus_GraphicsFillRect($hGraphic, 220, 25, 100, 100, $hBrush1)

	; Schreibt die originale F&uuml;llmusterfarbe in Label1
	GUICtrlSetData($Label1, "F&uuml;llmuster orignale Farbe: " & Hex($iClr1))

	; Schreibt die neue F&uuml;llmusterfarbe in Label2
	GUICtrlSetData($label2, "F&uuml;llmuster neue Farbe: " & Hex($iClr2))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion des GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Ressourcen freigeben
	_GDIPlus_BrushDispose($hBrush1)
	_GDIPlus_GraphicsDispose($hGraphic)
	_GDIPlus_Shutdown()
EndFunc   ;==>Example

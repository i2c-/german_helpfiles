#include <GuiConstantsEx.au3>
#include <GDIPlus.au3>

_Main()

Func _Main()
	Local $hWnd, $hGraphic, $aPoints[4][2]

	; Erstellt eine GUI
	$hGUI = GUICreate("GDI+", 400, 300)
	GUISetState()

	; Zeichne ein Polygon
	_GDIPlus_Startup()
	$hGraphic = _GDIPlus_GraphicsCreateFromHWND($hGUI)

	$aPoints[0][0] = 3
	$aPoints[1][0] = 150
	$aPoints[1][1] = 150
	$aPoints[2][0] = 200
	$aPoints[2][1] = 100
	$aPoints[3][0] = 250
	$aPoints[3][1] = 150

	MsgBox(4096, "Information", "F&uuml;lle Polygon")

	_GDIPlus_GraphicsFillPolygon($hGraphic, $aPoints)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Ressourcen freigeben
	_GDIPlus_GraphicsDispose($hGraphic)
	_GDIPlus_Shutdown()

EndFunc   ;==>_Main

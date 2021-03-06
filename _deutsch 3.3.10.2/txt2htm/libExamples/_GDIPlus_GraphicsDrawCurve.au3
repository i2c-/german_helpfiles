#include <GuiConstantsEx.au3>
#include <GDIPlus.au3>

Example()

Func Example()
	Local $hGUI, $hGraphic, $aPoints[5][2]

	; Erstellt eine GUI
	$hGUI = GUICreate("GDI+", 400, 300)
	GUISetState(@SW_SHOW)

	; Zeichnet eine Spline
	_GDIPlus_Startup()
	$hGraphic = _GDIPlus_GraphicsCreateFromHWND($hGUI)

	$aPoints[0][0] = 4
	$aPoints[1][0] = 0
	$aPoints[1][1] = 100
	$aPoints[2][0] = 50
	$aPoints[2][1] = 50
	$aPoints[3][0] = 100
	$aPoints[3][1] = 100
	$aPoints[4][0] = 150
	$aPoints[4][1] = 50

	_GDIPlus_GraphicsDrawCurve($hGraphic, $aPoints)


	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Ressourcen freigeben
	_GDIPlus_GraphicsDispose($hGraphic)
	_GDIPlus_Shutdown()
EndFunc   ;==>Example

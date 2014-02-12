#include <GuiConstantsEx.au3>
#include <GDIPlus.au3>

Example()

Func Example()
	Local $hGUI, $hGraphic

	; Erstellt eine GUI
	$hGUI = GUICreate("GDI+", 400, 300)
	GUISetState(@SW_SHOW)

	; Zeichnet eine Ellipse
	_GDIPlus_Startup()
	$hGraphic = _GDIPlus_GraphicsCreateFromHWND($hGUI)
	_GDIPlus_GraphicsDrawEllipse($hGraphic, 130, 100, 140, 70)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Ressourcen freigeben
	_GDIPlus_GraphicsDispose($hGraphic)
	_GDIPlus_Shutdown()
EndFunc   ;==>Example

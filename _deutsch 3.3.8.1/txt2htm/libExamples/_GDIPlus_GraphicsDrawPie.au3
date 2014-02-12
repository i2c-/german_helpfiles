#include <GuiConstantsEx.au3>
#include <GDIPlus.au3>

_Main()

Func _Main()
	Local $hGUI, $hGraphic

	; Erstellt eine GUI
	$hGUI = GUICreate("GDI+", 400, 300)
	GUISetState()

	; Zeichnet einen Ellipsenausschnitt mit Verbindung zur Halbachse ("Kuchenst&uuml;ck")
	_GDIPlus_Startup()
	$hGraphic = _GDIPlus_GraphicsCreateFromHWND($hGUI)
	_GDIPlus_GraphicsDrawPie($hGraphic, 150, 80, 100, 100, 45, 90)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Ressourcen freigeben
	_GDIPlus_GraphicsDispose($hGraphic)
	_GDIPlus_Shutdown()

EndFunc   ;==>_Main

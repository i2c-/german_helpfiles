#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <GDIPlus.au3>
#include <WinAPI.au3>

; Beispiel mit PNG (von Zedna)

Global $hGUI, $hImage, $hGraphic, $hImage1

; GUI erstellen
$hGUI = GUICreate("PNG zeigen", 250, 250)

; PNG Bild laden
_GDIPlus_Startup()
$hImage = _GDIPlus_ImageLoadFromFile("..\GUI\Torus.png")
$hGraphic = _GDIPlus_GraphicsCreateFromHWND($hGUI)

GUIRegisterMsg($WM_PAINT, "MY_WM_PAINT")
GUISetState(@SW_SHOW)

; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
While 1
	Switch GUIGetMsg()
		Case $GUI_EVENT_CLOSE
			ExitLoop

	EndSwitch
WEnd

; Ressourcen aufr&auml;umen
_GDIPlus_GraphicsDispose($hGraphic)
_GDIPlus_ImageDispose($hImage)
_GDIPlus_Shutdown()

; PNG Bild zeichnen
Func MY_WM_PAINT($hWnd, $msg, $wParam, $lParam)
	#forceref $hWnd, $Msg, $wParam, $lParam
	_WinAPI_RedrawWindow($hGUI, 0, 0, $RDW_UPDATENOW)
	_GDIPlus_GraphicsDrawImage($hGraphic, $hImage, 0, 0)
	_WinAPI_RedrawWindow($hGUI, 0, 0, $RDW_VALIDATE)
	Return $GUI_RUNDEFMSG
EndFunc   ;==>MY_WM_PAINT

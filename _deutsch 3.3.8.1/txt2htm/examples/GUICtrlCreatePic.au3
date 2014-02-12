#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Global $gui, $guiPos, $pic, $picPos

Example1()
Example2()

;----- Beispiel 1 ----
Func Example1()
	Local $n, $msg

	GUICreate("Meine GUI mit Bild", 350, 300, -1, -1, $WS_SIZEBOX + $WS_SYSMENU) ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird.

	GUISetBkColor(0xE0FFFF)
	$n = GUICtrlCreatePic("..\GUI\mslogo.jpg", 50, 50, 200, 50)

	GUISetState()

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		$msg = GUIGetMsg()

		If $msg = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd

	; Ver&auml;ndere die Gr&ouml;&szlig;e des Controls
	GUICtrlSetPos($n, 50, 50, 200, 100)
	GUICtrlSetImage($n, "..\GUI\mslogo.jpg")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	While 1
		$msg = GUIGetMsg()

		If $msg = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd

	GUIDelete()
EndFunc   ;==>Example1

;----- Beispiel 2
Func Example2()
	Local $msg

	$gui = GUICreate("Test transparentes Bild", 200, 100)
	$pic = GUICreate("", 68, 71, 10, 20, $WS_POPUP, BitOR($WS_EX_LAYERED, $WS_EX_MDICHILD), $gui)
	GUICtrlCreatePic("..\GUI\merlin.gif", 0, 0, 0, 0)

	GUISetState(@SW_SHOW, $pic)
	GUISetState(@SW_SHOW, $gui)

	HotKeySet("{ESC}", "main")
	HotKeySet("{LEFT}", "left")
	HotKeySet("{RIGHT}", "right")
	HotKeySet("{DOWN}", "down")
	HotKeySet("{UP}", "up")
	$picPos = WinGetPos($pic)
	$guiPos = WinGetPos($gui)

	Do
		$msg = GUIGetMsg()
	Until $msg = $GUI_EVENT_CLOSE

	HotKeySet("{ESC}")
	HotKeySet("{LEFT}")
	HotKeySet("{RIGHT}")
	HotKeySet("{DOWN}")
	HotKeySet("{UP}")
EndFunc   ;==>Example2

Func main()
	$guiPos = WinGetPos($gui)
	WinMove($gui, "", $guiPos[0] + 10, $guiPos[1] + 10)
EndFunc   ;==>main

Func left()
	$picPos = WinGetPos($pic)
	WinMove($pic, "", $picPos[0] - 10, $picPos[1])
EndFunc   ;==>left

Func right()
	$picPos = WinGetPos($pic)
	WinMove($pic, "", $picPos[0] + 10, $picPos[1])
EndFunc   ;==>right

Func down()
	$picPos = WinGetPos($pic)
	WinMove($pic, "", $picPos[0], $picPos[1] + 10)
EndFunc   ;==>down

Func up()
	$picPos = WinGetPos($pic)
	WinMove($pic, "", $picPos[0], $picPos[1] - 10)
EndFunc   ;==>up

;----- Beispiel 3 wie das ganze auch mit PNG funktioniert (von Zedna)
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <GDIPlus.au3>
#include <WinAPI.au3>

Global $hGUI, $hImage, $hGraphic, $hImage1

; GUI erstellen
$hGUI = GUICreate("PNG zeigen", 250, 250)

; PNG Bild laden
_GDIPlus_Startup()
$hImage = _GDIPlus_ImageLoadFromFile("..\GUI\Torus.png")
$hGraphic = _GDIPlus_GraphicsCreateFromHWND($hGUI)

GUIRegisterMsg($WM_PAINT, "MY_WM_PAINT")
GUISetState()

; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
Do
Until GUIGetMsg() = $GUI_EVENT_CLOSE

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

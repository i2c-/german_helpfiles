#include <GUIConstantsEx.au3>

Example()

Func Example()
	Opt("GUICoordMode", 2)
	Opt("GUIResizeMode", 1)
	Opt("GUIOnEventMode", 1)

	GUICreate("Parent1")
	GUISetOnEvent($GUI_EVENT_CLOSE, "SpecialEvents")
	GUISetOnEvent($GUI_EVENT_MINIMIZE, "SpecialEvents")
	GUISetOnEvent($GUI_EVENT_RESTORE, "SpecialEvents")


	GUICtrlCreateButton("OK", 10, 30, 50)
	GUICtrlSetOnEvent(-1, "OKPressed")

	GUICtrlCreateButton("Abbrechen", 0, -1)
	GUICtrlSetOnEvent(-1, "CancelPressed")

	GUISetState(@SW_SHOW)


	; Warteschleife
	While 1
		Sleep(10)
	WEnd
EndFunc   ;==>Example

Func OKPressed()
	MsgBox(0, "OK gedr&uuml;ckt", "ID=" & @GUI_CtrlId & " WinHandle=" & @GUI_WinHandle & " CtrlHandle=" & @GUI_CtrlHandle)
EndFunc   ;==>OKPressed


Func CancelPressed()
	MsgBox(0, "Abbrechen gedr&uuml;ckt", "ID=" & @GUI_CtrlId & " WinHandle=" & @GUI_WinHandle & " CtrlHandle=" & @GUI_CtrlHandle)
EndFunc   ;==>CancelPressed


Func SpecialEvents()


	Select
		Case @GUI_CtrlId = $GUI_EVENT_CLOSE
			MsgBox(0, "Schliessen gedr&uuml;ckt", "ID=" & @GUI_CtrlId & " WinHandle=" & @GUI_WinHandle)
			Exit

		Case @GUI_CtrlId = $GUI_EVENT_MINIMIZE
			MsgBox(0, "Fenster minimiert", "ID=" & @GUI_CtrlId & " WinHandle=" & @GUI_WinHandle)

		Case @GUI_CtrlId = $GUI_EVENT_RESTORE
			MsgBox(0, "Fenster wiederhergestellt", "ID=" & @GUI_CtrlId & " WinHandle=" & @GUI_WinHandle)

	EndSelect

EndFunc   ;==>SpecialEvents

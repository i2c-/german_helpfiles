#include <GUIConstantsEx.au3>
#include <WinAPI.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGUI = GUICreate("String H&ouml;he & Breite.")
	GUISetState(@SW_SHOW, $hGUI)

	Local $sText = "Das ist ein wenig Text" ; Der Text von dem man die H&ouml;he und Breite haben m&ouml;chte.
	Local $aStringDimension = GetStringDimensions($hGUI, $sText) ; Gibt ein 1 Dimensionales Array zur&uuml;ck indem $aArray[0] gleich Breite und $aArray[1] gleich H&ouml;he ist.

	MsgBox($MB_SYSTEMMODAL, "String H&ouml;he und Breite", 'Die H&ouml;he und Breite des Strings "' & $sText & '" ist:' & @CRLF & _
			"Breite: " & $aStringDimension[0] & @CRLF & _
			"H&ouml;he: " & $aStringDimension[1] & @CRLF)
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

Func GetStringDimensions($hWnd, $sText)
	Local $hDC = _WinAPI_GetDC($hWnd) ; Holt den Device-Context des aktuellen Fensters
	Local $hFont = _SendMessage($hWnd, $WM_GETFONT) ; Ermittelt die Schriftart die benutzt wurde, womit das Control den Text schreibt
	Local $hSelectObject = _WinAPI_SelectObject($hDC, $hFont) ; Markiert das Objekt vom Context-Device
	Local $tSIZE = _WinAPI_GetTextExtentPoint32($hDC, $sText) ; Ermittelt die H&ouml;he und Breite des Strings.

	_WinAPI_SelectObject($hDC, $hSelectObject)
	_WinAPI_ReleaseDC($hWnd, $hDC) ; Release den Device-Context
	Local $aReturn[2] = [DllStructGetData($tSIZE, 1), DllStructGetData($tSIZE, 2)] ; Gibt die H&ouml;he und Breite als Array zur&uuml;ck
	Return $aReturn
EndFunc   ;==>GetStringDimensions

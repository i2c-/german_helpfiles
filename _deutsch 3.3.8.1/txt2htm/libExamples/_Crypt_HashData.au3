#include <Crypt.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WinAPI.au3>
#include <WindowsConstants.au3>

Global $bAlgorithm = $CALG_SHA1, $iInputEdit = -1, $iOutputEdit = -1

GUICreate("Realtime Hashing", 400, 320)
$iInputEdit = GUICtrlCreateEdit("", 0, 0, 400, 150, $ES_WANTRETURN)
$iOutputEdit = GUICtrlCreateEdit("", 0, 150, 400, 150, $ES_READONLY)
Local $iCombo = GUICtrlCreateCombo("", 0, 300, 100, 20, $CBS_DROPDOWNLIST)
GUICtrlSetData(-1, "MD2|MD4|MD5|SHA1", "SHA1")
GUIRegisterMsg($WM_COMMAND, "WM_COMMAND")
GUISetState(@SW_SHOW)

_Crypt_Startup() ; Starten der Crypt-Bibliothek.

While 1
	Switch GUIGetMsg()
		Case $GUI_EVENT_CLOSE
			Exit

		Case $iCombo ; Checkbox-Status pr&uuml;fen und aktuelle Verschl&uuml;sselungsart empfangen.
			Switch GUICtrlRead($iCombo) ; Combobox auslesen.
				Case "MD2"
					$bAlgorithm = $CALG_MD2

				Case "MD4"
					$bAlgorithm = $CALG_MD4

				Case "MD5"
					$bAlgorithm = $CALG_MD5

				Case "SHA1"
					$bAlgorithm = $CALG_SHA1

			EndSwitch

			Local $sRead = GUICtrlRead($iInputEdit)
			If StringStripWS($sRead, 8) <> "" Then ; Pr&uuml;fen ob Text f&uuml;r den Hash vorhanden ist.
				Local $bHash = _Crypt_HashData($sRead, $bAlgorithm) ; Hash aus dem gegebenen Text erzeugen.
				GUICtrlSetData($iOutputEdit, $bHash) ; Hash im Output-Edit ausgeben.
			EndIf
	EndSwitch
WEnd

_Crypt_Shutdown() ; Beenden der Crypt-Bibliothek.

Func WM_COMMAND($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $lParam

	Switch _WinAPI_LoWord($wParam)
		Case $iInputEdit
			Switch _WinAPI_HiWord($wParam)
				Case $EN_CHANGE
					Local $bHash = _Crypt_HashData(GUICtrlRead($iInputEdit), $bAlgorithm) ; Hash aus dem gegebenen Text erzeugen.
					GUICtrlSetData($iOutputEdit, $bHash) ; Hash im Output-Edit ausgeben.
			EndSwitch
	EndSwitch
EndFunc   ;==>WM_COMMAND

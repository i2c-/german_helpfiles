#include <GuiReBar.au3>
#include <WinAPI.au3>
#include <GuiConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Constants.au3>

Global $iMemo

Example()

Func Example()
	Local $hGUI, $hInput, $btn_get, $hReBar, $hInstance, $sText
	; Erstellt eine GUI
	$hGUI = GUICreate("WinAPI", 500, 300)

	; Erstellt ein Rebar-Control
	$hReBar = _GUICtrlRebar_Create($hGUI, BitOR($CCS_TOP, $WS_BORDER, $RBS_VARHEIGHT, $RBS_AUTOSIZE, $RBS_BANDBORDERS))

	; Erstellt ein mehrzeiliges Input-Control (Memo)
	$iMemo = GUICtrlCreateEdit("", 2, 55, 496, 200, BitOR($WS_VSCROLL, $WS_HSCROLL))
	GUICtrlSetFont($iMemo, 10, 400, 0, "Courier New")

	; Erstellt ein einzeiliges Input-Control
	$hInput = GUICtrlCreateInput("4220", 0, 0, 80, 20)

	; F&uuml;gt eine neue Gruppe in das Rebar-Control ein, die das Input-Control enth&auml;lt
	_GUICtrlRebar_AddBand($hReBar, GUICtrlGetHandle($hInput), 120, 200, "String-ID:")

	$btn_get = GUICtrlCreateButton("String einlesen", 0, 0, 70, 25)

	; F&uuml;gt eine neue Gruppe in das Rebar-Control ein, die den "String einlesen"-Button enth&auml;lt
	_GUICtrlRebar_AddBand($hReBar, GUICtrlGetHandle($btn_get), 120, 200)


	GUISetState(@SW_SHOW)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				Exit
			Case $btn_get
				GUICtrlSetData($iMemo, "")
				; Bindet eine ausf&uuml;hrbare Datei als Modul in den Adressraum des Skriptprozesses ein
				$hInstance = _WinAPI_LoadLibraryEx("shell32.dll", $LOAD_LIBRARY_AS_DATAFILE)
				If $hInstance Then
					; L&auml;dt eine Stringressource aus einem eingebundenen Modul
					$sText = _WinAPI_LoadString($hInstance, GUICtrlRead($hInput))
					If Not @error Then
						MemoWrite('Folgender String wurde eingelesen (' & @extended & ' Zeichen): ' & @CRLF & @CRLF & $sText)
					Else
						MemoWrite("Letzte Fehlermeldung: " & @CRLF & @CRLF & _WinAPI_GetLastErrorMessage())
					EndIf
					; Gibt das eingebundene Modul wieder frei
					MemoWrite(@CRLF & @CRLF & @CRLF & @CRLF & "Freigabe der Bibliothek erfolgreich? " & _WinAPI_FreeLibrary($hInstance))
				EndIf
		EndSwitch
	WEnd
EndFunc   ;==>Example

; Schreibt eine Nachricht in das Memo
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

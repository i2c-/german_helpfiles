#include <GuiEdit.au3>
#include <GuiConstantsEx.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $hEdit
	Local $Wow64 = ""
	If @AutoItX64 Then $Wow64 = "\Wow6432Node"
	Local $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $Wow64 & "\AutoIt v3\AutoIt", "InstallDir") & "\include\changelog.txt"

	; Erstellt eine GUI
	GUICreate("Edit: Text einf&uuml;gen", 400, 300)
	$hEdit = GUICtrlCreateEdit("", 2, 2, 394, 268, BitOR($ES_WANTRETURN, $WS_VSCROLL))
	GUISetState(@SW_SHOW)

	; R&auml;nder setzen
	_GUICtrlEdit_SetMargins($hEdit, BitOR($EC_LEFTMARGIN, $EC_RIGHTMARGIN), 10, 10)

	; Text setzen
	_GUICtrlEdit_SetText($hEdit, FileRead($sFile))

	; Text einf&uuml;gen
	_GUICtrlEdit_InsertText($hEdit, "*** Hervorragende UDFs ***" & @CRLF & @CRLF, 0)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI ausl&ouml;st
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

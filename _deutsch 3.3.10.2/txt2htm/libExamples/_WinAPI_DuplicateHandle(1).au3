#include <WinAPI.au3>

Local $hCurProcessPseudo = _WinAPI_GetCurrentProcess()
ConsoleWrite("Pseudo Handle f&uuml;r aktuellen Prozess = " & $hCurProcessPseudo & @CRLF)

Local $hCurProcess = _WinAPI_DuplicateHandle($hCurProcessPseudo, $hCurProcessPseudo, $hCurProcessPseudo, Default, True, $DUPLICATE_SAME_ACCESS)
ConsoleWrite("Richtiges Handle f&uuml;r aktuellen Prozess = " & $hCurProcess & @CRLF)

;...

; Handle nach Gebrauch schlie&szlig;en
_WinAPI_CloseHandle($hCurProcess)


#include <WinAPIShPath.au3>
#include <Array.au3>

Local $aData = _WinAPI_CommandLineToArgv('"a b" c d')
_ArrayDisplay($aData, '_WinAPI_CommandLineToArgv')

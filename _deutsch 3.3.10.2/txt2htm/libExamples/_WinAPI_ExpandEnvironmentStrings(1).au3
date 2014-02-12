#include <WinAPI.au3>
#include <MsgBoxConstants.au3>

MsgBox($MB_SYSTEMMODAL, "Umgebungsvariable", "%windir% = " & _WinAPI_ExpandEnvironmentStrings("%windir%") & @TAB & @TAB)

#include <WinAPI.au3>
MsgBox(4096, "Umgebungsvariable", "%windir% = " & _WinAPI_ExpandEnvironmentStrings("%windir%") & @TAB & @TAB)

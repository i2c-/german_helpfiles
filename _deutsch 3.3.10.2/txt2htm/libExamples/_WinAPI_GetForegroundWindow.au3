#include <WinAPI.au3>
#include <MsgBoxConstants.au3>

MsgBox($MB_SYSTEMMODAL, "Handle", "Vordergrundfenster: " & _WinAPI_GetForegroundWindow())

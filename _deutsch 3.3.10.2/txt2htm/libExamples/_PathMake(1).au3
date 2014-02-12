#include <File.au3>
#include <MsgBoxConstants.au3>

Local $TestPath = _PathMake("c:", "\temp", "boot", "ini")
MsgBox($MB_SYSTEMMODAL, "demo _PathMake", $TestPath)

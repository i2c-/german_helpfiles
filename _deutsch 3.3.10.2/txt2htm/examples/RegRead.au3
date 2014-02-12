#include <MsgBoxConstants.au3>

Local $var = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "ProgramFilesDir")
MsgBox($MB_SYSTEMMODAL, "Ordner f&uuml;r Programme:", $var)

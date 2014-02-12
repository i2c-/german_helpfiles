Local $var = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "ProgramFilesDir")
MsgBox(4096, "Ordner f&uuml;r Programme:", $var)

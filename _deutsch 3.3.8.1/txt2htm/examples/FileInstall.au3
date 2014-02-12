; Bindet ein Bitmap mit dem Dateinamen "C:\test.bmp" in das kompilierte Skript ein und legt es nach dem Starten der exe-Datei in "D:\mydir\test.bmp" ab.
Local $b = True
If $b = True Then FileInstall("C:\test.bmp", "D:\mydir\test.bmp")

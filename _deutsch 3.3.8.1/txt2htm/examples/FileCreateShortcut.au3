; Erstellt eine Verkn&uuml;pfung zu der explorer.exe auf dem Desktop und setzt ctrl+alt+t als Tastenkombination (in AutoIt ^!t)
FileCreateShortcut(@WindowsDir & "\Explorer.exe", @DesktopDir & "\Shortcut Test.lnk", @WindowsDir, "/e,c:\", "Dies ist ein Explorerlink", @SystemDir & "\shell32.dll", "^!t", "15", @SW_MINIMIZE)

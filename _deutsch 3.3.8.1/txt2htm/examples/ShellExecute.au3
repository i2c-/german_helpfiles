; Notepad &ouml;ffnen
ShellExecute("Notepad.exe")

; Eine .txt Datei mit dem Standardeditor &ouml;ffnen
ShellExecute("myfile.txt", "", @ScriptDir, "edit")

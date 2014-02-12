Run("notepad.exe")
WinWait("[CLASS:Notepad]")
$a = ControlCommand("[CLASS:Notepad]", "", "Edit1", "GetLineCount", "")
MsgBox(8256, 'Information', 'Editorfenster enth&auml;lt ' & $a & ' Textzeile.')

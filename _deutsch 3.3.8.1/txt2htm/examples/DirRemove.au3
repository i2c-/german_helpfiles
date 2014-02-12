; L&ouml;sche C:\Test1 und alle Unterordner und Dateien
Local $sFldr1 = "C:\Test1\"
Local $sFldr2 = "C:\Test1\Ordner1\"
Local $sFldr3 = "C:\Test1\Ordner1\Ordner2\"
If DirGetSize($sFldr1) = -1 Then
	DirCreate($sFldr3)
	Local $explorer = RunWait("explorer /root, C:\Test1\Ordner1")
	Local $handle = WinGetHandle($explorer)
	MsgBox(262144, "Nachricht", "Der Explorer wurde ge&ouml;ffnet. Es wurde Ordner2 dargestellt.")
	DirRemove($sFldr3, 1)
	MsgBox(262144, "Nachricht", "Der Unterordner: Ordner2 wurde gel&ouml;scht.")
	WinClose($handle)
	DirRemove($sFldr1, 1) ;Testordner wieder l&ouml;schen
Else
	MsgBox(48, $sFldr1, "Das Verzeichnis existiert bereits!")
EndIf

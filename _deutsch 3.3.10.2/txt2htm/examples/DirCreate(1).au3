#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $sFldr1 = "C:\Test1\"
	Local $sFldr2 = "C:\Test1\Folder1\"
	Local $sFldr3 = "C:\Test1\Folder1\Folder2\"

	If DirGetSize($sFldr1) <> -1 Then
		MsgBox($MB_SYSTEMMODAL, "", "Der Ordner existiert bereits!")
		Return False
	EndIf

	DirCreate($sFldr3)

	RunWait("explorer /root, C:\Test1\Folder1")
	Local $hWnd = WinGetHandle("[TITLE:Folder1;CLASS:CabinetWClass]")

	MsgBox($MB_SYSTEMMODAL, "", "Der Explorer wurde ge&ouml;ffnet. Es wurde Ordner2 dargestellt.")

	DirRemove($sFldr3, 1)
	MsgBox($MB_SYSTEMMODAL, "", "Der Unterordner: Ordner2 wurde gel&ouml;scht.")

	WinClose($hWnd)

	DirRemove($sFldr2) ;Testordner wieder l&ouml;schen
	DirRemove($sFldr1) ;Testordner wieder l&ouml;schen
EndFunc   ;==>Example

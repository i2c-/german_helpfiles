; =======================================================================
; Originalidee von w0uter, modifiziert von steve8tch
; 2008 geupdated um mit der neuen PCRE Implementation zu funktionieren
; 	Entfernt: 		Messageboxen und Splahscreens
;	Hinzugef&uuml;gt:	Statusbar f&uuml;r Anzeigen
;					Timer
; 2011 geupdated
;	Ge&auml;ndert:		Hilfebutton funktioniert jetzt auch in kompilierten Skripten
;					64Bit Handling
;					Anderer Seperator in GUICtrlSetData() wird benutzt (Idee von FichteFoll)
;					Anzeige gefixt, wenn die Ergebnisnummer aus der Ziffer 9 besteht (Dank an FichteFoll)
; =======================================================================

#include <GuiConstantsEx.au3>
#include <EditConstants.au3>
#include <WindowsConstants.au3>
#include <ButtonConstants.au3>
#include <StaticConstants.au3>
Opt("MustDeclareVars", 1)
Global Const $sSep = Chr(11) ; --> 0x0B = VT - Neuer Seperator, da der Standard "|" oft in Pattern verwendet wird!
Opt("GUIDataSeparatorChar", $sSep)
Global $sInitialDir = @ScriptDir
Global $sPatterns = "(.*)"
Global Const $iGreen = 0xAAFFD5
Global Const $iGrey = 0xD4D0C8
Global Const $iRed = 0xFF8888
Global Const $iBlack = 0x000000
Global Const $iBlue = 0x0000FF
Global Const $iSoftYellow = 0xFBFFC6
Global Const $iYellow = 0xFFFC8A
Global $hGui_StringToTest ; Enth&auml;lt den aktuell ausgew&auml;hlten Tab f&uuml;r den Inputstring, welcher getestet werden soll (z.B. von der Editbox oder der Textdatei)
; StringRegExp() gibt die Ergebnisse in 3 Formen wieder: String (rtn flag 0), Array (rtn flag 1,2,3) oder Array aus Arrays (rtn flag 4)
Global $bResultTrueFalseExpected = False
Global $bArrayOfArraysExpected = False
Global $sInitialDir ; Zum Speichern des Pfads aus der "Durchsuchen" Funktion
Global $sPatterns = readDatFile()
GUICreate("StringRegExp GUI (by w0uter, Steve8tch, FichteFoll)", 550, 596, (@DesktopWidth - 550) / 2, (@DesktopHeight - 570) / 2)
GUICtrlCreateGroup("Pattern   -  $ptn", 10, 210, 530, 60)
GUICtrlCreateGroup("Output", 140, 280, 400, 280)
GUICtrlCreateGroup("       Return Flag", 10, 280, 120, 120)
GUICtrlCreateGroup("           Start", 10, 410, 120, 50)
GUICtrlCreateGroup("@Error     @Extended", 10, 470, 120, 50)
Global $hGui_Radio_0 = GUICtrlCreateRadio("0", 60, 300, 50, 18)
Global $hGui_Radio_1 = GUICtrlCreateRadio("1", 60, 318, 50, 18)
Global $hGui_Radio_2 = GUICtrlCreateRadio("2", 60, 336, 50, 18)
Global $hGui_Radio_3 = GUICtrlCreateRadio("3", 60, 354, 50, 18)
Global $hGui_Radio_4 = GUICtrlCreateRadio("4", 60, 372, 50, 18)
GUICtrlSetState($hGui_Radio_1, $GUI_CHECKED)

Global $hGui_tab = GUICtrlCreateTab(10, 10, 530, 190)
Global $hGui_tabitem1 = GUICtrlCreateTabItem("C'n'P des zu pr&uuml;fenden Textes - $str")
Global $hGui_inputEditBox = GUICtrlCreateEdit("", 20, 40, 510, 150, BitOR($ES_WANTRETURN, $WS_VSCROLL, $WS_HSCROLL, $ES_AUTOVSCROLL, $ES_AUTOHSCROLL))
GUICtrlSetBkColor($hGui_inputEditBox, $iSoftYellow)
Global $hGui_tabitem2 = GUICtrlCreateTabItem("Text aus Datei laden")
Global $hGui_browse = GUICtrlCreateButton("Durchsuchen...", 20, 40, 100, 20)
Global $hGui_pathToInputFile = GUICtrlCreateEdit("", 130, 40, 400, 20, BitOR($ES_WANTRETURN, $WS_HSCROLL, $ES_AUTOHSCROLL))
Global $hGui_inputFromFile = GUICtrlCreateEdit("", 20, 70, 510, 120, BitOR($ES_WANTRETURN, $WS_VSCROLL, $WS_HSCROLL, $ES_AUTOVSCROLL, $ES_AUTOHSCROLL))
GUICtrlSetBkColor($hGui_inputFromFile, $iSoftYellow)
GUICtrlCreateTabItem("");
Global $hGui_Out = GUICtrlCreateEdit("", 150, 296, 380, 262, BitOR($ES_WANTRETURN, $WS_VSCROLL, $WS_HSCROLL, $ES_AUTOVSCROLL, $ES_AUTOHSCROLL))
GUICtrlSetBkColor($hGui_Out, $iSoftYellow)
Global $hGui_Pattern = GUICtrlCreateCombo("", 70, 230, 430, 30)
GUICtrlSetFont($hGui_Pattern, 14, -1, -1, "Arial")
GUICtrlSetColor($hGui_Pattern, $iBlue)
GUICtrlSetBkColor($hGui_Pattern, $iYellow)
GUICtrlSetData($hGui_Pattern, $sPatterns, "(.*)")
Global $hGui_doPtnAdd = GUICtrlCreateButton("+", 504, 225, 30, 18)
Global $hGui_doPtnDel = GUICtrlCreateButton("-", 504, 245, 30, 18)
Global $hGui_test = GUICtrlCreateButton("Test", 20, 235, 40, 20, $BS_DEFPUSHBUTTON)
Global $hGui_Offset = GUICtrlCreateInput("1", 40, 430, 60, 20)
Global $hGui_err = GUICtrlCreateInput("", 20, 490, 40, 20, $ES_READONLY)
Global $hGui_ext = GUICtrlCreateInput("", 70, 490, 50, 20, $ES_READONLY)
Global $hGui_Help = GUICtrlCreateButton("StringRegExp HILFE", 10, 530, 120, 30)
Global $hGui_timerDisplay = GUICtrlCreateLabel("Zeit (ms)", 3, 573, 142, 20, $SS_SUNKEN)
Global $hGUI_StatusBar = GUICtrlCreateLabel("Status..", 150, 573, 395, 20, $SS_SUNKEN)
$hGui_StringToTest = $hGui_inputEditBox ; default - Lesen des Strings aus der Editbox
; ToolTips:
; (GUICtrlSetTip braucht IE version 5+)
If Number(StringLeft(RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer", "Version"), 1)) > 4 Then
	GUICtrlSetTip($hGui_Radio_0, "Gibt 1 = Treffer oder 0 = kein Treffer zur&uuml;ck.", "Return Flag = 0", 1, 1)
	GUICtrlSetTip($hGui_Radio_1, "Gibt einen Array der Treffer zur&uuml;ck.", "Return Flag = 1", 1, 1)
	GUICtrlSetTip($hGui_Radio_2, "Gibt den vollen Treffer UND einen Array mit Treffern zur&uuml;ck (Perl/PHP Stil).", "Return Flag = 2", 1, 1)
	GUICtrlSetTip($hGui_Radio_3, "Gibt einen Array mit globalen Treffern zur&uuml;ck.", "Return Flag = 3", 1, 1)
	GUICtrlSetTip($hGui_Radio_4, "Gibt einen Array mit vollen UND globalen Treffern zur&uuml;ck. (Perl / PHP Stil).", "Return Flag = 4", 1, 1)
	GUICtrlSetTip($hGui_Offset, "[Optional] Die Anfangsposition (Default = 1).", "Startposition", 1, 1)
Else
	GUICtrlSetTip($hGui_Radio_0, "Gibt 1 = Treffer oder 0 = kein Treffer zur&uuml;ck.")
	GUICtrlSetTip($hGui_Radio_1, "Gibt einen Array der Treffer zur&uuml;ck.")
	GUICtrlSetTip($hGui_Radio_2, "Gibt den vollen Treffer UND einen Array mit Treffern zur&uuml;ck (Perl/PHP Stil).")
	GUICtrlSetTip($hGui_Radio_3, "Gibt einen Array mit globalen Treffern zur&uuml;ck.")
	GUICtrlSetTip($hGui_Radio_4, "Gibt einen Array mit vollen UND globalen Treffern zur&uuml;ck. (Perl / PHP Stil).")
	GUICtrlSetTip($hGui_Offset, "[Optional] Die Anfangsposition (Default = 1).", "Startposition")
EndIf

GUISetState()
While 1
	Switch GUIGetMsg()
		Case $GUI_EVENT_CLOSE
			Exit
		Case $hGui_test
			doStringRegExpTest()
		Case $hGui_browse
			doBrowseForFile()
		Case $hGui_tab
			If GUICtrlRead($hGui_tab) = 0 Then
				$hGui_StringToTest = $hGui_inputEditBox
			Else
				$hGui_StringToTest = $hGui_inputFromFile
			EndIf
		Case $hGui_doPtnAdd
			doPtnAdd(GUICtrlRead($hGui_Pattern))
		Case $hGui_doPtnDel
			doPtnDel(GUICtrlRead($hGui_Pattern))
		Case $hGui_Help
			doDisplayHelp()
		Case Else
			;;
	EndSwitch
WEnd

Func doStringRegExpTest()
	Local $aA, $aB ; Arrays
	Local $i, $j ; For-Vars f&uuml;r Arraydurchlauf
	Local $c ; Counter
	Local $hTimer, $t ; Timer
	Local $iErr, $iExt ; @error / @extended
	Local $sResult = "" ; Ergebnis
	Local $iStrLgth ; Stringl&auml;nge der Nummer der Ergebnisse.
	Local $x, $y
	GUICtrlSetData($hGui_Out, "")
	GUICtrlSetData($hGUI_StatusBar, "Bitte warten...")
	GUICtrlSetBkColor($hGUI_StatusBar, $iGreen)
	$hTimer = TimerInit()
	$aA = StringRegExp(GUICtrlRead($hGui_StringToTest), GUICtrlRead($hGui_Pattern), getReturnFlag(), getOffset())
	$iErr = @error
	$iExt = @extended
	$t = TimerDiff($hTimer)
	GUICtrlSetData($hGui_timerDisplay, $t & "  ms")
	GUICtrlSetData($hGui_err, $iErr)
	GUICtrlSetData($hGui_ext, $iExt)
	Select
		Case $iErr = 0
			GUICtrlSetData($hGUI_StatusBar, "G&uuml;ltiges Pattern. Aktualisieren...")
			GUICtrlSetBkColor($hGUI_StatusBar, $iGreen)
		Case $iErr = 1
			GUICtrlSetData($hGUI_StatusBar, "Array ist ung&uuml;ltig, keine Treffer!")
			GUICtrlSetBkColor($hGUI_StatusBar, $iRed)
		Case $iErr = 2
			GUICtrlSetData($hGUI_StatusBar, "Schechtes Pattern! Array ung&uuml;ltig! Platznummer des Errors in @extended!")
			GUICtrlSetBkColor($hGUI_StatusBar, $iRed)
	EndSelect
	If $iErr = 0 Then
		$x = UBound($aA)
		If $bArrayOfArraysExpected Then
			$y = UBound($aA[0])
			$x *= $y
		EndIf
		$iStrLgth = StringLen(String($x - 1))
		If $bArrayOfArraysExpected Then ; Ergebnisse -> Array erwartet
			$c = 0
			If UBound($aA) Then
				For $i = 0 To UBound($aA) - 1
					$aB = $aA[$i]
					For $j = 0 To UBound($aB) - 1
						$sResult &= StringFormat("%0" & $iStrLgth & "i", $c) & ' => ' & $aB[$j] & @CRLF
						$c += 1
					Next
					$sResult &= @CRLF
				Next
				GUICtrlSetData($hGui_Out, $sResult)
				GUICtrlSetData($hGUI_StatusBar, "Fertig!")
			EndIf
		ElseIf $bResultTrueFalseExpected Then ; Ergebnis -> String
			If $aA = 1 Then
				$sResult &= "1   <-- ERFOLG, Treffer gefunden!" & @CRLF
			Else
				$sResult &= "0   <-- FEHLSCHLAG, keine Treffer gefunden!" & @CRLF
			EndIf
			GUICtrlSetData($hGui_Out, $sResult)
			GUICtrlSetData($hGUI_StatusBar, "Fertig!")
		Else ; Einzel-Array
			If UBound($aA) Then
				For $i = 0 To UBound($aA) - 1
					$sResult &= StringFormat("%0" & $iStrLgth & "i", $i) & ' => ' & $aA[$i] & @CRLF
				Next
				GUICtrlSetData($hGui_Out, $sResult)
				GUICtrlSetData($hGUI_StatusBar, "Fertig!")
			EndIf
		EndIf
	EndIf
EndFunc   ;==>doStringRegExpTest
Func getReturnFlag()
	$bArrayOfArraysExpected = False
	$bResultTrueFalseExpected = False
	Switch $GUI_CHECKED
		Case GUICtrlRead($hGui_Radio_0)
			$bResultTrueFalseExpected = True
			Return 0
		Case GUICtrlRead($hGui_Radio_1)
			Return 1
		Case GUICtrlRead($hGui_Radio_2)
			Return 2
		Case GUICtrlRead($hGui_Radio_3)
			Return 3
		Case GUICtrlRead($hGui_Radio_4)
			$bArrayOfArraysExpected = True
			Return 4
	EndSwitch
EndFunc   ;==>getReturnFlag
Func getOffset()
	Local $x
	$x = Int(GUICtrlRead($hGui_Offset))
	If @error Then
		Return 1
	Else
		Return $x
	EndIf
EndFunc   ;==>getOffset
Func doBrowseForFile()
	Local $sFilePath, $sFileTxt
	$sFilePath = FileOpenDialog("&Ouml;ffnen...", $sInitialDir, "Text (*.*)", 1)
	$sInitialDir = StringTrimRight($sFilePath, StringInStr($sFilePath, "\", "-1"))
	GUICtrlSetData($hGUI_StatusBar, "Lade..")
	GUICtrlSetBkColor($hGUI_StatusBar, $iGreen)
	GUICtrlSetData($hGui_pathToInputFile, $sFilePath)
	$sFileTxt = FileRead($sFilePath)
	GUICtrlSetData($hGUI_StatusBar, "Aktualisiere...")
	GUICtrlSetData($hGui_inputFromFile, $sFileTxt)
	GUICtrlSetData($hGUI_StatusBar, "")
	GUICtrlSetBkColor($hGUI_StatusBar, $iGrey)
EndFunc   ;==>doBrowseForFile
Func readDatFile()
	Local $sDat, $sOut = ""
	Local $sHeader = "[Diese Datei nicht l&ouml;schen, Pattern unten gelistet]" & @CRLF
	Local $sDatFile = @AppDataDir & "\StringRegExpGUIPattern.dat"
	If FileExists($sDatFile) = 0 Then
		$sDat = $sHeader & "(.*)"
		FileWrite($sDatFile, $sDat)
		$sOut = "(.*)"
	Else
		$sDat = FileRead($sDatFile)
		$sDat = StringReplace($sDat, $sHeader, "") ; Header l&ouml;schen
		; @CRLF l&ouml;schen
		If StringLeft($sDat, 2) = @CRLF Then $sDat = StringTrimLeft($sDat, 2)
		If StringRight($sDat, 2) = @CRLF Then $sDat = StringTrimRight($sDat, 2)
		If $sDat <> "" Then ; Es muss >= 1 Pattern existieren!
			$sOut = StringReplace($sDat, @CRLF, $sSep)
		Else
			FileWrite($sDatFile, $sHeader & "(.*)")
			$sOut = "(.*)"
		EndIf
	EndIf
	Return $sOut
EndFunc   ;==>readDatFile
Func doPtnDel($x)
	Local $sDat
	Local $sDatFile = @AppDataDir & "\StringRegExpGUIPattern.dat"
	$sDat = FileRead($sDatFile)
	; Eintrag finden und l&ouml;schen.
	$sDat = StringReplace($sDat, $x, "")
	; Wenn $x in der Mitte der Datei war, m&uuml;ssen nun alle doppelten @CRLF gel&ouml;scht werden.
	$sDat = StringReplace($sDat, @CRLF & @CRLF, @CRLF)
	; Wenn $x am Anfang / Ende der Datei stand, so m&uuml;ssen nun alle anf&uuml;hrenden und folgenden @CRLF gel&ouml;scht werden.
	If StringLeft($sDat, 2) = @CRLF Then $sDat = StringTrimLeft($sDat, 2)
	If StringRight($sDat, 2) = @CRLF Then $sDat = StringTrimRight($sDat, 2)
	; Neue Datei erstellen.
	If FileDelete($sDatFile) Then
		FileWrite($sDatFile, $sDat)
	Else
		MsgBox(0, "***ERROR**", "L&ouml;schen eines Eintrags fehlgeschlagen!" & @CRLF & _
				"Alte Datei konnte nicht gel&ouml;scht werden!")
	EndIf
	; Neue Datei einlesen.
	$sPatterns = readDatFile()
	GUICtrlSetData($hGui_Pattern, $sSep & $sPatterns, "(.*)")
EndFunc   ;==>doPtnDel
Func doPtnAdd($x)
	Local $sDat
	Local $sDatFile = @AppDataDir & "\StringRegExpGUIPattern.dat"
	$sDat = FileRead($sDatFile)
	; Neuen Eintrag am Ende der Datei erstellen.
	$sDat &= @CRLF & $x
	; Neue Datei erstellen.
	If FileDelete($sDatFile) Then
		FileWrite($sDatFile, $sDat)
	Else
		MsgBox(0, "***ERROR**", "L&ouml;schen eines Eintrags fehlgeschlagen!" & @CRLF & _
				"Alte Datei konnte nicht gel&ouml;scht werden!")
	EndIf
	; Neue Datei einlesen.
	$sPatterns = readDatFile()
	GUICtrlSetData($hGui_Pattern, $sSep & $sPatterns, $x)
EndFunc   ;==>doPtnAdd
Func doDisplayHelp()
	Local $sPathToHelpFile
	Local $sPathToAutoIt
	Local $iErr = 0
	If @Compiled = 0 Then
		$sPathToHelpFile = StringLeft(@AutoItExe, StringInStr(@AutoItExe, "\", 0, -1))
		Run($sPathToHelpFile & "Autoit3Help.exe StringRegExp")
		If @error = 1 Then $iErr = 1
	Else
		; Hilfedatei suchen:
		If @OSArch = "X86" Then
			$sPathToAutoIt = RegRead('HKLM\Software\AutoIt v3\AutoIt', 'InstallDir')
			Run($sPathToAutoIt & "\Autoit3Help.exe StringRegExp")
			If @error Then $iErr = 1
		Else
			$sPathToAutoIt = RegRead('HKLM64\Software\AutoIt v3\AutoIt', 'InstallDir')
			If $sPathToAutoIt = "" Then
				$sPathToAutoIt = RegRead('HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\AutoIt v3\AutoIt', 'InstallDir')
				If $sPathToAutoIt = "" Then
					$iErr = 1
				EndIf
			EndIf
			If $iErr = 0 Then
				Run($sPathToAutoIt & "\Autoit3Help.exe StringRegExp")
				If @error Then $iErr = 1
			EndIf
		EndIf
	EndIf
	If $iErr = 1 Then MsgBox(0, "error", "Hilfedatei unauffindbar!")
EndFunc   ;==>doDisplayHelp

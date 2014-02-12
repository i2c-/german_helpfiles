_Example()

Func _Example()

	; Fehlerabfrage. Alle COM Errors werden aufgehalten solange sie existieren.
	; Da dieses Object als Lokal deklariert wird, ist es nicht mehr vorhanden nachdem die Funktion ausgef&uuml;hrt wurde (Return).
	Local $oErrorHandler = ObjEvent("AutoIt.Error", "_ErrFunc")

	; Erstellt ein Internet Explorer Object
	Local $oIE = ObjCreate("InternetExplorer.Application")
	; &Uuml;berpr&uuml;ft auf Fehler
	If @error Then Return

	$oIE.Visible = True ; Setzt die Sichtbarkeit auf 'True'

	; Eigenes Abfluss Object (empf&auml;ngt Events)
	Local $oIEEvents = ObjEvent($oIE, "_IEEvent_", "DWebBrowserEvents2")

	; Ruft eine Adresse ab
	$oIE.navigate("http://www.google.de/")
	; Auf Fehler &uuml;berpr&uuml;fen w&auml;hrend die Seite geladen wird
	If @error Then
		$oIE.Quit()
		Return
	EndIf

	; Warten bis die Seite fertig geladen wurde
	While 1
		If $oIE.readyState = "complete" Or $oIE.readyState = 4 Then ExitLoop
		Sleep(10)
	WEnd

	; Verursacht absichtlich einen Fehler durch Aufruf einer nicht existierenden Methode
	$oIE.PlayMeARockAndRollSong()
	; Auf Fehler &uuml;berpr&uuml;fen
	If @error Then MsgBox(48 + 262144, "COM Error", "@error wurde auf die COM Error Nummer gesetzt." & @CRLF & "@error = " & @error)

	; Wartet f&uuml;r ein paar Sekunden um eventuelle Events abzufangen
	Sleep(3000)

	; Nichts mehr zu tun. Schlie&szlig;t den IE und kehrt von der Funktion zur&uuml;ck
	$oIE.Quit()

	#forceref $oErrorHandler, $oIEEvents

EndFunc   ;==>_Example


; BeforeNavigate2 Methoden-definition
Func _IEEvent_BeforeNavigate2($IEpDisp, $IEURL, $IEFlags, $IETargetFrameName, $IEPostData, $IEHeaders, $IECancel)
	ConsoleWrite("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!--BeforeNavigate2 wurde aufgerufen--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! " & @CRLF & _
			"$IEpDisp = " & $IEpDisp() & "  -  " & ObjName($IEpDisp) & @CRLF & _ ; z.B. Standard Eigenschaft und Name des Objekts
			"$IEURL = " & $IEURL & @CRLF & _
			"$IEFlags = " & $IEFlags & @CRLF & _
			"$IETargetFrameName = " & $IETargetFrameName & @CRLF & _
			"$IEPostData = " & $IEPostData & @CRLF & _
			"$IEHeaders = " & $IEHeaders & @CRLF & _
			"$IECancel = " & $IECancel & @CRLF & _
			"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! " & @CRLF & @CRLF)
EndFunc   ;==>_IEEvent_BeforeNavigate2

; COM Error Funktion des Benutzers. Wird bei jedem COM Error aufgerufen
Func _ErrFunc($oError)
	; Macht irgendwas hier.
	ConsoleWrite("err.number ist: " & @TAB & $oError.number & @CRLF & _
			"err.windescription:" & @TAB & $oError.windescription & @CRLF & _
			"err.description ist: " & @TAB & $oError.description & @CRLF & _
			"err.source ist: " & @TAB & $oError.source & @CRLF & _
			"err.helpfile ist: " & @TAB & $oError.helpfile & @CRLF & _
			"err.helpcontext ist: " & @TAB & $oError.helpcontext & @CRLF & _
			"err.lastdllerror ist: " & @TAB & $oError.lastdllerror & @CRLF & _
			"err.scriptline ist: " & @TAB & $oError.scriptline & @CRLF & _
			"err.retcode ist: " & @TAB & $oError.retcode & @CRLF & @CRLF)
EndFunc   ;==>_ErrFunc

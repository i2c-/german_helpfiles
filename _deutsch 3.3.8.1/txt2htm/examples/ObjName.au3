Local $oInternet = ObjCreate("InternetExplorer.Application")
$oInternet.Navigate("http://www.google.com") ; &Ouml;ffnet eine Webseite, die ein Formular beinhaltet
Sleep(4000) ; Gibt der Seite Zeit zu laden

Local $oDoc = $oInternet.document ; Zu testendes Beispielobjekt
Local $oForm = $oDoc.forms(0) ; Zu testendes Beispielobjekt

MsgBox(0, "", "Interface-Name von $oInternet ist: " & ObjName($oInternet) & @CRLF & _
		"Objekt-Name von $oInternet ist:    " & ObjName($oInternet, 2) & @CRLF & _
		"Interface-Name von $oDoc ist:      " & ObjName($oDoc) & @CRLF & _
		"Objekt-Name von $oDoc ist:         " & ObjName($oDoc, 2) & @CRLF & _
		"Interface-Name von $oForm ist:     " & ObjName($oForm) & @CRLF & _
		"Objekt-Name von $oForm ist:        " & ObjName($oForm, 2))

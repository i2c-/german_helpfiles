#include <INet.au3>

Local $s_SmtpServer = "mysmtpserver.com.au"
Local $s_FromName = "Mein Name"
Local $s_FromAddress = "Absender E-Mail Adresse"
Local $s_ToAddress = "Empf&auml;nger E-Mail Adresse"
Local $s_Subject = "Meine Test UDF"
Local $as_Body[2]
$as_Body[0] = "Die neue E-Mail UDF wird getestet"
$as_Body[1] = "Zweite Zeile"
Local $Response = _INetSmtpMail($s_SmtpServer, $s_FromName, $s_FromAddress, $s_ToAddress, $s_Subject, $as_Body)
Local $err = @error
If $Response = 1 Then
	MsgBox(0, "Erfolg!", "Die E-Mail wurde versandt")
Else
	MsgBox(0, "Fehler!", "Das versenden der E-Mail schlug fehl. Fehlercode: " & $err)
EndIf

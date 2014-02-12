#include <Inet.au3>
#include <MsgBoxConstants.au3>

Local $Address = InputBox('Adresse', 'Gib die E-Mail-Adresse des Empf&auml;ngers ein:')
Local $Subject = InputBox('Betreff', 'Gib einen Betreff f&uuml;r die E-Mail ein:')
Local $Body = InputBox('Inhalt', 'Gib den Inhalt der E-Mail-Nachricht ein:')
MsgBox($MB_SYSTEMMODAL, 'Das E-Mail-Programm wurde ge&ouml;ffnet', 'Das E-Mail-Programm wurde ge&ouml;ffnet, dessen Prozess-ID lautet: ' & _INetMail($Address, $Subject, $Body))

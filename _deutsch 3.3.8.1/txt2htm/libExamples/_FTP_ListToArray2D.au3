#include <FTPEx.au3>

Local $server = 'ftp.csx.cam.ac.uk'
Local $username = ''
Local $pass = ''

Local $Open = _FTP_Open('Mein FTP-Control')
Local $Conn = _FTP_Connect($Open, $server, $username, $pass)

Local $aFile = _Ftp_ListToArray2D($Conn, 0)
ConsoleWrite('$Filename = ' & $aFile[0][0] & '  -> Fehler Code: ' & @error & @CRLF)
ConsoleWrite('$Filename = ' & $aFile[1][0] & ' Gr&ouml;&szlig;e = ' & $aFile[1][1] & @error & @CRLF)
ConsoleWrite('$Filename = ' & $aFile[2][0] & ' Gr&ouml;&szlig;e = ' & $aFile[2][1] & @CRLF)

Local $Ftpc = _FTP_Close($Open)

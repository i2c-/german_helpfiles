#include <FTPEx.au3>

Local $server = 'ftp.csx.cam.ac.uk'
Local $username = ''
Local $pass = ''

Local $Open = _FTP_Open('Mein FTP-Control')
Local $Conn = _FTP_Connect($Open, $server, $username, $pass)

Local $aFile = _Ftp_ListToArray($Conn, 2)
ConsoleWrite('$NbFound = ' & $aFile[0] & '  -> Fehler Code: ' & @error & @CRLF)
ConsoleWrite('$Filename = ' & $aFile[1] & @CRLF)

Local $Ftpc = _FTP_Close($Open)

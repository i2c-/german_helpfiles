#include <FTPEx.au3>

Local $server = 'ftp.csx.cam.ac.uk'
Local $username = ''
Local $pass = ''

Local $Open = _FTP_Open('Mein FTP-Control')
Local $Conn = _FTP_Connect($Open, $server, $username, $pass)

Local $h_Handle
Local $aFile = _FTP_FindFileFirst($Conn, "/pub/software/programming/pcre/", $h_Handle)
ConsoleWrite('$Filename = ' & $aFile[10] & ' Attribute = ' & $aFile[1] & '  -> Fehlercode: ' & @error & @CRLF)

Local $FindClose = _FTP_FindFileClose($h_Handle)

Local $Ftpc = _FTP_Close($Open)

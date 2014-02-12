#include <FTPEx.au3>

$server = 'ftp.csx.cam.ac.uk'
$username = ''
$pass = ''

$Open = _FTP_Open('Mein FTP-Control')
$Conn = _FTP_Connect($Open, $server, $username, $pass)

Local $h_Handle
$aFile = _FTP_FindFileFirst($Conn, "/pub/software/programming/pcre/", $h_Handle)
ConsoleWrite('$Filename = ' & $aFile[10] & ' Attribute = ' & $aFile[1] & '  -> Fehler Code: ' & @error & @CRLF)

$aFile = _FTP_FindFileNext($h_Handle)
ConsoleWrite('$FilenameNext1 = ' & $aFile[10] & ' Attribute = ' & $aFile[1] & '  -> Fehler Code: ' & @error & @CRLF)

$aFile = _FTP_FindFileNext($h_Handle)
ConsoleWrite('$FilenameNext2 = ' & $aFile[10] & ' Attribute = ' & $aFile[1] & '  -> Fehler Code: ' & @error & @CRLF)

$aFile = _FTP_FindFileNext($h_Handle)
ConsoleWrite('$FilenameNext3 = ' & $aFile[10] & ' Attribute = ' & $aFile[1] & '  -> Fehler Code: ' & @error & @CRLF)

$FindClose = _FTP_FindFileClose($h_Handle)
$Ftpc = _FTP_Close($Open)

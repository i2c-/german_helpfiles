#include <FTPEx.au3>

Local $sServer = 'ftp.csx.cam.ac.uk'
Local $sUsername = ''
Local $sPass = ''

Local $hOpen = _FTP_Open('MyFTP Control')
Local $hConn = _FTP_Connect($hOpen, $sServer, $sUsername, $sPass)

Local $h_Handle
Local $aFile = _FTP_FindFileFirst($hConn, "/pub/software/programming/pcre/", $h_Handle)
ConsoleWrite('$Filename = ' & $aFile[10] & ' Attribute = ' & $aFile[1] & '  -> Fehlerccode: ' & @error & @CRLF)

Local $FindClose = _FTP_FindFileClose($h_Handle)

Local $Ftpc = _FTP_Close($hConn)
Local $Ftpo = _FTP_Close($hOpen)

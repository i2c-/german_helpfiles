#include <Array.au3>
#include <File.au3>

Local $sDrive = "", $sDir = "", $sFilename = "", $sExtension = ""
Local $aPathSplit = _PathSplit(@ScriptFullPath, $szDrive, $szDir, $szFName, $szExt)
_ArrayDisplay($aPathSplit, "Demo _PathSplit()")

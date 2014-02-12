#include <MsgBoxConstants.au3>

Local $aMem = MemGetStats()
MsgBox($MB_SYSTEMMODAL, "Gesamter physikalischer RAM (KB):", $aMem[1])

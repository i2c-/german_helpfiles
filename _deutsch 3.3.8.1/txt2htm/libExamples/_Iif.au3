#include <Misc.au3>

Local $i_Count, $i_Index

For $i_Index = 1 To 2
	MsgBox(4096, "Z&auml;hler", "Dieser Dialog wird zum " & _Iif($i_Index = 1, "ersten", "") & _Iif($i_Index > 1, "zweiten", "") & "mal angezeigt.")
Next

Exit

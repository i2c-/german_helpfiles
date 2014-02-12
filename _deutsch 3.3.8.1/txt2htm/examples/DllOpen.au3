Local $dll = DllOpen("user32.dll")
Local $result = DllCall($dll, "int", "MessageBox", "hwnd", 0, "str", "Irgend ein Text", "str", "Irgend ein Titel", "int", 0)
DllClose($dll)

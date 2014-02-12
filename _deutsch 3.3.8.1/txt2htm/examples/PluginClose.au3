#ignoreFunc PluginFunc1
Local $handle = PluginOpen("example.dll")

PluginFunc1(0.1, 0.2) ; Ruft die Plugin-Funktion mit 2 Parametern auf

PluginClose($handle)

StringIsFloat("1.5") ; Gibt 1 zur&uuml;ck
StringIsFloat("7.") ; Gibt 1 zur&uuml;ck (da ein Dezimalpunkt enthalten ist)
StringIsFloat("-.0") ; Gibt 1 zur&uuml;ck
StringIsFloat("3/4") ; Gibt 0 zur&uuml;ck (da '3' durch '4' kein Gleitkommaformat ist)
StringIsFloat("2") ; Gibt 0 zur&uuml;ck (da '2' ein Integer und keine Gleitkommazahl ist)
StringIsFloat(1.5) ; Gibt 1 zur&uuml;ck (da 1.5 umgewandelt in einen String ein '.' enth&auml;lt)
StringIsFloat(1.0) ; Gibt 0 zur&uuml;ck (da 1.0 umgewandelt in einen String kein '.' enth&auml;lt)

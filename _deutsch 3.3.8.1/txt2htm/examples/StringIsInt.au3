StringIsInt("+42") ;gibt 1 zur&uuml;ck
StringIsInt("-00") ;gibt 1 zur&uuml;ck
StringIsInt("1.0") ;gibt 0 zur&uuml;ck (wegen dem Dezimalpunkt)
StringIsInt(1.0) ;gibt 1 zur&uuml;ck (wegen der Zahl-String Umwandlung)
StringIsInt("1+2") ;gibt 0 zur&uuml;ck (wegen dem Pluszeichen)

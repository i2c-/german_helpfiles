; Dieses Beispiel setzt den GPIB-Bus zur&uuml;ck, nachdem der GIPB-Bus nicht mehr reagiert. Dies kommt zwar selten vor, aber es kann passieren wen ein, an den GIPB-Bus angeschlossenes Ger&auml;t, abgest&uuml;rzt ist.

#include <Visa.au3>

_viGpibBusReset()

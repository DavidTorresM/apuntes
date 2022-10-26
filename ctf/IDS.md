# IDS snort


Snort es basado en firmas (tonto).

### Formatos de las reglas

Rule Header (Rule Options)


ACCION PROTOCOLO IP_ORIGEN PORT_ORIGEN FLUJO  IP_DESTINO PORT_DESTINO (msg: "MENSAJE"; )


ACCION => alert | log | pass | drop | reject
PROTOCOLO => TCP|UDP|ICMP|IP
IP => (|!)IP[|/\d{1,2}]
FLUJO => ->|<>


drop icmp any any -> any any (msg: "ICMP Ping Scan"; dsize:0; sid:1000020; rev: 1;)


### Técnicas de evasión
* Manipulando el protocolo
    * Usar Diferente protocolo
      * Hace alucion a envio de datos con un SNMP
      * `ncat -ulvnp 162`
    * Manipular el puerto origen
      * -g change the port number
      * `nmap -sS -Pn -g 80 -F 10.10.169.155`
    * Fragmentación de paquetes
      * Es cuando se fragmentan el payload a enviar de tal forma que no sea valido para el IDS
      * Herramienta para realizar la fragmentación
      * Nmap 
        * -f, -ff, --mtu SIZE
      * fragroute
    * Envio de paquetes invalidos
      * No es tan facil escribir una regla para un paquete no valido
      * Nmap tiene las siguientes opciones:
      * `invalid TCP/UDP checksum --badsum`
      * `invalid TCP flags --scanflags`
* Manipulando el payload 
* Manipulando ruta
* DoS







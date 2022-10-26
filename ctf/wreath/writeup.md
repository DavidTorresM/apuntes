# Enumeracion
nmap --min-rate=1000 -sCV -oN nmap.init -p- -n -v 10.200.85.0/24

nmap -p80 -sV --script=http-enum 10.200.85.200


target: 10.200.85.200
    DNS: 10.200.0.2
    Nodos de la red:
        10.200.85.1
        10.200.85.150


    Posible salto:
        10.200.85.150


        

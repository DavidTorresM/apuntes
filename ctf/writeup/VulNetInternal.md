# VulnNet Internal

## Reconocimiento 

### Escaneo de puertos
```bash
# Nmap 7.92 scan initiated Wed Jun 15 19:21:18 2022 as: nmap --min-rate=1000 -n -p- -v -oN nmap.init -sS 10.10.197.13
Nmap scan report for 10.10.197.13
Host is up (0.23s latency).
Not shown: 65522 closed tcp ports (reset)
PORT      STATE    SERVICE
22/tcp    open     ssh
111/tcp   open     rpcbind
139/tcp   open     netbios-ssn
445/tcp   open     microsoft-ds
873/tcp   open     rsync
2049/tcp  open     nfs
6379/tcp  open     redis
9090/tcp  filtered zeus-admin
37529/tcp open     unknown
37759/tcp open     unknown
41117/tcp open     unknown
50527/tcp open     unknown
50567/tcp open     unknown

Read data files from: /usr/bin/../share/nmap
# Nmap done at Wed Jun 15 19:22:28 2022 -- 1 IP address (1 host up) scanned in 69.94 seconds
```

### Escaneo de versiones y scripts

```bash
sudo nmap --min-rate=1000 -n -p22,111,139,445,873,2049,6379,9090,37529,37759,41117,50527,50567 -sCV -oN nmap.versiones -sS 10.10.197.13 
Starting Nmap 7.92 ( https://nmap.org ) at 2022-06-15 19:32 EDT
Nmap scan report for 10.10.197.13
Host is up (0.23s latency).

PORT      STATE    SERVICE     VERSION
22/tcp    open     ssh         OpenSSH 7.6p1 Ubuntu 4ubuntu0.3 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey: 
|   2048 5e:27:8f:48:ae:2f:f8:89:bb:89:13:e3:9a:fd:63:40 (RSA)
|   256 f4:fe:0b:e2:5c:88:b5:63:13:85:50:dd:d5:86:ab:bd (ECDSA)
|_  256 82:ea:48:85:f0:2a:23:7e:0e:a9:d9:14:0a:60:2f:ad (ED25519)
111/tcp   open     rpcbind     2-4 (RPC #100000)
| rpcinfo: 
|   program version    port/proto  service
|   100000  2,3,4        111/tcp   rpcbind
|   100000  2,3,4        111/udp   rpcbind
|   100000  3,4          111/tcp6  rpcbind
|   100000  3,4          111/udp6  rpcbind
|   100003  3           2049/udp   nfs
|   100003  3           2049/udp6  nfs
|   100003  3,4         2049/tcp   nfs
|   100003  3,4         2049/tcp6  nfs
|   100005  1,2,3      33554/udp   mountd
|   100005  1,2,3      39475/udp6  mountd
|   100005  1,2,3      50527/tcp   mountd
|   100005  1,2,3      58091/tcp6  mountd
|   100021  1,3,4      37759/tcp   nlockmgr
|   100021  1,3,4      41793/tcp6  nlockmgr
|   100021  1,3,4      44794/udp6  nlockmgr
|   100021  1,3,4      48902/udp   nlockmgr
|   100227  3           2049/tcp   nfs_acl
|   100227  3           2049/tcp6  nfs_acl
|   100227  3           2049/udp   nfs_acl
|_  100227  3           2049/udp6  nfs_acl
139/tcp   open     netbios-ssn Samba smbd 3.X - 4.X (workgroup: WORKGROUP)
445/tcp   open     netbios-ssn Samba smbd 4.7.6-Ubuntu (workgroup: WORKGROUP)
873/tcp   open     rsync       (protocol version 31)
2049/tcp  open     nfs_acl     3 (RPC #100227)
6379/tcp  open     redis       Redis key-value store
9090/tcp  filtered zeus-admin
37529/tcp open     java-rmi    Java RMI
37759/tcp open     nlockmgr    1-4 (RPC #100021)
41117/tcp open     mountd      1-3 (RPC #100005)
50527/tcp open     mountd      1-3 (RPC #100005)
50567/tcp open     mountd      1-3 (RPC #100005)
Service Info: Host: VULNNET-INTERNAL; OS: Linux; CPE: cpe:/o:linux:linux_kernel

Host script results:
| smb-security-mode: 
|   account_used: guest
|   authentication_level: user
|   challenge_response: supported
|_  message_signing: disabled (dangerous, but default)
|_clock-skew: mean: -40m01s, deviation: 1h09m16s, median: -2s
| smb-os-discovery: 
|   OS: Windows 6.1 (Samba 4.7.6-Ubuntu)
|   Computer name: vulnnet-internal
|   NetBIOS computer name: VULNNET-INTERNAL\x00
|   Domain name: \x00
|   FQDN: vulnnet-internal
|_  System time: 2022-06-16T01:32:52+02:00
|_nbstat: NetBIOS name: VULNNET-INTERNA, NetBIOS user: <unknown>, NetBIOS MAC: <unknown> (unknown)
| smb2-security-mode: 
|   3.1.1: 
|_    Message signing enabled but not required
| smb2-time: 
|   date: 2022-06-15T23:32:52
|_  start_date: N/A

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 31.31 seconds

```



```python
Starting enum4linux v0.9.1 ( http://labs.portcullis.co.uk/application/enum4linux/ ) on Wed Jun 15 19:29:05 2022

 =========================================( Target Information )=========================================

Target ........... 10.10.197.13
RID Range ........ 500-550,1000-1050
Username ......... ''
Password ......... ''
Known Usernames .. administrator, guest, krbtgt, domain admins, root, bin, none


 ============================( Enumerating Workgroup/Domain on 10.10.197.13 )============================


[+] Got domain/workgroup name: WORKGROUP


 ================================( Nbtstat Information for 10.10.197.13 )================================

Looking up status of 10.10.197.13
	VULNNET-INTERNA <00> -         B <ACTIVE>  Workstation Service
	VULNNET-INTERNA <03> -         B <ACTIVE>  Messenger Service
	VULNNET-INTERNA <20> -         B <ACTIVE>  File Server Service
	WORKGROUP       <00> - <GROUP> B <ACTIVE>  Domain/Workgroup Name
	WORKGROUP       <1e> - <GROUP> B <ACTIVE>  Browser Service Elections

	MAC Address = 00-00-00-00-00-00

 ===================================( Session Check on 10.10.197.13 )===================================


[+] Server 10.10.197.13 allows sessions using username '', password ''


 ================================( Getting domain SID for 10.10.197.13 )================================

Domain Name: WORKGROUP
Domain Sid: (NULL SID)

[+] Can't determine if host is part of domain or part of a workgroup


 ===================================( OS information on 10.10.197.13 )===================================


[E] Can't get OS info with smbclient


[+] Got OS info for 10.10.197.13 from srvinfo: 
	VULNNET-INTERNAWk Sv PrQ Unx NT SNT vulnnet-internal server (Samba, Ubuntu)
	platform_id     :	500
	os version      :	6.1
	server type     :	0x809a03


 =======================================( Users on 10.10.197.13 )=======================================

Use of uninitialized value $users in print at ./enum4linux.pl line 972.
Use of uninitialized value $users in pattern match (m//) at ./enum4linux.pl line 975.

Use of uninitialized value $users in print at ./enum4linux.pl line 986.
Use of uninitialized value $users in pattern match (m//) at ./enum4linux.pl line 988.

 =================================( Share Enumeration on 10.10.197.13 )=================================


	Sharename       Type      Comment
	---------       ----      -------
	print$          Disk      Printer Drivers
	shares          Disk      VulnNet Business Shares
	IPC$            IPC       IPC Service (vulnnet-internal server (Samba, Ubuntu))
Reconnecting with SMB1 for workgroup listing.

	Server               Comment
	---------            -------

	Workgroup            Master
	---------            -------
	WORKGROUP            

[+] Attempting to map shares on 10.10.197.13

//10.10.197.13/print$	Mapping: DENIED Listing: N/A Writing: N/A
//10.10.197.13/shares	Mapping: OK Listing: OK Writing: N/A

[E] Can't understand response:

NT_STATUS_OBJECT_NAME_NOT_FOUND listing \*
//10.10.197.13/IPC$	Mapping: N/A Listing: N/A Writing: N/A

 ============================( Password Policy Information for 10.10.197.13 )============================



[+] Attaching to 10.10.197.13 using a NULL share

[+] Trying protocol 139/SMB...

[+] Found domain(s):

	[+] VULNNET-INTERNAL
	[+] Builtin

[+] Password Info for Domain: VULNNET-INTERNAL

	[+] Minimum password length: 5
	[+] Password history length: None
	[+] Maximum password age: 37 days 6 hours 21 minutes 
	[+] Password Complexity Flags: 000000

		[+] Domain Refuse Password Change: 0
		[+] Domain Password Store Cleartext: 0
		[+] Domain Password Lockout Admins: 0
		[+] Domain Password No Clear Change: 0
		[+] Domain Password No Anon Change: 0
		[+] Domain Password Complex: 0

	[+] Minimum password age: None
	[+] Reset Account Lockout Counter: 30 minutes 
	[+] Locked Account Duration: 30 minutes 
	[+] Account Lockout Threshold: None
	[+] Forced Log off Time: 37 days 6 hours 21 minutes 



[+] Retieved partial password policy with rpcclient:


Password Complexity: Disabled
Minimum Password Length: 5


 =======================================( Groups on 10.10.197.13 )=======================================


[+] Getting builtin groups:


[+]  Getting builtin group memberships:


[+]  Getting local groups:


[+]  Getting local group memberships:


[+]  Getting domain groups:


[+]  Getting domain group memberships:


 ==================( Users on 10.10.197.13 via RID cycling (RIDS: 500-550,1000-1050) )==================


[I] Found new SID: 
S-1-22-1

[I] Found new SID: 
S-1-5-32

[I] Found new SID: 
S-1-5-32

[I] Found new SID: 
S-1-5-32

[I] Found new SID: 
S-1-5-32

[+] Enumerating users using SID S-1-22-1 and logon username '', password ''

S-1-22-1-1000 Unix User\sys-internal (Local User)


[+] Enumerating users using SID S-1-5-21-1569020563-4280465252-527208056 and logon username '', password ''

S-1-5-21-1569020563-4280465252-527208056-501 VULNNET-INTERNAL\nobody (Local User)
S-1-5-21-1569020563-4280465252-527208056-513 VULNNET-INTERNAL\None (Domain Group)

[+] Enumerating users using SID S-1-5-32 and logon username '', password ''

S-1-5-32-544 BUILTIN\Administrators (Local Group)
S-1-5-32-545 BUILTIN\Users (Local Group)
S-1-5-32-546 BUILTIN\Guests (Local Group)
S-1-5-32-547 BUILTIN\Power Users (Local Group)
S-1-5-32-548 BUILTIN\Account Operators (Local Group)
S-1-5-32-549 BUILTIN\Server Operators (Local Group)
S-1-5-32-550 BUILTIN\Print Operators (Local Group)

 ===============================( Getting printer info for 10.10.197.13 )===============================

No printers returned.


enum4linux complete on Wed Jun 15 19:45:47 2022
```

## Revisando SMB

### Descargando SMB de shares recursivamente 
```bash
smbget -R smb://10.10.197.13/shares/ -U ''
```

## Revisando NFS

mostrando la información de la montura NFS
```bash
    showmount -e 10.10.197.13
    #Haciendo carpeta de montura
    sudo mkdir /mnt/montura
    #Montando
    sudo mount -t nfs 10.10.197.13:/opt/conf /mnt/montura
```
Credenciales en archivo *redis.conf* **B65Hx562F@ggAZ@F**

Enumerando el redis encontre:

![RedisEnum](/assets/RedisEnum.PNG)

Decodificando el b64 tenia el contenido:
    Authorization for rsync://rsync-connect@127.0.0.1 with password **Hcg3HP67@TW@Bc72v**







GET "authlist"
GET "int"
GET "marketlist"
GET "tmp"
GET "internal flag"








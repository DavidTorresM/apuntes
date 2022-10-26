
Usuarios 
    root:x:0:0:root:/root:/bin/bash
    alex:x:1000:1000:alex,,,:/home/alex:/bin/bash
    dave:x:1001:1001:,,,:/home/dave:/bin/bash

╔══════════╣ Interfaces
# symbolic names for networks, see networks(5) for more information
link-local 169.254.0.0
ens192    Link encap:Ethernet  HWaddr 00:50:56:b9:d4:7f  
          inet addr:10.10.10.109  Bcast:10.10.10.255  Mask:255.255.255.0
          inet6 addr: dead:beef::250:56ff:feb9:d47f/64 Scope:Global
          inet6 addr: fe80::250:56ff:feb9:d47f/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:548723 errors:0 dropped:0 overruns:0 frame:0
          TX packets:429023 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:101404476 (101.4 MB)  TX bytes:105059768 (105.0 MB)

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:11739 errors:0 dropped:0 overruns:0 frame:0
          TX packets:11739 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:912768 (912.7 KB)  TX bytes:912768 (912.7 KB)

virbr0    Link encap:Ethernet  HWaddr fe:54:00:17:ab:49  
          inet addr:192.168.122.1  Bcast:192.168.122.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:38 errors:0 dropped:0 overruns:0 frame:0
          TX packets:12 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:2520 (2.5 KB)  TX bytes:976 (976.0 B)

vnet0     Link encap:Ethernet  HWaddr fe:54:00:3a:3b:d5  
          inet6 addr: fe80::fc54:ff:fe3a:3bd5/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:10 errors:0 dropped:0 overruns:0 frame:0
          TX packets:953 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:828 (828.0 B)  TX bytes:52495 (52.4 KB)

vnet1     Link encap:Ethernet  HWaddr fe:54:00:e1:74:41  
          inet6 addr: fe80::fc54:ff:fee1:7441/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:8 errors:0 dropped:0 overruns:0 frame:0
          TX packets:954 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:648 (648.0 B)  TX bytes:52588 (52.5 KB)

vnet2     Link encap:Ethernet  HWaddr fe:54:00:17:ab:49  
          inet6 addr: fe80::fc54:ff:fe17:ab49/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:12 errors:0 dropped:0 overruns:0 frame:0
          TX packets:956 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:928 (928.0 B)  TX bytes:52774 (52.7 KB)

vnet3     Link encap:Ethernet  HWaddr fe:54:00:c6:70:66  
          inet6 addr: fe80::fc54:ff:fec6:7066/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:8 errors:0 dropped:0 overruns:0 frame:0
          TX packets:950 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:648 (648.0 B)  TX bytes:52380 (52.3 KB)

╔══════════╣ Active Ports
╚ https://book.hacktricks.xyz/linux-hardening/privilege-escalation#open-ports
tcp        0      0 127.0.0.1:5902          0.0.0.0:*               LISTEN      -               
tcp        0      0 192.168.122.1:53        0.0.0.0:*               LISTEN      -               
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      -               
tcp        0      0 127.0.0.1:5900          0.0.0.0:*               LISTEN      -               
tcp        0      0 127.0.0.1:5901          0.0.0.0:*               LISTEN      -               
tcp6       0      0 :::80                   :::*                    LISTEN      -               
tcp6       0      0 :::22                   :::*                   LISTEN      -               




/home/alex/Desktop/.root.txt.swp

Internal networks


DNS + Configurator - 192.168.122.4 =)
Firewall - 192.168.122.5            =!
The Vault - x                       =!


    HOST UP 192.168.122.4 PORT 22 =)
    HOST UP 192.168.122.4 PORT 80 =)
    
    Desde el DNS 192.168.122.4 al 192.168.5.1

## Pendiente 
    Pivoteo de 192.168.122.4 al 192.168.5.1












-H "Content-Type: application/x-www-form-urlencoded" 
  
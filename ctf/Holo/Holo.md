## Holo
Maquinas:
    10.200.107.30
    10.200.107.33
    192.168.100.100

# Ping scan 
```bash
for i in {1..254}; do
ip=10.200.107.${i}
((timeout 0.25 bash -c "ping -c 1 ${ip} 2>/dev/null" &> /dev/null && echo UP machine $ip)&)
done;
```

# Scaneo de puertos inicial

```bash
sudo nmap --min-rate=1000 -n -p- -oN nmap.init -v -sS -iL ips.init
```

```bash
nmap  -n --min-rate=1000 -sCV -p- -v 10.200.114.0/24
```













How many machines are there?
    4 machines 1 gw
What ports are open on pc1.ine.local machine?
    80, 443, 3306
    http y mysql
What OS is running on machine pc1.ine.local machine?
    Linux
What services are running on pc2.ine.local machine?
    mongod
What is the version of the FTP server running on one of the machines?
    pc3 vsftpd 3.0.3

A caching server is also running on one of the machines. What is the domain name of that machine?
    192.11.197.5 memcache => pc3.ine.local

A NoSQL database and SQL database services are running on different machines. Can we use Nmap scripts to extract some information from those?
    192.11.197.4 mongod => pc2.ine.local
    192.11.197.3 mysql  => pc1.ine.local
    



10.1.0.4/16 eth0

192.11.197.2/24 eth1


HOST UP 
    192.11.197.1
    192.11.197.3
    192.11.197.4
    192.11.197.5
    192.11.197.6


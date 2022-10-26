## Info
### Permisos 

    Domain Controllers - All domain controllers in the domain
    Domain Guests - All domain guests
    Domain Users - All domain users
    Domain Computers - All workstations and servers joined to the domain
    Domain Admins - Designated administrators of the domain
    Enterprise Admins - Designated administrators of the enterprise
    Schema Admins - Designated administrators of the schema
    DNS Admins - DNS Administrators Group
    DNS Update Proxy - DNS clients who are permitted to perform dynamic updates on behalf of some other clients (such as DHCP servers).
    Allowed RODC Password Replication Group - Members in this group can have their passwords replicated to all read-only domain controllers in the domain
    Group Policy Creator Owners - Members in this group can modify group policy for the domain
    Denied RODC Password Replication Group - Members in this group cannot have their passwords replicated to any read-only domain controllers in the domain
    Protected Users - Members of this group are afforded additional protections against authentication security threats. See http://go.microsoft.com/fwlink/?LinkId=298939 for more information.
    Cert Publishers - Members of this group are permitted to publish certificates to the directory
    Read-Only Domain Controllers - Members of this group are Read-Only Domain Controllers in the domain
    Enterprise Read-Only Domain Controllers - Members of this group are Read-Only Domain Controllers in the enterprise
    Key Admins - Members of this group can perform administrative actions on key objects within the domain.
    Enterprise Key Admins - Members of this group can perform administrative actions on key objects within the forest.
    Cloneable Domain Controllers - Members of this group that are domain controllers may be cloned.
    RAS and IAS Servers - Servers in this group can access remote access properties of users

### Servicios de dominio 

    * LDAP - Lightweight Directory Access Protocol; provides communication between applications and directory services
    * Certificate Services - allows the domain controller to create, validate, and revoke public key certificates
    * DNS, LLMNR, NBT-NS - Domain Name Services for identifying IP hostnames

### Autenticación 
    * NTLM
    * Kerberos

### Active directory
## Conceptos para familiarizarnos

    * Domain Controllers
    * Organizational Units
    * AD objects
    * AD Domains
    * Forest
    * AD Service Accounts: Built-in local users, Domain users, Managed service accounts
    * Domain Administrators


![c982e300552d540f0fc456cc05be21cd](/assets/c982e300552d540f0fc456cc05be21cd.png)

![bb4bec81a78f745e8cbc38f7879002dd](/assets/bb4bec81a78f745e8cbc38f7879002dd.png)

## Enumeración

**LDAP** Es una estrcutura jerarquica de como esta organizada la información.

Sidtingued Name (DN):
    Es una coleccion de datos separados por comas en forma de  *key* y *value*
    Ejemplo de DN:

        "CN=User1,CN=Users,DC=thmredteam,DC=com"

    Donde cada DN se compone de:
        Domain Component (DC)
        OrganizationalUnitName (OU)
        Common Name (CN)
        
![764c72d40ec3d823b05d6473702e00f5](/assets/764c72d40ec3d823b05d6473702e00f5.png)
        











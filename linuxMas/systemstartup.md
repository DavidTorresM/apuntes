- [Inicio de sistema](#inicio-de-sistema)
  - [Systemd](#systemd)
- [Unidades de archivos](#unidades-de-archivos)
  - [Boot targets](#boot-targets)
  - [COmandos](#comandos)
  - [Manual de systemd configuration](#manual-de-systemd-configuration)
- [Comandos intersantes](#comandos-intersantes)
  - [mask](#mask)
  - [is-system-running](#is-system-running)
  - [SystemV init](#systemv-init)
    - [Niveles ejecucion de sistemas Red Hat](#niveles-ejecucion-de-sistemas-red-hat)
    - [Niveles ejecución distribuciones Debian](#niveles-ejecución-distribuciones-debian)
    - [Directorios en SysV](#directorios-en-sysv)
    - [Comandos](#comandos-1)
      - [Muestra el nivel de ejecución actual](#muestra-el-nivel-de-ejecución-actual)
      - [Inicia un nivel de ejecución](#inicia-un-nivel-de-ejecución)
      - [Lanzar comando de run level](#lanzar-comando-de-run-level)
      - [Actualizar y configurar los runlevels](#actualizar-y-configurar-los-runlevels)
        - [red hat](#red-hat)
        - [Debian](#debian)

## Inicio de sistema 


Comandos utiles 

Donde esta el binario
which COMANDO

Sigue los links simbolicos
readlink -f BINARIO


### Systemd 

## Unidades de archivos 


Listar unidades systemd

 systemctl list-units

### Boot targets 

graphical.target => GUI
multi-user.target => Multiusuario via terminal
network-online.target => Despues de tener conexion a internet
runleveln.target => Compatibilidad con sysV runlevel 1-5

Ver unidades de archivos
    systemctl list-unit-files

### COmandos 

systemctl -t help
systemctl list-unit-files
systemctl list-units
systemctl enable name.service
systemctl start name.service
systemctl disable name.service
systemctl stop name.service
systemctl status name.service
systemctl is-failed name.service
systemctl is-active name.service



systemctl cat name.service
systemctl show
systemctl edit name.service
systemctl daemon-reload

### Manual de systemd configuration

man systemd-system.conf

## Comandos intersantes
### mask 
`systemctl mask service`

Sirve para no poder iniciar un servicio, no se inicia ni hay reboot.
Hace un link de **/etc/systemd/system** -> **/dev/null**

### is-system-running 
`systemctl is-system-running`

### SystemV init

Es otro sistema de arranque para sistemas linux.
Este sistema de arranque es un sistema legacy.

Los niveles de ejecución del sistema varian deacuerdo al sistema operativo que se este utilizando.


#### Niveles ejecucion de sistemas Red Hat

| Runlevel | Descripcion |
| ----------- | ----------- |
| 0 | Apagado del sistema  |
| 1 | Multi usuario para mantenimiento de sistema  |
| 2 | Multi usuario sin servicios de red  |
| 3 | Multi usuario con servicios de red |
| 4 | Normal |
| 5 | Multi usuario con GUI |
| 6 | Reboot the system |


#### Niveles ejecución distribuciones Debian

| Runlevel | Descripcion |
| ----------- | ----------- |
| 0 | Apagado del sistema |
| 1 | Modo un usuario |
| 2 | Multi usuario con GUI disponible |
| 6 | Reinicio del sistema |

#### Directorios en SysV

Los runlevels estan en el directorio **/etc/rc.d/rcN.d/**
Donde N 0-6 segun la distribución.


Los archivos dentro de **/etc/rc.d/rcN.d/** Son links a **/etc/init.d/**, 
tienen la siguiente nomenclatura:

    (S|K)\d+NOMBRE
    
        S Se inicia cuando el run level esta arrancando 
        K Detener cuando el run level se arranca 
        \d Es el orden de la ejecución de sysV

El Archivo **/etc/rc.local** se utiliza para lanzar scripts justo cuando  inicia el sistema.


#### Comandos 
##### Muestra el nivel de ejecución actual
runlevel 
##### Inicia un nivel de ejecución
init RUNLEVEL 
telinit RUNLEVEL
##### Lanzar comando de run level 

`service SERVICIO_SCRIPT COMANDO`

SERVICIO_SCRIPT scripts dentro de **/etc/init.d/** 
COMMAND Comando a lanzar 

*   restart
*   start
*   status
*   stop 
*   reload
*   --status-all

##### Actualizar y configurar los runlevels

###### red hat

`chkconfig`

* chkconfig **service**
  * Muestra si el servicio esta habilitado en el runlevel actual. 
  * Responde en la variable **$?** 0 =) y 1 =(
* chkconfig **service** on
  * Enciende el servicio en el runlevel 1-5
* chkconfig **service** off
  * Deshabilita el servicio en el runlevel actual
* chkconfig --add **service**
  * Agregas los servicios al nivel 0-6
* chkconfig --del **service**
  * Borra los servicios al nivel 0-6
* chkconfig --level [levels] **service** 
  * Agrega el servicio a los niveles especificados
* chkconfig --list **service**
  * Muestra los runniveles donde el servicio esta habilitado


###### Debian

`update-rc.d`




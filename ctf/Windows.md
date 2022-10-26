# Windows procesos 
## Fuentes de informacion

    https://www.threathunting.se/tag/windows-process/
    https://www.sans.org/security-resources/posters/hunt-evil/165/download
    https://docs.microsoft.com/en-us/sysinternals/resources/windows-internals


Ejecuta al proceso system ntoskrnl.exe PID 4
    Es el binario correspondiente al kernel del SO.


## smss.exe
    Session manager, Maneja las sessiones del proceso.

    Inicia el modo kernel y usuario de los subsistemas windows (Win NT)

    Windows Nt incluye win32k.sys (kernel) y winsrv.dll (user) y csrss.exe (user)

### Proceso de inciación
Session manager subsystem (SMSS) (smss.exe) => Ejecutado por el proceso de inicio.
    
    1. Crea variables de entorno
    2. Inicia el kernel en modo usuario de win32. 
       1. win32k.sys (kernel-mode)
       2. winsrv.dll (user-mode)
       3. csrss.exe (user-mode)
    3. Inicia los subsistemas del registro 
       1. HKLM\System\CurrentControlSet\Control\Session Manager\SubSystems
    4. Inicializa los mapeos de dispocitivos.
       1. HKLM\System\CurrentControlSet\Control\Session Manager\DOS Devices
    5. Crea la memoria virtual y archivos de paginación
    6. inicia winlogon.exe (Manejador de login de windows)

El Local Session Manager Service(lsm.exe) envia peticiones al SMSS por medio de un asyncrhronous Local Inter-Process Communication(ALPC)


## csrss.exe (Client Server Runtime Process) Modo usuario

Responsabe de Win32 console y el hilo de borrado y creación de procesos.

    csrsrv.dll
    basesrv.dll
    winsrv.dll


Hace la windows API disponibles a otros procesos.
Mapea las letras de los dispocitivos.

## Windows Initialization Process (wininit.exe)


    Lanza los servicios services.exe (Service Control Manager), lsass.exe (Local Security Authority) y
    lsaiso.exe (Credential Guard and Key Guard solo si Credential Guard esta habilitado) **Session 0**


## Service control manager (SCM)

    Ejecutable: services.exe
    Descripción: Maneja los servicios del sistema. Se pueden enviar comando mediante sc.exe (Borrarlo termina con la pantalla azul de muerte).
    Mapeo en el registro: HKLM\System\Select\LastKnownGood
    No normal:
        A parent process other than wininit.exe
        Image file path other than C:\Windows\System32
        Subtle misspellings to hide rogue process in plain sight
        Multiple running instances
        Not running as SYSTEM


## Service Host (svchost.exe)

    Ejecutable: svchost.exe
    Descripción: Hostea y maneja los servicios de windows. los servicios a ejecutar se ejecutan como archivos dll.
    Mapeo en el registro: HKLM\SYSTEM\CurrentControlSet\Services\SERVICE NAME\Parameters
    No normal:
        A parent process other than services.exe
        Image file path other than C:\Windows\System32
        Subtle misspellings to hide rogue process in plain sight
        The absence of the -k parameter

## Local Security Authority Subsystem Service (LSASS)

    Ejecutable: lsass.exe
    Descripción: Hace cumplir las politicas de seguridad del sistema. Verifica los log del usuario, maneja los cambios de passwords, crea tokens de aceso, escribe el log de windows security.
    Se utiliza minikaz para volcar credenciales en el proceso. Crea los tokens SAM (Security Account Manager), AD (Active Directory) y NETLOGON.
    Mapeo en el registro: HKLM\System\CurrentControlSet\Control\Lsa
    No normal:


## Windows Logon 

    Ejecutable: winlogon.exe
    Descripción: Maneja la secuencia de atención segura (SAS), Carga el perfil del usuario del archivo NTUSER.DAT en HKCU y carga el shell con el ejecutable userinit.exe.
    Mapeo en el registro: HKLM\System\CurrentControlSet\Control\Lsa
    No normal:
        An actual parent process. (smss.exe calls this process and self-terminates)
        Image file path other than C:\Windows\System32
        Subtle misspellings to hide rogue process in plain sight
        Not running as SYSTEM
        Shell value in the registry other than explorer.exe

## Explorador de windows 

    Ejecutable: explorer.exe
    Descripción: Da accceso al usuario y sus carpetas y archivos. Funcionalidad a otras opciones como el menu de inicio, la barra de tareas.
    Mapeo en el registro: 
    No normal: 
        An actual parent process. (userinit.exe calls this process and exits)
        Image file path other than C:\Windows
        Running as an unknown user
        Subtle misspellings to hide rogue process in plain sight
        Outbound TCP/IP connections








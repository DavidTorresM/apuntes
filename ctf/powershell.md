# Powershell

Ver versión
```powershell
$PSVersionTable
```
## Ayuda en el power shell

Informacion general 

    Get-Help
    Get-Help Comando 
    Get-Help Comando -Full
    Get-Help Comando -Examples
    Get-Help -Category CATEGORIA

Categorias de la ayuda

    Alias
    Cmdlet
    Funcion
    Provider
    Workflow
    HelpFile

## Actualizar la documentacion de comandos

    Update-Help
    Update-Help -SourcePath \\OrigenDatos

## Mover la documentacion 

    Save-help -DestinationPath D:\MAMADAS_PowershellHelp
    
## Información de comandos
    get-command -parametername computername
    Show-Command #Muestra comandos de forma grafica

## Tareas administrativas basicas 

### Default powershell providers 

Son programas en .NET que acceden a almacenamientos de datos especializados.
Ejemplo:

    Dell provider
    Sql provider 

### Powershell Drive 

Son localizaciones de datos a donde puedes acceder.
    Sistema de archivos
    Registro
    Certificados
Se pueden hacer sus propios Powershell drivers.

#### Default powershell son:

    Alias
    C (Discos extraibles)
    Cert
    Env
    Function
    HKCU
    HKLM
    Variable
    WSMan

### Hacer un nuevo ps drive

    New-PSDrive -Name S -PSProvider FileSystem -Root \\Server01\Share

### Remove a PSDrive
    Remove-PSDrive -Name S

## Busquedas en el sistema de archivos

### Intro a los Item Cmdlets

Son scripts ligeros de Windows PowerShell que realizan una sola función.
Se componene de Verbos-Adjetivos -NombreParametro ValorParametro.

    Get
    Pop
    Push
    Set

### Ejemplo. Archivos
```powershell
Set-Location -Path C:\Posh
New-Item -Name archivo.txt -ItemType File -Value "holaaaaa"
Add-Content -Path .\archivo.txt -Value " mas datos...."
Get-Content .\archivo.txt

```
### Listar informacion el directorio actual
```powershell
ls
dir
Get-ChildItem
#Movernos al provedor de registro HKLM: 
cd HKLM:\SOFTWARE\Microsoft
#creamos el item (En este directorio crea una carpeta)
new-item -name test
# Crear la propiedad
New-ItemProperty -Path .\ -Name TestString -value "mamadas" -Type String 
# borrar propiedad
Remove-Item .\test
```







    






























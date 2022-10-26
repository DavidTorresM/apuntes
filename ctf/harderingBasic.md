# Hardering Basics Part 1 

### Agregar usarios a root 
Cuando se agregan usaurios a root estos podran ejecutar comandos como root con la contraseña de su usuario actual.
#### Agregarlo cuando el usuario ya este creado 
usermod -aG sudo user
#### Agregarlo al momento de la creación
useradd -G sudo user
### Verificar usuarios que estan en el grupo 
#### Muestra comandos que puede ejecutar el usuario
sudo -l
#### Viendo el archivo de politicas de sudo (sudoers)
visudo
#### Politicas importantes 
**%sudo ALL=(ALL:ALL) ALL NOPASSWD: ALL**

### Agregar usarios a root Metodo 2
Editando el sudoers.
Para un grupo de usuarios 
```bash
User_Alias      ADMINS = user1, user2, ashu
                ADMINS ALL=(ALL) ALL
```

Para un usuario

```bash 
user        ALL=(ALL) ALL
```








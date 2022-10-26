## Bandera 
cp,mv
    -u actualiza
    -n no sobreescribe preeexistentes
    -i Modo interactivo de sobrescritura

ls 
    -R Re

rm
    -d remueve directorios vacios

# Respaldos  1GB 
rsync -avP -e ssh file1Gb.txt server@192.168.0.14~



# ver archivos simultaneos
pr -mtw 10 archivo1 archivo2
m = merge
t = quita el header
w = separacion


# find

-cmin Cambio de estado en ultimos minutos
-mmin Cambio de datos en los ultimos minutos
-size Tamanio de los archivos 
-perm /40000 Busca por SUID permiso 


# grep
-c Conteo de caracteres que machearon pero **por linea**
-v Negacion de los caracteres del filtro

# 






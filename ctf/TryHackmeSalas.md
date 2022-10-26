# Salas de try hack me 

## Network Services 

### SMTP (Simple Mail Trasfer protocol)

Servicio de envio de correos.
Se utiliza con otros protocolos mas:

    1. POP/IMAP (Recuperación de correo electronico)
    2. 
    
Funciones de SMTP:

    1. Verificar quien envia correos atravez del servidor.
    2. Enviar correo saliente.
    3. Notificar si el correo no se puede enviar

SMTP hace la entrega de mensajes, cuando se envia un mensaje este se agrega al servidor SMTP del destinatario y posteriormente es leido por el servicio POP3 o IMAP.


El primer paso de SMTP es el hadshake entre los servidores SMTP. 
Mensajes que no pueden ser enviados se agregan a la **smtp queue**.



#### POP/IMAP (Protocolo de oficina postal y Protocolo de acceso a mensajes de internet)

POP descarga la bandeja de entrada del server de correo al cliente.
IMAP sincroniza la bandeja de entrada al cliente actual.

POP => tu sincronizas
IMAP => El protocolo sincroniza










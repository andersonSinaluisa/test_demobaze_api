Los resultados de ejecuciones de las pruebas de la API demoblaze son los siguientes:

### 1. Crear un nuevo usuario en signup:

Código de estado: 200 (Esperado: 200)
Tiempo de respuesta: 12,221 milisegundos
URL: https://api.demoblaze.com/signup
Respuesta: ""
Conclusiones:

La prueba se ejecuto con exito. Indica que esta funcionando correctamente
El tiempo de respuesta es significativamente alto, lo que podría indicar un problema de rendimiento en el servicio.

## 2. Intentar crear un usuario ya existente:

Código de estado: 200 (Esperado: 200)
Tiempo de respuesta: 961 milisegundos
URL: https://api.demoblaze.com/signup
Respuesta: {"errorMessage":"This user already exist."}
Conclusiones:

La prueba se ejecutó con exito. Esto indica que la validación para evitar la creación de usuarios ya existentes funciona.


### 3. Usuario y contraseña correctos en login:

Respuesta: "Auth_token: YW5kZXJzb24yMTY5NDIxNg=="
URL: https://api.demoblaze.com/login
Conclusiones:

La prueba se realizo con exito 
El valor de Auth_token en la respuesta es una cadena.



### 4. Usuario y contraseña incorrectos en login:

Código de estado: 200 (Esperado: 200)
Tiempo de respuesta: 756 milisegundos
URL: https://api.demoblaze.com/login
Respuesta: {"errorMessage":"Wrong password."}
Conclusiones:

La prueba falló debido al código de estado incorrecto (debería ser 401 en lugar de 200). 
Esto indica que la validación de las credenciales estan funcionando sin embargo el status code no está establecido correctamente.

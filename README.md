# SuitEtecsaSdk
## Descripción
`SuitEtecsaSdk` es una librería desarrollada en Swift, diseñada para facilitar la interacción con los servicios de la empresa de telecomunicaciones [ETECSA](https://www.etecsa.cu/).

## Características
- **Scraping Avanzado**: Utiliza técnicas de scraping para acceder eficientemente a los portales de [acceso a internet](https://secure.etecsa.net:8443/) y de [usuario de Nauta](https://www.portal.nauta.cu/).
- **Integración con API de Nauta**: Permite la interacción con el [portal Nauta](https://www.nauta.cu/) a través de su API, proporcionando un cliente robusto y fácil de usar.
     
## Instalación
Importa `SuitEtecsaSdk` en tu proyecto

```swift
dependencies: [
    .package(url: "https://github.com/suitetecsa/sdk-swift/.git", from: "1.0.0-alpha01")
]
```
## Uso

Conéctate a internet desde la wifi o Nauta Hogar

```swift
switch await ConnectApi.connect(username: "user.name@nauta.com.cu", password: "somePassword") {
case .failure(_): print("Hubo un error")
case .success(let dataSession): print(dataSession)
}
```

Obtén el tiempo restante de la cuenta (solo puede hacerse cuando hay una conexión abierta y se poseen los datos de la sesión).

```swift
switch await ConnectApi.getLeftTime(dataSession) {
case .failure(_): print("Hubo un error")
case .success(let time): print(time)
}
```

Desconéctate de internet

```swift
switch await ConnectApi.disconnect(dataSession) {
case .failure(_): print("Hubo un error")
case .success(_): print("Sesión cerrada!")
}
```

Obtén la información de la cuenta

```swift
switch await ConnectApi.getInfo(username: "user.name@nauta.com.cu", password: "somePassword") {
case .failure(_): print("Hubo un error")
case .success(let accountInfo): print(accountInfo)
}
```

Obten la informacion necesaria para iniciar sesion en el portal Nauta

```swift
switch await NautaAuthApi.getCaptcha() {
case .failure(_): print("Hubo un error")
case .success(let cresp):
print(cresp.idRequest)
print(cresp.data)
}
```

Inicia sesion en el portal Nauta

```swift
switch await NautaAuthApi.login(
  username: "+5350000000", password: "somePassword", captchaCode: "CAPTCHACODE",
  idRequest: cresp.idRequest)
{
case .failure(let err): throw err
case .success(let lresp): print(lresp)
}
```

## Contribución

¡Gracias por tu interés en colaborar con nuestro proyecto! Nos encanta recibir contribuciones de la comunidad y valoramos mucho tu tiempo y esfuerzo.

### Cómo contribuir

Si estás interesado en contribuir, por favor sigue los siguientes pasos:

1. Revisa las issues abiertas para ver si hay alguna tarea en la que puedas ayudar.
2. Si no encuentras ninguna issue que te interese, por favor abre una nueva issue explicando el problema o la funcionalidad que te gustaría implementar. Asegúrate de incluir toda la información necesaria para que otros puedan entender el problema o la funcionalidad que estás proponiendo.
3. Si ya tienes una issue asignada o si has decidido trabajar en una tarea existente, por favor crea un fork del repositorio y trabaja en una nueva rama (`git checkout -b nombre-de-mi-rama`).
4. Cuando hayas terminado de trabajar en la tarea, crea un pull request explicando los cambios que has realizado y asegurándote de que el código cumple con nuestras directrices de estilo y calidad.
5. Espera a que uno de nuestros colaboradores revise el pull request y lo apruebe o sugiera cambios adicionales.

### Directrices de contribución

Por favor, asegúrate de seguir nuestras directrices de contribución para que podamos revisar y aprobar tus cambios de manera efectiva:

- Sigue los estándares de codificación y estilo de nuestro proyecto.
- Asegúrate de que el código nuevo esté cubierto por pruebas unitarias.
- Documenta cualquier cambio que hagas en la documentación del proyecto.

¡Gracias de nuevo por tu interés en contribuir! Si tienes alguna pregunta o necesitas ayuda, no dudes en ponerte en contacto con nosotros en la sección de issues o enviándonos un mensaje directo.

## Licencia

Este proyecto está licenciado bajo la Licencia MIT. Esto significa que tienes permiso para utilizar, copiar, modificar, fusionar, publicar, distribuir, sublicenciar y/o vender copias del software, y para permitir que las personas a las que se les proporcione el software lo hagan, con sujeción a las siguientes condiciones:

- Se debe incluir una copia de la licencia en todas las copias o partes sustanciales del software.
- El software se proporciona "tal cual", sin garantía de ningún tipo, expresa o implícita, incluyendo pero no limitado a garantías de comerciabilidad, aptitud para un propósito particular y no infracción. En ningún caso los autores o titulares de la licencia serán responsables de cualquier reclamo, daño u otra responsabilidad, ya sea en una acción de contrato, agravio o de otra manera, que surja de, fuera de o en conexión con el software o el uso u otros tratos en el software.

Puedes encontrar una copia completa de la Licencia MIT en el archivo LICENSE que se incluye en este repositorio.

## Contacto

Si tienes alguna pregunta o comentario sobre el proyecto, no dudes en ponerte en contacto conmigo a través de los siguientes medios:

- Correo electrónico: [lesclaz95@gmail.com](mailto:lesclaz95@gmail.com)
- Twitter: [@lesclaz](https://twitter.com/lesclaz)
- Telegram: [@lesclaz](https://t.me/lesclaz)

Estaré encantado de escuchar tus comentarios y responder tus preguntas. ¡Gracias por tu interés en mi proyecto!

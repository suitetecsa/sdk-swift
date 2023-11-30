# SuitEtecsaSdk
Una librería para SuitETECSA escrita en Swift

`SuitEtecsaSdk` es una herramienta diseñada para interactuar con los servicios de [ETECSA](https://www.etecsa.cu/). La librería utiliza técnicas de scraping para acceder a los portales de [acceso a internet](https://secure.etecsa.net:8443/) y de [usuario](https://www.portal.nauta.cu/) de Nauta.
Por ahora, solo hay soporte para el portal cautivo ([el portal de acceso a internet](https://secure.etecsa.net:8443/)); poco a poco se irá añadiendo la interacción con más portales, como: [el portal de usuario](https://www.portal.nauta.cu/) de Nauta, [el portal Nauta](https://www.nauta.cu/) y [el portal de servicios en línea](https://www.tienda.etecsa.cu/).

## Funciones implementadas
- [x] [Secure Etecsa](https://secure.etecsa.net:8443/)
  
  - [x] Iniciar sesión.
  - [x] Cerrar sesión.
  - [x] Obtener el tiempo disponible en la cuenta.
  - [x] Obtener la información de la cuenta.

- [ ] [Portal de Usuario](https://www.portal.nauta.cu/)
  
  - [ ] Iniciar sesión.
  
  - [ ] Obtener información de la cuenta.
  
  - [ ] Recargar la cuenta.
  
  - [ ] Transferir saldo a otra cuenta Nauta.
  
  - [ ] Transferir saldo para el pago de cuota (solo para cuentas Nauta Hogar).
  
  - [ ] Cambiar la contraseña de la cuenta de acceso.
  
  - [ ] Cambiar la contraseña de la cuenta de correo asociada.
  
  - [ ] Obtener las conexiones realizadas en el período `año-mes` especificado.
  
  - [ ] Obtener las recargas realizadas en el período `año-mes` especificado.
  
  - [ ] Obtener las transferencias realizadas en el período `año-mes` especificado.
  
  - [ ] Obtener los pagos de cuotas realizados en el período `año-mes` especificado (solo para cuentas Nauta Hogar).
     
     
# Uso
Importa `SuitEtecsaSdk` en tu proyecto

```swift
dependencies: [
    .package(url: "https://github.com/suitetecsa/sdk-swift/.git", from: "1.0.0-alpha01")
]
```

Importa `SuitEtecsaSdk`

```swift
import SuitEtecsaSdk
```

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

# Contribución

¡Gracias por tu interés en colaborar con nuestro proyecto! Nos encanta recibir contribuciones de la comunidad y valoramos mucho tu tiempo y esfuerzo.

## Cómo contribuir

Si estás interesado en contribuir, por favor sigue los siguientes pasos:

1. Revisa las issues abiertas para ver si hay alguna tarea en la que puedas ayudar.
2. Si no encuentras ninguna issue que te interese, por favor abre una nueva issue explicando el problema o la funcionalidad que te gustaría implementar. Asegúrate de incluir toda la información necesaria para que otros puedan entender el problema o la funcionalidad que estás proponiendo.
3. Si ya tienes una issue asignada o si has decidido trabajar en una tarea existente, por favor crea un fork del repositorio y trabaja en una nueva rama (`git checkout -b nombre-de-mi-rama`).
4. Cuando hayas terminado de trabajar en la tarea, crea un pull request explicando los cambios que has realizado y asegurándote de que el código cumple con nuestras directrices de estilo y calidad.
5. Espera a que uno de nuestros colaboradores revise el pull request y lo apruebe o sugiera cambios adicionales.

## Directrices de contribución

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

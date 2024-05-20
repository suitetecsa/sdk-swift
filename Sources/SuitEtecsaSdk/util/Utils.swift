import Alamofire
import Foundation
import CryptoSwift

public func checkConnections(html: String) async -> Result<Bool, Error> {
  switch await AF.request(URLRequest(url: URL(string: "http://www.cubadebate.cu")!))
    .serializingString().response.result
  {
  case .failure(let error): return Result.failure(error)
  case .success(let html): return Result.success(html.contains(connectDomain))
  }
}

public func createPasswordApp() -> String {
  // Crea un objeto DateFormatter para formatear la fecha actual
  let dateFormatter = DateFormatter()
  dateFormatter.dateFormat = "ddMMyyyyHH"
  // Obtiene la fecha actual como una cadena en el formato "ddMMyyyyHH"
  let dateString = dateFormatter.string(from: Date())

  // Construye la cadena de clave de la aplicación
  let appKey = "portal" + dateString + "externalPortal"
  // Convierte la cadena de clave de la aplicación en un objeto Data
  let appKeyData = appKey.data(using: .utf8)!

  // Calcula el hash SHA-512 de la cadena de clave de la aplicación
  let hashedData = appKeyData.sha512()
  // Codifica el hash en formato Base64 y devuelve la cadena resultante
  return "ApiKey \(hashedData.base64EncodedString())"
}

// Función principal que genera un objeto con datos cifrados
func generateEncryptedData(data: [String: String]) throws -> [String: [String]] {
  var data = data
  data["id_peticion"] = generarIdPeticion()

  // Genera claves aleatorias y un vector de inicialización para cifrar los datos
  let key1 = AES.randomIV(5).toHexString()
  let key2 = AES.randomIV(4).toHexString()
  let key3 = AES.randomIV(3).toHexString()
  let key4 = AES.randomIV(4).toHexString()
  let completeKey = try! PKCS5.PBKDF2(
    password: Array(key1.utf8), salt: Array(key2.utf8), iterations: 100, keyLength: 192,
    variant: .sha1
  ).calculate()
  let clave1Hex = [UInt8](Data(hex: String(completeKey.toHexString().prefix(32))))
  let clave2Hex = [UInt8](Data(hex: String(completeKey.toHexString().prefix(96).suffix(64))))

  // Cifra los datos usando AES
  let aes = try! AES(key: clave2Hex, blockMode: CBC(iv: clave1Hex), padding: .pkcs7)
  let jsonStr = String(data: try JSONEncoder().encode(data), encoding: .utf8)!
  let encryptedData = try aes.encrypt(jsonStr.bytes).toBase64()

  // Genera un código de estado aleatorio y lo convierte en una cadena Base64
  let statusCode = "\(AES.randomIV(2).toHexString())false\(AES.randomIV(2).toHexString())"
  let statusCodeBase64 = statusCode.bytes.toBase64().replacingOccurrences(of: "==", with: "")

  return [
    "datos": [
      "\(key3)\(key1)\(encryptedData)\(key4)\(key2)",
      "\(AES.randomIV(3).toHexString())\(statusCodeBase64)\(AES.randomIV(3).toHexString())",
    ]
  ]
}

// Función auxiliar que genera un identificador de petición único
func generarIdPeticion() -> String {
  // Genera cinco cadenas aleatorias y las combina para formar un identificador de petición
  let cadenasAleatorias = [
    generarCadenaNumericaPar(),
    generarCadenaNumericaImpar(),
    generarCadenaAlfabeticaMinuscula(),
    generarCadenaAlfabeticaMayuscula(),
    generarCadenaCaracteresEspeciales(),
  ]
  return cadenasAleatorias.enumerated().map { (indice, cadena) in
    cadena + "\(indice + 1)"
  }.joined()
}

// Función auxiliar que genera una cadena de cinco dígitos pares aleatorios
func generarCadenaNumericaPar() -> String {
  let opciones = "02468"
  var cadena = ""
  for _ in 0..<5 {
    let indice = Int.random(in: 0..<opciones.count)
    let digito = opciones[opciones.index(opciones.startIndex, offsetBy: indice)]
    cadena.append(digito)
  }
  return cadena
}

// Función auxiliar que genera una cadena de cinco dígitos impares aleatorios
func generarCadenaNumericaImpar() -> String {
  let opciones = "13579"
  var cadena = ""
  for _ in 0..<5 {
    let indice = Int.random(in: 0..<opciones.count)
    let digito = opciones[opciones.index(opciones.startIndex, offsetBy: indice)]
    cadena.append(digito)
  }
  return cadena
}

// Función auxiliar que genera una cadena de cinco caracteres alfabéticos minúsculos aleatorios
func generarCadenaAlfabeticaMinuscula() -> String {
  let opciones = "abcdefghijklmnopqrstuvwxyz"
  var cadena = ""
  for _ in 0..<5 {
    let indice = Int.random(in: 0..<opciones.count)
    let caracter = opciones[opciones.index(opciones.startIndex, offsetBy: indice)]
    cadena.append(caracter)
  }
  return cadena
}

// Función auxiliar que genera una cadena de cinco caracteres alfabéticos mayúsculos aleatorios
func generarCadenaAlfabeticaMayuscula() -> String {
  let opciones = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  var cadena = ""
  for _ in 0..<5 {
    let indice = Int.random(in: 0..<opciones.count)
    let caracter = opciones[opciones.index(opciones.startIndex, offsetBy: indice)]
    cadena.append(caracter)
  }
  return cadena
}

// Función auxiliar que genera una cadena de cinco caracteres especiales aleatorios
func generarCadenaCaracteresEspeciales() -> String {
  let opciones = "~!@#$%^&*()+=-]}{[?/.>,<*-"
  var cadena = ""
  for _ in 0..<5 {
    let indice = Int.random(in: 0..<opciones.count)
    let caracter = opciones[opciones.index(opciones.startIndex, offsetBy: indice)]
    cadena.append(caracter)
  }
  return cadena
}


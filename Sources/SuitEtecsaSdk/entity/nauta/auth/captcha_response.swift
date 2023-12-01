import Foundation

// Define una estructura pública 'CaptchaResponse' que conforma al protocolo 'Codable'.
public struct CaptchaResponse: Codable {
  // Propiedades públicas para almacenar la identificación de la solicitud y los datos de la respuesta.
  public let idRequest: String
  public let data: String

  // Enumeración interna para definir las claves de codificación personalizadas.
  enum CodingKeys: String, CodingKey {
    // Asigna la clave 'text' del JSON a la propiedad 'idRequest'.
    case idRequest = "text"
    // Asigna la clave 'data' del JSON a la propiedad 'data'.
    case data = "data"
  }

  // Inicializador personalizado para decodificar desde un tipo 'Decoder'.
  public init(from decoder: Decoder) throws {
    // Crea un contenedor de decodificación utilizando las claves definidas.
    let container = try decoder.container(keyedBy: CodingKeys.self)
    // Decodifica el valor asociado con la clave 'idRequest' (originalmente 'text' en JSON).
    idRequest = try container.decode(String.self, forKey: .idRequest)
    // Decodifica el valor asociado con la clave 'data'.
    data = try container.decode(String.self, forKey: .data)
  }
}

extension User: Codable {
    enum CodingKeys: String, CodingKey {
        case client = "cliente"
        case completed = "completado"
        case lastUpdate = "fechaActualizacion"
        case services = "Servicios"
        case updatedServices = "servicios_actualizados"
    }

    enum ServicesKeys: String, CodingKey {
        case mailServices = "Correo Nauta"
        case navServices = "Navegación"
        case mobileServices = "Servicios móviles"
        case fixedTelephony = "Telefonía fija"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        completed = try container.decode(String.self, forKey: .completed) == "true"
        lastUpdate = try container.decode(String.self, forKey: .lastUpdate)
        updatedServices = try container.decode(String.self, forKey: .updatedServices) == "true"
        client = try container.decode(Client.self, forKey: .client)

        let serviceLists = try? container.nestedContainer(
            keyedBy: ServicesKeys.self, forKey: .services)
        mailServices =
            try serviceLists?.decodeIfPresent([String: MailService].self, forKey: .mailServices)?
            .compactMap { _, service in service } ?? []
        navServices =
            try serviceLists?.decodeIfPresent([String: NavService].self, forKey: .navServices)?
            .compactMap { _, service in service } ?? []
        mobileServices =
            try serviceLists?.decodeIfPresent(
                [String: MobileService].self, forKey: .mobileServices)?
            .compactMap { _, service in service } ?? []
        fixedTelephony =
            try serviceLists?.decodeIfPresent(
                [String: FixedTelephony].self, forKey: .fixedTelephony)?
            .compactMap { _, service in service } ?? []
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode("\(completed)", forKey: .completed)
        try container.encode(lastUpdate, forKey: .lastUpdate)
        try container.encode("\(updatedServices)", forKey: .updatedServices)
        try container.encode(client, forKey: .client)

        var serviceLists = container.nestedContainer(keyedBy: ServicesKeys.self, forKey: .services)
        try serviceLists.encode(
            Dictionary(uniqueKeysWithValues: mailServices.map { ($0.profile.emailAccount, $0) }),
            forKey: .mailServices
        )
        try serviceLists.encode(
            Dictionary(uniqueKeysWithValues: navServices.map { ($0.profile.accessAccount, $0) }),
            forKey: .navServices
        )
        try serviceLists.encode(
            Dictionary(uniqueKeysWithValues: mobileServices.map { ($0.profile.id, $0) }),
            forKey: .mobileServices
        )
        try serviceLists.encode(
            Dictionary(uniqueKeysWithValues: fixedTelephony.map { ($0.profile.phoneNumber, $0) }),
            forKey: .fixedTelephony
        )
    }
}

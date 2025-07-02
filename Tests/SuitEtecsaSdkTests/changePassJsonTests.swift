//
//  changePassJsonTests.swift
//  SuitEtecsaSdk
//
//  Created by Pedro Omar  on 6/1/25.
//

import Foundation
import XCTest

@testable import SuitEtecsaSdk

final class ChangePassJsonTests: XCTestCase {
    func testUserValidJson() throws {
        let validResponseJson = try newJSONDecoder().decode(
            UserValid.self, from: userValidJson.data(using: .utf8)!)
        let dataJson = try newJSONDecoder().decode(
            DataResp.self, from: dataResponse.data(using: .utf8)!)

        print("Respuesta del JSON: \(validResponseJson)")

        XCTAssertEqual(validResponseJson.captchatext, "AR4RWU")
        XCTAssertEqual(validResponseJson.idRequest, "6f56767ff346ad44cef872037749d5fbc6a05639")
        XCTAssertEqual(
            validResponseJson.param, [Param(name: "usuarioPortal", value: "+5355627579")])

        print("Respuesta del JSON: \(dataJson)")
        XCTAssertEqual(dataJson.data.resultado, "OK")
    }
    func testnumberValidJson() throws {
        let validCodeJson = try newJSONDecoder().decode(
                ValidateCode.self, from: numberValidJson.data(using: .utf8)!)
        
        XCTAssertEqual(validCodeJson.param[1].name, "codigoActivacion")
        XCTAssertEqual(validCodeJson.param[1].value, "AU9MI")
    }
    func testChangePassJson() throws {
        let changePassJson = try newJSONDecoder().decode(
                ChangePass.self, from: changePassJson.data(using: .utf8)!)

            XCTAssertEqual(changePassJson.param.count, 3)
            XCTAssertEqual(changePassJson.param[0].name, "cuenta")
            XCTAssertEqual(changePassJson.param[0].value, "+5355627579")
            XCTAssertEqual(changePassJson.param[1].name, "password")
            XCTAssertEqual(changePassJson.param[1].value, "Carking*2023")
            XCTAssertEqual(changePassJson.param[2].name, "codigoActivacion")
            XCTAssertEqual(changePassJson.param[2].value, "AU9MI")
    }
}

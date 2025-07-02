//
//  registerAccountJsonTest.swift
//  SuitEtecsaSdk
//
//  Created by Pedro Omar  on 6/1/25.
//

import Foundation
import XCTest

@testable import SuitEtecsaSdk

final class RegisterAccountJsonTests: XCTestCase {
    func testResgisterUserJson() throws {
        let userValidJson = try newJSONDecoder().decode(
            RegisterUser.self, from: userValidJson.data(using: .utf8)!)

        XCTAssertEqual(userValidJson.captchatext, "AR4RWU")
        XCTAssertEqual(userValidJson.idRequest, "6f56767ff346ad44cef872037749d5fbc6a05639")
        XCTAssertEqual(userValidJson.param[0].name, "usuarioPortal")
        XCTAssertEqual(userValidJson.param[0].value, "+5355627579")
    }
    func testValidateUser() throws {
        let validateUser = try newJSONDecoder().decode(
            ValidateCode.self, from: numberValidJson.data(using: .utf8)!)

        XCTAssertEqual(validateUser.param[1].name, "codigoActivacion")
        XCTAssertEqual(validateUser.param[1].value, "AU9MI")
    }
}

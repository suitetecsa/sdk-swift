//
//  registerAccountJsonTest.swift
//  SuitEtecsaSdk
//
//  Created by Pedro Omar  on 6/1/25.
//

import Foundation
import XCTest

@testable import SuitEtecsaSdk

final class registerAccountJsonTests: XCTest {
    func testResgisterUserJson() throws {
        do {
            let userValidJson = try newJSONDecoder().decode(RegisterUser.self, from: userValidJson.data(using: .utf8)!)
            
            print("Respuesta del JSON: \(userValidJson)")
            
            XCTAssertEqual(userValidJson.captchatext, "captchatext")
            XCTAssertEqual(userValidJson.idRequest, "idRequest")
            XCTAssertEqual(userValidJson.param, [Param(name: "", value: "")])
        } catch let error {
            print("Errr en la respuesta del Json: \(error.localizedDescription)")
        }
    }
    
    func testUserCreateJson() throws {
        do {
            let userCreate = try newJSONDecoder().decode(UserCreate.self, from: numberValidJson.data(using: .utf8)!)
            
            print("Respuesta del JSON: \(userCreate)")
            XCTAssertEqual(userCreate.param, [Param(name: "", value: "")])
        } catch let error {
            print("Error en la respuesta del json: \(error.localizedDescription)")
        }
    }
    
    func testValidateUser() throws {
        let validateUser = try newJSONDecoder().decode(
            ValidateCode.self, from: numberValidJson.data(using: .utf8)!)

        XCTAssertEqual(validateUser.param[1].name, "codigoActivacion")
        XCTAssertEqual(validateUser.param[1].value, "AU9MI")
    }
}

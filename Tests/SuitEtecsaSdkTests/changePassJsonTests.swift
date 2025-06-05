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
        do {
            let validResponseJson = try newJSONDecoder().decode(UserValid.self, from: userValidJson.data(using: .utf8)!)
            
            if validResponseJson.data.data.resultado == "ok" {
                print("Respuesta del JSON: \(validResponseJson)")
                
                XCTAssertEqual(validResponseJson.captchatext, "captchatext")
                XCTAssertEqual(validResponseJson.idRequest, "idRequest")
                XCTAssertEqual(validResponseJson.param, [Param(name: "", value: "")])
            } else {
                XCTFail("No hay respuesta el JSON")
            }
        } catch let error {
            print("Error en la respuesta del JSON: \(error.localizedDescription)")
        }
    }
    
    func testnumberValidJson() throws {
        do {
            let validCodeJson = try newJSONDecoder().decode(ValidateCode.self, from: numberValidJson.data(using: .utf8)!)
            
            if validCodeJson.param.isEmpty {
                XCTFail("Error en la respuesta del JSON")
            } else {
                print("Respuesta del JSON: \(validCodeJson)")
            }
        } catch let error {
            print("Error en la respuesta del JSON: \(error.localizedDescription)")
        }
    }
    
    func testChangePassJson() throws {
        do {
            let changePassJson = try newJSONDecoder().decode(ChangePass.self, from: changePassJson.data(using: .utf8)!)
            
            if changePassJson.param.isEmpty {
                XCTFail("Error en la respuesta del JSON")
            } else {
                print("Respuesta del JSON: \(changePassJson)")
            }
        } catch let error {
            print("Error en la respuesta del JSON: \(error.localizedDescription)")
        }
    }
}

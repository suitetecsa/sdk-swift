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
            let dataJson = try newJSONDecoder().decode(DataResp.self, from: dataResponse.data(using: .utf8)!)
            
            print("Respuesta del JSON: \(validResponseJson)")
            
            XCTAssertEqual(validResponseJson.captchatext, "AR4RWU")
            XCTAssertEqual(validResponseJson.idRequest, "6f56767ff346ad44cef872037749d5fbc6a05639")
            XCTAssertEqual(validResponseJson.param, [Param(name: "usuarioPortal", value: "+5355627579")])
            
            print("Respuesta del JSON: \(dataJson)")
            XCTAssertEqual(dataJson.data.resultado, "OK")
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

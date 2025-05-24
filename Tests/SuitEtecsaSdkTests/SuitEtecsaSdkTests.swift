import Foundation
import XCTest

@testable import SuitEtecsaSdk

final class DecodeJsonWithServicesTest: XCTestCase {
    func testExample() throws {
        let loginResponseJson = try newJSONDecoder().decode(
            LoginResponseJson.self, from: loginResponse.data(using: .utf8)!
        ).resp
        XCTAssertTrue(loginResponseJson.result == "ok")
        XCTAssertTrue(
            loginResponseJson.token
                == "eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiIrNTM1NTYyNzU3OSIsImlhdCI6MTY5MDMyOTAwNCwiaXNzIjoiZ2VzTmF1dGFTZXJ2aWNlcyIsImV4cCI6MTY5MDMzMjYwNCwidXNlcl9pbmZvIjoie1wibGxwZGNcIjpcIjFlYTFjMzIzLWEyMzMtNGE1Zi1hNmIwLTU3NTk3ZWI3MTFlYlwiLFwiaWRlbnRpZmljYWNpb25cIjpcIjk4MTIxNjAyNDA2XCIsXCJ0aXBvSWRlbnRpZmljYWNpb25cIjpcIjFcIixcInBlcnNvbmFfaWRcIjpcIjFlYTFjMzIzLWEyMzMtNGE1Zi1hNmIwLTU3NTk3ZWI3MTFlYlwiLFwidXN1YXJpb19wb3J0YWxcIjpcIis1MzU1NjI3NTc5XCIsXCJub21icmVcIjpcInBlZHJvIG9tYXIgY2FzYWJlbGxhIGxlbXVzXCIsXCJjb3JyZW9cIjpcInBvY2w5ODEyQGdtYWlsLmNvbVwiLFwidGVsZWZvbm9cIjpcIjU1NjI3NTc5XCJ9In0.YjkZdhXHEyuH2CmCMMEmvDSFE8sh3HyhK55_4dD3UJwRj8g5sFLbE7_ktrpasS8k"
        )

        if let user = loginResponseJson.user {
            XCTAssertTrue(user.client.email == "pocl9812@gmail.com")
            XCTAssertTrue(user.client.operations.count == 4)
            XCTAssertTrue(user.navServices.count == 1)
            XCTAssertTrue(
                user.navServices.first?.profile.accessAccount
                    == "pedroomar.casabella@nauta.com.cu")
            XCTAssertTrue(user.mobileServices.count == 3)
            XCTAssertTrue(user.mailServices.count == 1)
            XCTAssertTrue(user.fixedTelephony.count == 0)
            XCTAssertTrue(!user.updatedServices)
            XCTAssertTrue(user.completed)

        } else {
            XCTFail("Expected a user value")
        }
    }
}

final class DecodeJsonWithoutServicesTest: XCTestCase {
    func testExample() throws {
        let userResponseJson = try newJSONDecoder().decode(
            UserResponseJson.self, from: userResponseWithoutServices.data(using: .utf8)!
        ).resp
        XCTAssertTrue(userResponseJson.result == "ok")

        if let user = userResponseJson.user {
            XCTAssertTrue(user.client.email == "pocl9812@gmail.com")
            XCTAssertTrue(user.client.operations.count == 4)
            XCTAssertTrue(user.navServices.count == 0)
            XCTAssertTrue(user.mobileServices.count == 0)
            XCTAssertTrue(user.mailServices.count == 0)
            XCTAssertTrue(user.fixedTelephony.count == 0)
            XCTAssertTrue(!user.updatedServices)
            XCTAssertTrue(user.completed)
        } else {
            XCTFail("Expected a user value")
        }
    }
}

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

        if case .user(let decodedUser) = loginResponseJson.user {
            XCTAssertNotNil(decodedUser)
            XCTAssertTrue(decodedUser.client.email == "pocl9812@gmail.com")
            XCTAssertTrue(decodedUser.client.operations.count == 4)
            XCTAssertTrue(decodedUser.navServices.count == 1)
            XCTAssertTrue(
                decodedUser.navServices.first?.profile.accessAccount
                    == "pedroomar.casabella@nauta.com.cu")
            XCTAssertTrue(decodedUser.mobileServices.count == 3)
            XCTAssertTrue(decodedUser.mailServices.count == 1)
            XCTAssertTrue(decodedUser.fixedTelephony.count == 0)
            XCTAssertTrue(!decodedUser.updatedServices)
            XCTAssertTrue(decodedUser.completed)
        } else {
            XCTFail("Expected a user value")
        }
    }
}

final class DecodeJsonWithoutServicesTest: XCTestCase {
    func testExample() throws {
        let loginResponseJson = try newJSONDecoder().decode(
            LoginResponseJson.self, from: loginResponseWithoutServices.data(using: .utf8)!
        ).resp
        XCTAssertTrue(loginResponseJson.result == "ok")
        XCTAssertTrue(
            loginResponseJson.token
                == "eyJhbGciOiJIUzM4NCJ9.eyJzdWIiOiIrNTM1NTYyNzU3OSIsImlhdCI6MTY5MDMyOTAwNCwiaXNzIjoiZ2VzTmF1dGFTZXJ2aWNlcyIsImV4cCI6MTY5MDMzMjYwNCwidXNlcl9pbmZvIjoie1wibGxwZGNcIjpcIjFlYTFjMzIzLWEyMzMtNGE1Zi1hNmIwLTU3NTk3ZWI3MTFlYlwiLFwiaWRlbnRpZmljYWNpb25cIjpcIjk4MTIxNjAyNDA2XCIsXCJ0aXBvSWRlbnRpZmljYWNpb25cIjpcIjFcIixcInBlcnNvbmFfaWRcIjpcIjFlYTFjMzIzLWEyMzMtNGE1Zi1hNmIwLTU3NTk3ZWI3MTFlYlwiLFwidXN1YXJpb19wb3J0YWxcIjpcIis1MzU1NjI3NTc5XCIsXCJub21icmVcIjpcInBlZHJvIG9tYXIgY2FzYWJlbGxhIGxlbXVzXCIsXCJjb3JyZW9cIjpcInBvY2w5ODEyQGdtYWlsLmNvbVwiLFwidGVsZWZvbm9cIjpcIjU1NjI3NTc5XCJ9In0.YjkZdhXHEyuH2CmCMMEmvDSFE8sh3HyhK55_4dD3UJwRj8g5sFLbE7_ktrpasS8k"
        )

        if case .user(let decodedUser) = loginResponseJson.user {
            XCTAssertNotNil(decodedUser)
            XCTAssertTrue(decodedUser.client.email == "pocl9812@gmail.com")
            XCTAssertTrue(decodedUser.client.operations.count == 4)
            XCTAssertTrue(decodedUser.navServices.count == 0)
            XCTAssertTrue(decodedUser.mobileServices.count == 0)
            XCTAssertTrue(decodedUser.mailServices.count == 0)
            XCTAssertTrue(decodedUser.fixedTelephony.count == 0)
            XCTAssertTrue(!decodedUser.updatedServices)
            XCTAssertTrue(decodedUser.completed)
        } else {
            XCTFail("Expected a user value")
        }
    }
}

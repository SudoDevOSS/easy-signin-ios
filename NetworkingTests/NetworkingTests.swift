//
//  NetworkingTests.swift
//  NetworkingTests
//
//  Created by Sudo Dev OSS on 30/12/20.
//

import XCTest
@testable import Networking
import Mocker
import Alamofire

class NetworkingTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        let semaphore = DispatchSemaphore(value: 0)
        let fetchInfoUseCase = DependencyContainer.shared.container.resolve(FetchUserInfoUseCaseDelegate.self)!
        let configuration = URLSessionConfiguration.af.default
        configuration.protocolClasses = [MockingURLProtocol.self]
        let sessionManager = Alamofire.Session(configuration: configuration)
        try! BaseNetworkConfigurator.sharedInstance.configure(url: "http://localhost:8080/api/v1/", token: nil)
        BaseNetworkConfigurator.SessionManager = sessionManager

        let originalURL = URL(string: "http://localhost:8080/api/v1/account/info")!
        let dummyUser = MockNetworkCalls.dummuyUserGenerator()
        let mock = Mock(url: originalURL, dataType: .json, statusCode: 200, data: [
            .get : dummyUser.asData() // Data containing the JSON response
        ])
        mock.register()

        fetchInfoUseCase.exec { (result) in
            XCTAssertNotNil(result)
            switch result{
            case .success(let user):
                print("EMAIL IS: \(user.email)")
                XCTAssertNotNil(user)
                XCTAssertEqual(user.firstName, "Demo")
                break
            case .failure(let err):
                XCTAssertNotNil(err)
            break
            }
            semaphore.signal()
        }
        semaphore.wait()
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

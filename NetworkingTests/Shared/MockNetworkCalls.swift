//
//  MockNetworkCalls.swift
//  NetworkingTests
//
//  Created by Sudo Dev OSS on 2/1/21.
//

import Foundation
import Mocker
import Networking

public final class MockNetworkCalls {
    public static func dummuyUserGenerator() -> User {
        return User(id: UUID().uuidString, firstName: "Demo", lastName: "User", email: "demo@example.com", phoneNumber: "123123")
    }
}

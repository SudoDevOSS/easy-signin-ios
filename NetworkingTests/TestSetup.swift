//
//  TestSetup.swift
//  NetworkingTests
//
//  Created by Sudo Dev OSS on 31/12/20.
//

import Foundation
@testable import Networking

class TestSetup : NSObject {
    override init() {
        let _ = DependencyContainer.shared // To make sure Container is initialized
    }
}

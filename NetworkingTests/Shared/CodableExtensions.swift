//
//  CodableExtensions.swift
//  NetworkingTests
//
//  Created by Sudo Dev OSS on 2/1/21.
//

import Foundation
extension Encodable {
    func asData() -> Data{
        return try! JSONEncoder().encode(self)
    }
}

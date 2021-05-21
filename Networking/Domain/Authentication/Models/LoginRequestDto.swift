//
//  LoginRequestDto.swift
//  Networking
//
//  Created by Sudo Dev OSS on 30/12/20.
//

import Foundation

public struct LoginRequestDto : Encodable {
    public let email: EmailField
    public let password: String


    fileprivate enum LoginRequestDtoCodingKeys: String, CodingKey {
        case email
        case password
    }


    public init(email: String, password: String) {
        self.email = EmailField(value: email)
        self.password = password
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: LoginRequestDtoCodingKeys.self)
        try container.encode(email.value, forKey: .email)
        try container.encode(password, forKey: .password)
    }

    func toMap() -> [String: String] {
        return ["email": self.email.value, "password": self.password]
    }
}

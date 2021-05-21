//
//  RegisterRequestDto.swift
//  Networking
//
//  Created by Sudo Dev OSS on 30/12/20.
//

import Foundation

public struct RegisterRequestDto : Encodable {
    public let firstName: String
    public let lastName: String
    public let password: String
    public let confirmPassword: String
    public let email: EmailField
    public let phoneNumber: String

    public init(firstName: String, lastName: String, password: String,
         confirmPassword: String, email: String, phoneNumber: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.password = password
        self.confirmPassword = confirmPassword
        self.phoneNumber = phoneNumber
        self.email = EmailField(value: email)
    }

    fileprivate enum RegisterRequestDtoKeys : String, CodingKey {
        case firstName
        case lastName
        case password
        case confirmPassword
        case email
        case phoneNumber
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: RegisterRequestDtoKeys.self)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(email.value, forKey: .email)
        try container.encode(phoneNumber, forKey: .phoneNumber)
        try container.encode(password, forKey: .password)
        try container.encode(confirmPassword, forKey: .confirmPassword)
    }
}

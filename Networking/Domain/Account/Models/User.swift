//
//  User.swift
//  Networking
//
//  Created by Sudo Dev OSS on 30/12/20.
//

public class User: Entity, Codable {
    public private(set) var firstName: String
    public private(set) var lastName: String
    public private(set) var email: EmailField
    public private(set) var phoneNumber: String


    fileprivate enum CodingKeys: String, CodingKey {
        case id
        case firstName
        case lastName
        case email
        case phoneNumber
    }

    public init(id: String?, firstName: String, lastName: String, email: String, phoneNumber: String){
        self.firstName = firstName
        self.lastName = lastName
        self.email = EmailField(value: email)
        self.phoneNumber = phoneNumber
        super.init(id: id)
    }

    public func changeName(firstName: String? = nil, lastName: String? = nil){
        if let f = firstName, !f.isEmpty {
            self.firstName = f
        }
        if let l = lastName, !l.isEmpty {
            self.lastName = l
        }
    }

    public func changePhoneNumber(_ newNumber: String){
        guard !newNumber.isEmpty else {
            return
        }

        self.phoneNumber = newNumber
    }

    public func changeEmail(_ newEmail: String){
        guard newEmail.isValidEmail() else {
            return
        }

        self.email = EmailField(value: newEmail)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        firstName = container.safeDecode(CodingKeys.firstName) ?? ""
        lastName = container.safeDecode(CodingKeys.lastName) ?? ""
        email = EmailField(value: (container.safeDecode(CodingKeys.email) ?? ""))
        phoneNumber = container.safeDecode(CodingKeys.phoneNumber) ?? ""

        super.init(id: "")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        if id != nil {
            try container.encode(id, forKey: .id)
        }
        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(email.value, forKey: .email)
        try container.encode(phoneNumber, forKey: .phoneNumber)
    }
}

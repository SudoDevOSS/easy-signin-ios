//
//  AuthenticationResponse.swift
//  Networking
//
//  Created by Sudo Dev OSS on 30/12/20.
//

public struct AuthenticationResponseDto: Decodable {
    public let accessToken: String
    public let refreshToken: String

    public init(token: String, refreshToken: String){
        self.accessToken = token
        self.refreshToken = refreshToken
    }

    fileprivate enum CodingKeys: String, CodingKey {
        case accessToken
        case refreshToken
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.accessToken = try container.decode(String.self, forKey: .accessToken)
        self.refreshToken = try container.decode(String.self, forKey: .refreshToken)
    }
}

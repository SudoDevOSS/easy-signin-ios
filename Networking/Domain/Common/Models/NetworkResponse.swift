//
//  NetworkResponse.swift
//  Networking
//
//  Created by Sudo Dev OSS on 14/2/21.
//

import Foundation
public struct NetworkResponse<T>: Decodable where T: Decodable {
    public let success: Bool
    public let data: T

    public init(success: Bool, data: T){
        self.success = success
        self.data = data
    }

    fileprivate enum CodingKeys: String, CodingKey {
        case success
        case data
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.success = try container.decode(Bool.self, forKey: .success)
        self.data = try container.decode(T.self, forKey: .data)
    }
}

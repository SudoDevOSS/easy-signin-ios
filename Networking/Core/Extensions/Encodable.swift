//
//  Encodable.swift
//  Networking
//
//  Created by Sudo Dev OSS on 30/12/20.
//

import Foundation
public extension Encodable {
    func asDictionary() -> [String: Any] {
        do {
            let data = try JSONEncoder().encode(self)
            guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
                return [:]
            }
            return dictionary
        }catch {
            return [:]
        }
    }

    func asData() -> Data?{
        return try? JSONEncoder().encode(self)
    }
}

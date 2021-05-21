//
//  KeyedDecodingContainerExtension.swift
//  Networking
//
//  Created by Sudo Dev OSS on 30/12/20.
//

extension KeyedDecodingContainer {
    func safeDecode<T>(_ key: CodingKey) -> T? where T : Decodable {
        do {
            return try self.decode(T.self, forKey: key as! K)
        } catch {
            return nil
        }
    }
}

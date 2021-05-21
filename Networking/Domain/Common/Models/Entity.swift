//
//  Entity.swift
//  Networking
//
//  Created by Sudo Dev OSS on 30/12/20.
//

import Foundation
public class Entity {
    public let id: String?

    public init(id: String?) {
        self.id = id
    }

    public static func == (lhs: Entity, rhs: Entity) -> Bool {
        return lhs.id == rhs.id
    }
}

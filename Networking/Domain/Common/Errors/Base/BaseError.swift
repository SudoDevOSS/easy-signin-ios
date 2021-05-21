//
//  BaseError.swift
//  Networking
//
//  Created by Sudo Dev OSS on 30/12/20.
//

public class BaseError : Error {
    let code: Int
    let description: String?

    init(code: Int = -1, description: String? = nil) {
        self.code = code
        self.description = description
    }
}

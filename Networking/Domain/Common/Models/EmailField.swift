//
//  EmailField.swift
//  Networking
//
//  Created by Sudo Dev OSS on 30/12/20.
//

import Foundation

public struct EmailField {
    public private(set) var value: String = "" {
        didSet(fromOldValue){
            if !value.isValidEmail() {
                value = fromOldValue
            }
        }
    }
}

//
//  StatusCodeParser.swift
//  Networking
//
//  Created by Sudo Dev OSS on 30/12/20.
//

import Foundation
func StatusCodeHandler(_ statusCode: Int) -> BaseError {
    switch(statusCode){
    case 400:
        return InvalidArgumentsError()
    case 401, 403:
        return NotAuthorizedError()
    case 500...599:
        return ServerError(code: statusCode)
    default:
        return GenericError(code: statusCode)
    }
}

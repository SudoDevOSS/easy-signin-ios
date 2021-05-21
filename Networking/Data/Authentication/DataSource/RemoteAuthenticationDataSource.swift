//
//  RemoteAuthenticationDataSource.swift
//  Networking
//
//  Created by Sudo Dev OSS on 30/12/20.
//

import Alamofire
import Combine

class RemoteAuthenticationDataSource: AuthenticationDataSourceDelegate {
    func login(payload: LoginRequestDto) -> AnyPublisher<NetworkResponse<AuthenticationResponseDto>, BaseError> {

        guard BaseNetworkConfigurator.SessionManager != nil else {
            let error = InvalidArgumentsError(code: -1, description: "Session manager not configured")
            return Fail<NetworkResponse<AuthenticationResponseDto>, BaseError>(error: error).eraseToAnyPublisher()
        }

        return BaseNetworkConfigurator.SessionManager!
            .request("\(BaseNetworkConfigurator.sharedInstance.url)account/login", method: .post, parameters: payload.asDictionary(), encoding: JSONEncoding.default, headers: nil, interceptor: nil, requestModifier: nil)
            .validate()
            .publishDecodable(type: NetworkResponse<AuthenticationResponseDto>.self)
            .value()
            .mapError({ StatusCodeHandler($0.responseCode ?? -1) })
            .eraseToAnyPublisher()

    }
    
    func register(payload: RegisterRequestDto) -> AnyPublisher<NetworkResponse<AuthenticationResponseDto>, BaseError> {
        guard BaseNetworkConfigurator.SessionManager != nil else {
            let error = InvalidArgumentsError(code: -1, description: "Session manager not configured")
            return Fail<NetworkResponse<AuthenticationResponseDto>, BaseError>(error: error).eraseToAnyPublisher()
        }

        return BaseNetworkConfigurator.SessionManager!
            .request("\(BaseNetworkConfigurator.sharedInstance.url)account/register", method: .post, parameters: payload.asDictionary(), encoding: JSONEncoding.default, headers: nil, interceptor: nil, requestModifier: nil)
            .validate()
            .publishDecodable(type: NetworkResponse<AuthenticationResponseDto>.self)
            .value()
            .mapError({ StatusCodeHandler($0.responseCode ?? -1) })
            .eraseToAnyPublisher()
    }
    
    func resetPassword(email: String) -> AnyPublisher<NetworkResponse<Bool>, BaseError> {
        guard BaseNetworkConfigurator.SessionManager != nil else {
            let error = InvalidArgumentsError(code: -1, description: "Session manager not configured")
            return Fail<NetworkResponse<Bool>, BaseError>(error: error).eraseToAnyPublisher()
        }

        return BaseNetworkConfigurator.SessionManager!
            .request("\(BaseNetworkConfigurator.sharedInstance.url)account/reset_password", method: .post, parameters: ["email": email], encoding: JSONEncoding.default, headers: nil, interceptor: nil, requestModifier: nil)
            .validate()
            .publishDecodable(type: NetworkResponse<Bool>.self)
            .value()
            .mapError({ StatusCodeHandler($0.responseCode ?? -1) })
            .eraseToAnyPublisher()
    }
}

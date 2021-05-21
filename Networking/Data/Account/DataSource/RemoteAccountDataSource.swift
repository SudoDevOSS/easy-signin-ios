//
//  RemoteAccountDataSource.swift
//  Networking
//
//  Created by Sudo Dev OSS on 30/12/20.
//

import Alamofire
import Combine
public class RemoteAccountDataSource : AccountDataSourceDelegate {

    /// Fetch user info
    /// - Parameter completion: Callback completion handler    
    func fetch() -> AnyPublisher<NetworkResponse<User>, BaseError> {
        guard BaseNetworkConfigurator.SessionManager != nil else {
            let error = InvalidArgumentsError(code: -1, description: "Session manager not configured")
            return Fail<NetworkResponse<User>, BaseError>(error: error).eraseToAnyPublisher()
        }

        return BaseNetworkConfigurator.SessionManager!
            .request("\(BaseNetworkConfigurator.sharedInstance.url)account/info", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil, interceptor: nil, requestModifier: nil)
            .validate()
            .publishDecodable(type: NetworkResponse<User>.self)
            .value()
            .mapError({ StatusCodeHandler($0.responseCode ?? -1) })
            .eraseToAnyPublisher()
    }

    /// Update user info
    /// - Parameters:
    ///   - user: Updated user info
    ///   - completion: Callback completion handler
    func update(_ user: User) -> AnyPublisher<NetworkResponse<User>, BaseError> {
        guard BaseNetworkConfigurator.SessionManager != nil else {
            let error = InvalidArgumentsError(code: -1, description: "Session manager not configured")
            return Fail<NetworkResponse<User>, BaseError>(error: error).eraseToAnyPublisher()
        }

        return BaseNetworkConfigurator.SessionManager!
            .request("\(BaseNetworkConfigurator.sharedInstance.url)account/info", method: .put, parameters: user.asDictionary(), encoding: JSONEncoding.default, headers: nil, interceptor: nil, requestModifier: nil)
            .validate()
            .publishDecodable(type: NetworkResponse<User>.self)
            .value()
            .mapError({ StatusCodeHandler($0.responseCode ?? -1) })
            .eraseToAnyPublisher()
    }
}

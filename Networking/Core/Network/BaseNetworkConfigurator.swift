//
//  BaseNetworkConfigurator.swift
//  Networking
//
//  Created by Sudo Dev OSS on 30/12/20.
//

import Alamofire
public class BaseNetworkConfigurator {
    private(set) var url: String = ""
    fileprivate init() {}

    public static var SessionManager: Session? = nil

    public static let shared = BaseNetworkConfigurator()

    public func configure(url: String, token: String?) throws {
        guard let _ = URL(string: url) else {
            throw InvalidArgumentsError(code: -1, description: "Url is not valid")
        }

        self.url = url
        BaseNetworkConfigurator.SessionManager = { (token: String) in
            let configuration = URLSessionConfiguration.af.default
            configuration.timeoutIntervalForResource = 30
            configuration.timeoutIntervalForRequest = 30

            return .init(configuration: configuration, interceptor: AFRequestInterceptor(token: token))
        }(token ?? "")
    }

}

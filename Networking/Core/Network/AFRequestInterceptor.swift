//
//  AFRequestInterceptor.swift
//  Networking
//
//  Created by Sudo Dev OSS on 30/12/20.
//

import Alamofire

class AFRequestInterceptor : RequestInterceptor {

    fileprivate var nonAuthroizationUrls = ["login", "register", "refreshToken", "reset_password"]
    fileprivate let token: String
    fileprivate let retryLimit = 5
    fileprivate let retryDelay: TimeInterval = 10

    init(token: String){
        self.token = token
    }

    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlReq = urlRequest
        if nonAuthroizationUrls.contains(where: (urlReq.url?.absoluteString ?? "").contains){
            urlReq.setValue("Bearer \(self.token)", forHTTPHeaderField: "Authorization")
        }
        completion(.success(urlReq))
    }

    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        let response = request.task?.response as? HTTPURLResponse
        //Retry for 5xx status codes
        if
            let statusCode = response?.statusCode,
            (500...599).contains(statusCode),
            request.retryCount < retryLimit {
            completion(.retryWithDelay(retryDelay))
        } else {
            return completion(.doNotRetry)
        }
    }
}

//
//  AccountDataSourceDelegate.swift
//  Networking
//
//  Created by Sudo Dev OSS on 30/12/20.
//
import Combine
protocol AccountDataSourceDelegate {
    func fetch() -> AnyPublisher<NetworkResponse<User>, BaseError>
    func update(_ user: User) -> AnyPublisher<NetworkResponse<User>, BaseError>
}

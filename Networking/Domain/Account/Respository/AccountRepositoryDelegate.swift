//
//  AccountRepositoryDelegate.swift
//  Networking
//
//  Created by Sudo Dev OSS on 30/12/20.
//
import Combine
public protocol AccountRepositoryDelegate {
    func fetch() -> AnyPublisher<User, BaseError>
    func update(u: User) -> AnyPublisher<User, BaseError>
}

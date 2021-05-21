//
//  UpdateUserInfoDelegate.swift
//  Networking
//
//  Created by Sudo Dev OSS on 30/12/20.
//
import Combine
public protocol UpdateUserInfoUseCaseDelegate {
    func exec(_ user: User) -> AnyPublisher<User, BaseError>
}

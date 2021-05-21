//
//  FetchUserInfoUseCase.swift
//  Networking
//
//  Created by Sudo Dev OSS on 30/12/20.
//
import Combine
public protocol FetchUserInfoUseCaseDelegate {
    func exec() -> AnyPublisher<User, BaseError>
}

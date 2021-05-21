//
//  AuthenticationRepositoryDelegate.swift
//  Networking
//
//  Created by Sudo Dev OSS on 30/12/20.
//
import Combine
public protocol AuthenticationRepositoryDelegate {
    func login(payload: LoginRequestDto) -> AnyPublisher<AuthenticationResponseDto, BaseError>
    func register(payload: RegisterRequestDto) -> AnyPublisher<AuthenticationResponseDto, BaseError>
    func resetPassword(email: String) -> AnyPublisher<Bool, BaseError>
}

//
//  LoginUseCaseDelegate.swift
//  Networking
//
//  Created by Sudo Dev OSS on 30/12/20.
//
import Combine
public protocol LoginUseCaseDelegate {
    func exec(payload: LoginRequestDto) -> AnyPublisher<AuthenticationResponseDto, BaseError>
}

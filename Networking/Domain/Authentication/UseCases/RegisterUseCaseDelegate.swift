//
//  RegisterUseCaseDelegate.swift
//  Networking
//
//  Created by Sudo Dev OSS on 30/12/20.
//
import Combine
public protocol RegisterUseCaseDelegate {
    func exec(payload: RegisterRequestDto) -> AnyPublisher<AuthenticationResponseDto, BaseError>
}

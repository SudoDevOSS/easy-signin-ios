//
//  ResetPasswordUseCase.swift
//  Networking
//
//  Created by Sudo Dev OSS on 30/12/20.
//
import Combine
public protocol ResetPasswordUseCaseDelegate {
    func exec(email: String) -> AnyPublisher<Bool, BaseError>
}

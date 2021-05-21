//
//  AuthenticationDataSource.swift
//  Networking
//
//  Created by Sudo Dev OSS on 30/12/20.
//
import Combine

protocol AuthenticationDataSourceDelegate {
    func login(payload: LoginRequestDto) -> AnyPublisher<NetworkResponse<AuthenticationResponseDto>, BaseError>
    func register(payload: RegisterRequestDto) -> AnyPublisher<NetworkResponse<AuthenticationResponseDto>, BaseError>
    func resetPassword(email: String) -> AnyPublisher<NetworkResponse<Bool>, BaseError>
}

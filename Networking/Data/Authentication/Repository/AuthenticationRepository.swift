//
//  AuthenticationRepository.swift
//  Networking
//
//  Created by Sudo Dev OSS on 30/12/20.
//
import Combine

class AuthenticationRepository: AuthenticationRepositoryDelegate {

    fileprivate let dataSource: AuthenticationDataSourceDelegate

    init(ds: AuthenticationDataSourceDelegate) {
        self.dataSource = ds
    }

    func login(payload: LoginRequestDto) -> AnyPublisher<AuthenticationResponseDto, BaseError>{
        return self.dataSource.login(payload: payload).map { result in
            return result.data
        }.eraseToAnyPublisher()
    }

    func register(payload: RegisterRequestDto) -> AnyPublisher<AuthenticationResponseDto, BaseError> {
        return self.dataSource.register(payload: payload).map { result in
            return result.data
        }.eraseToAnyPublisher()
    }

    func resetPassword(email: String) -> AnyPublisher<Bool, BaseError>{
        return self.dataSource.resetPassword(email: email).map { result in
            return result.data
        }.eraseToAnyPublisher()
    }
}

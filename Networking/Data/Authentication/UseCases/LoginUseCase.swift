//
//  LoginUseCase.swift
//  Networking
//
//  Created by Sudo Dev OSS on 30/12/20.
//
import Combine
public class LoginUseCase: LoginUseCaseDelegate {
    fileprivate let repo: AuthenticationRepositoryDelegate

    init(repo: AuthenticationRepositoryDelegate) {
        self.repo = repo
    }

    public func exec(payload: LoginRequestDto) -> AnyPublisher<AuthenticationResponseDto, BaseError> {
        return self.repo.login(payload: payload)
    }
}

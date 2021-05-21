//
//  RegisterUseCase.swift
//  Networking
//
//  Created by Sudo Dev OSS on 30/12/20.
//
import Combine
public class RegisterUseCase: RegisterUseCaseDelegate {
    fileprivate let repo: AuthenticationRepositoryDelegate

    init(repo: AuthenticationRepositoryDelegate) {
        self.repo = repo
    }

    public func exec(payload: RegisterRequestDto) -> AnyPublisher<AuthenticationResponseDto, BaseError> {
        return self.repo.register(payload: payload)
    }
}

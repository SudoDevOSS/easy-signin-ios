//
//  ResetPasswordUseCase.swift
//  Networking
//
//  Created by Sudo Dev OSS on 30/12/20.
//
import Combine
public class ResetPasswordUseCase: ResetPasswordUseCaseDelegate {
    fileprivate let repo: AuthenticationRepositoryDelegate

    public init(repo: AuthenticationRepositoryDelegate) {
        self.repo = repo
    }

    public func exec(email: String) -> AnyPublisher<Bool, BaseError> {
        return self.repo.resetPassword(email: email)
    }
}

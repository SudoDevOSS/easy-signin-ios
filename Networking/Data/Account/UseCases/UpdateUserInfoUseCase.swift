//
//  UpdateUserInfoUseCase.swift
//  Networking
//
//  Created by Sudo Dev OSS on 30/12/20.
//
import Combine
public class UpdateUserInfoUseCase: UpdateUserInfoUseCaseDelegate {

    fileprivate let repo: AccountRepositoryDelegate

    init(repo: AccountRepositoryDelegate) {
        self.repo = repo
    }

    public func exec(_ user: User) -> AnyPublisher<User, BaseError> {
        self.repo.update(u: user).map { result in
            return result
        }.eraseToAnyPublisher()
    }
}

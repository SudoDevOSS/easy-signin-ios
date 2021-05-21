//
//  FetchUserInfoUseCase.swift
//  Networking
//
//  Created by Sudo Dev OSS on 30/12/20.
//
import Combine
public class FetchUserInfoUseCase: FetchUserInfoUseCaseDelegate {
    fileprivate let repo: AccountRepositoryDelegate

    init(repo: AccountRepositoryDelegate) {
        self.repo = repo
    }

    public func exec() -> AnyPublisher<User, BaseError>  {
        return self.repo.fetch()
    }
}

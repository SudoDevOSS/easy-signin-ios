//
//  AccountRepository.swift
//  Networking
//
//  Created by Sudo Dev OSS on 30/12/20.
//

import Combine

class AccountRepository: AccountRepositoryDelegate {

    fileprivate let dataSource: AccountDataSourceDelegate

    init(ds: AccountDataSourceDelegate) {
        self.dataSource = ds
    }

    func fetch() -> AnyPublisher<User, BaseError>  {
        return dataSource.fetch().map { result in
            return result.data
        }.eraseToAnyPublisher()
    }

    func update(u: User) -> AnyPublisher<User, BaseError> {
        return dataSource.update(u).map { result in
            return result.data
        }.eraseToAnyPublisher()
    }
}

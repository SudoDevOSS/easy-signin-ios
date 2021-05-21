//
//  DependencyContainer.swift
//  Networking
//
//  Created by Sudo Dev OSS on 30/12/20.
//

import Swinject

public class DependencyContainer {
    public let container = Container()
    fileprivate init(){}

    public static let shared = DependencyContainer()

    func configure(){
        self.registerAccountDeps()
        self.registerAuthenticationDeps()
    }

    fileprivate func registerAccountDeps(){
        container.register(AccountDataSourceDelegate.self) { _ in RemoteAccountDataSource() }
        container.register(AccountRepositoryDelegate.self) { _ in AccountRepository(ds: self.container.resolve(AccountDataSourceDelegate.self)!) }

        container.register(FetchUserInfoUseCaseDelegate.self) { _ in
            let repo = self.container.resolve(AccountRepositoryDelegate.self)!
            return FetchUserInfoUseCase(repo: repo)
        }

        container.register(UpdateUserInfoUseCaseDelegate.self) { _ in
            let repo = self.container.resolve(AccountRepositoryDelegate.self)!
            return UpdateUserInfoUseCase(repo: repo)
        }
    }

    fileprivate func registerAuthenticationDeps(){
        container.register(AuthenticationDataSourceDelegate.self) { _ in RemoteAuthenticationDataSource() }
        container.register(AuthenticationRepositoryDelegate.self) { _ in
            let dataSource = self.container.resolve(AuthenticationDataSourceDelegate.self)!
            return AuthenticationRepository(ds: dataSource)
        }

        container.register(LoginUseCaseDelegate.self) { _ in
            let repo = self.container.resolve(AuthenticationRepositoryDelegate.self)!
            return LoginUseCase(repo: repo)
        }

        container.register(RegisterUseCaseDelegate.self) { _ in
            let repo = self.container.resolve(AuthenticationRepositoryDelegate.self)!
            return RegisterUseCase(repo: repo)
        }

        container.register(ResetPasswordUseCaseDelegate.self) { _ in
            let repo = self.container.resolve(AuthenticationRepositoryDelegate.self)!
            return ResetPasswordUseCase(repo: repo)
        }
    }
}

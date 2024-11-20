//
//  FirstRepository.swift
//  OneVizion
//
//  Created by macbookpro on 19/11/24.
//
import Foundation
protocol FirstRepository: Repository {
    func loadUsers() async throws -> [User]
}

class FirstStrategyRepository: StrategyRepository, FirstRepository {
    var repo: FirstRepository {
        return repository as! FirstRepository
    }
    
    init(coreDataStack: CoreDataStack) {
        let localStratagy = FirstLocalStrategyRepo(coreDataStack: coreDataStack)
        let networkStratagy = FirstNetworkStrategyRepo()
        super.init(networkStratagy: networkStratagy, localStratagy: localStratagy)
    }
    
    func loadUsers() async throws -> [User] {
        return try await repo.loadUsers()
    }
}


class FirstNetworkStrategyRepo: NetworkRepoStratagy, FirstRepository {
    func loadUsers() async throws -> [User] {
        return []
    }
}

class FirstLocalStrategyRepo: LocalRepoStrategy, FirstRepository {
    func loadUsers() async throws -> [User] {
        return []
    }
}

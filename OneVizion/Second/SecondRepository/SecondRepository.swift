//
//  SecondRepository.swift
//  OneVizion
//
//  Created by macbookpro on 19/11/24.
//

import Foundation
protocol SecondRepository: Repository {
    func loadUser(userId: Int) async throws -> UserDetail?
}

class SecondStrategyRepository: StrategyRepository, SecondRepository {
    
    init(coreDataStack: CoreDataStack) {
        let networkStratagy = SecondNetworkStrategyRepo()
        let localStratagy = SecondLocalStrategyRepo(coreDataStack: coreDataStack)
        
        super.init(networkStratagy: networkStratagy, localStratagy: localStratagy)
    }
    
    func loadUser(userId: Int) async throws -> UserDetail? {
        return try await repo.loadUser(userId: userId)
    }
    
    var repo: SecondRepository {
        return repository as! SecondRepository
    }
}

class SecondNetworkStrategyRepo : NetworkRepoStratagy, SecondRepository {
    func loadUser(userId: Int) async throws -> UserDetail? {
        return nil
    }
}

class SecondLocalStrategyRepo : LocalRepoStrategy, SecondRepository {
    func loadUser(userId: Int) async throws -> UserDetail? {
        return nil
    }
}

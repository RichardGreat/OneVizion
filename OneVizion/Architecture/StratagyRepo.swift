//
//  RepoStratagy.swift
//  OneVizion
//
//  Created by macbookpro on 19/11/24.
//
import Foundation

protocol ConnectivityStrategy {
    var isConnected: Bool { get }
}

class DefaultConnectivityStrategy: ConnectivityStrategy {
    var isConnected: Bool {
        return true
    }
}

protocol Repository {}

class NetworkRepoStratagy: Repository {
    private let decoder: JSONDecoder
    
    init() {
        decoder = JSONDecoder()
    }
}

class LocalRepoStrategy: Repository {
    private let coreDataStack: CoreDataStack
    
    init(coreDataStack: CoreDataStack) {
        self.coreDataStack = coreDataStack
    }
}

class StrategyRepository {
    private let networkStratagy: Repository
    private let localStratagy: Repository
    
    let repository: Repository
    
    init(networkStratagy: Repository, localStratagy: Repository,
         connectivityStrategy: ConnectivityStrategy = DefaultConnectivityStrategy()) {
        self.networkStratagy = networkStratagy
        self.localStratagy = localStratagy
        
        if connectivityStrategy.isConnected {
            repository = networkStratagy
        } else {
            repository = localStratagy
        }
    }
}

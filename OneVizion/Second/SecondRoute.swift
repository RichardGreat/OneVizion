//
//  SecondRoute.swift
//  OneVizion
//
//  Created by macbookpro on 19/11/24.
//
import UIKit

class SecondRoute: Route {
    private let userId: Int
    private let coreDataStack: CoreDataStack
    private let navigationController: UINavigationController
    
    init(userId: Int,
         coreDataStack: CoreDataStack,
         navigationController: UINavigationController) {
        self.userId = userId
        self.coreDataStack = coreDataStack
        self.navigationController = navigationController
    }
    
    func launch() {
        let screen = SecondScreenFactory(userId: userId, dataStack: coreDataStack, delegate: self).build()
        
        navigationController.pushViewController(screen, animated: true)
    }
}

extension SecondRoute: SecondPresenterDelegate {}

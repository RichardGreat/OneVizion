//
//  FirstRoute.swift
//  OneVizion
//
//  Created by macbookpro on 19/11/24.
//

import UIKit

class FirstRoute: Route {
    private let navigationController: UINavigationController
    
    private var secondRoute: SecondRoute?
    private let coreDataStack: CoreDataStack
    
    init(navigationController: UINavigationController, coreDataStack: CoreDataStack) {
        self.navigationController = navigationController
        self.coreDataStack = coreDataStack
    }
    
    func launch() {
        let screen = FirstScreenFactory(delegate: self, dataStack: coreDataStack).build()
        navigationController.setViewControllers([screen], animated: true)
    }
}

extension FirstRoute: FirstPresenterDelegate {
    func openSecondScreen(userId: Int) {
        secondRoute = SecondRoute(userId: userId, coreDataStack: coreDataStack, navigationController: navigationController)
        
        secondRoute?.launch()
    }
}

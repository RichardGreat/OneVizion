//
//  FirstScreenFactory.swift
//  OneVizion
//
//  Created by macbookpro on 19/11/24.
//

import Foundation

class FirstScreenFactory: ScreenFactory {
    private weak var delegate: FirstPresenterDelegate?
    private let dataStack: CoreDataStack
    
    init(delegate: FirstPresenterDelegate?, dataStack: CoreDataStack) {
        self.delegate = delegate
        self.dataStack = dataStack
    }
    
    func build() -> Screen {
        let screen = FirstScreen()
        
        let strategy = FirstStrategyRepository(coreDataStack: dataStack)
        
        let presenter = FirstScreenPresenter(view: screen, repository: strategy, delegate: delegate)
        
        screen.presenter = presenter
        
        return screen
    }
}

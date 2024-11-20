//
//  SecondScreenFactory.swift
//  OneVizion
//
//  Created by macbookpro on 19/11/24.
//

class SecondScreenFactory: ScreenFactory {
    
    private let userId: Int
    private let dataStack: CoreDataStack
    private weak var delegate: SecondPresenterDelegate?
    
    init(userId: Int, dataStack: CoreDataStack, delegate: SecondPresenterDelegate?) {
        self.dataStack = dataStack
        self.delegate = delegate
        self.userId = userId
    }
    
    func build() -> Screen {
        let screen = SecondScreen()
        
        let repository = SecondStrategyRepository(coreDataStack: dataStack)
        
        let presenter = SecondScreenPresenter(userId: userId, view: screen, repository: repository, delegate: delegate)
        screen.presenter = presenter
        
        return screen
    }
}

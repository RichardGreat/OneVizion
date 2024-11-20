//
//  SecondScreen.swift
//  OneVizion
//
//  Created by macbookpro on 19/11/24.
//

import UIKit

protocol SecondScreenView: AnyObject {
    func set(progress: Bool)
    
    func set(errorMessage: String)
    
    func update(user: UserDetail)
}

class SecondScreen: UIViewController, Screen, SecondScreenView {

    var presenter: SecondScreenPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    
        debugPrint("Second Screen")
        
        presenter?.fetchData()
    }
    
    func set(progress: Bool) {
        debugPrint(progress ? "... Loading" : "Finished")
    }
    
    func set(errorMessage: String) {
        debugPrint(errorMessage)
    }
    
    func update(user: UserDetail) {
        
    }
}

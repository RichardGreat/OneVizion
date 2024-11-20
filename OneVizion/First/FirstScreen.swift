//
//  FirstScreen.swift
//  OneVizion
//
//  Created by macbookpro on 19/11/24.
//

import UIKit

protocol FirstScreenView: AnyObject {
    func set(progress: Bool)
    
    func set(errorMessage: String)
    
    func reloadData()
    
    func emptyScreen()
}

class FirstScreen: UIViewController, Screen, FirstScreenView {
 
    var presenter: FirstScreenPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        debugPrint("First Screen")
        
        presenter?.fetchData()
    }
    
    func set(progress: Bool) {
        debugPrint(progress ? "... Loading" : "Finished")
    }
    
    func set(errorMessage: String) {
        debugPrint(errorMessage)
    }
    
    func reloadData() {
        debugPrint("reloadData")
    }
    
    func emptyScreen() {
        debugPrint("empty screen")
    }
}

//
//  InitialRoute.swift
//  OneVizion
//
//  Created by macbookpro on 19/11/24.
//

import UIKit

public class InitialRouter: Route {
    private var starterRoute: Route?
    private let window: UIWindow
    
    private let navigationController: UINavigationController
    
    public init(window: UIWindow = UIWindow(),
                navigationController: UINavigationController = UINavigationController()) {
        self.window = window
        self.navigationController = navigationController
        
        configureWindow()
    }
    
    private func configureWindow() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    public func configure(starter route: Route) {
        self.starterRoute = route
    }
    
    public func launch() {
        starterRoute?.launch()
    }
}

//
//  FirstPresenter.swift
//  OneVizion
//
//  Created by macbookpro on 19/11/24.
//

import Foundation

protocol FirstPresenterDelegate: AnyObject {
    func openSecondScreen(userId: Int)
}

class FirstScreenPresenter {
    private weak var view: FirstScreenView?
    private weak var delegate: FirstPresenterDelegate?
    private let repository: FirstRepository
    
    private var data: [User]?
    
    var users: [User] { return data ?? [] }
    
    init(view: FirstScreenView, repository: FirstRepository, delegate: FirstPresenterDelegate?) {
        self.view = view
        self.repository = repository
        self.delegate = delegate
    }
    
    func fetchData() {
        Task {
            view?.set(progress: true)
            do {
                data = try await repository.loadUsers()
                
                if data != nil && data!.isEmpty {
                    view?.emptyScreen()
                } else if data == nil {
                    view?.set(errorMessage: "no data found")
                } else {
                    view?.reloadData()
                }
                
            } catch {
                debugPrint(error.localizedDescription)
                view?.set(errorMessage: error.localizedDescription)
            }
            view?.set(progress: false)
        }
    }
    
    func openSecondScreen(user: User) {
        delegate?.openSecondScreen(userId: user.id)
    }
}

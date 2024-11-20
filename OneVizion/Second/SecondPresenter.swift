//
//  SecondPresenter.swift
//  OneVizion
//
//  Created by macbookpro on 19/11/24.
//
protocol SecondPresenterDelegate: AnyObject {}

class SecondScreenPresenter {
    private let userId: Int
    private weak var view: SecondScreenView?
    private let repository: SecondRepository
    private weak var delegate: SecondPresenterDelegate?
    
    init(userId: Int,
         view: SecondScreenView? = nil,
         repository: SecondRepository,
         delegate: SecondPresenterDelegate? = nil) {
        self.userId = userId
        self.view = view
        self.repository = repository
        self.delegate = delegate
    }
    
    func fetchData() {
        Task {
            view?.set(progress: true)
            do {
                let user: UserDetail? = try await repository.loadUser(userId: userId)
                if user == nil {
                    view?.set(errorMessage: "User not found")
                } else {
                    view?.update(user: user!)
                }
            } catch {
                view?.set(errorMessage: error.localizedDescription)
            }
            view?.set(progress: false)
        }
    }
}

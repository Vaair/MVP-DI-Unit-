//
//  Presenter.swift
//  MVP (+DI+Unit)
//
//  Created by Лера Тарасенко on 30.01.2022.
//

import Foundation

protocol MainPresenterProtocol{
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) //для DI
    func getComments()
    var comments: [Comment]? {get set}
    func tapOnTheCell(comment: Comment?)
}

class MainPresenter: MainPresenterProtocol {
    weak var view: MainViewProtocol?
    var router: RouterProtocol?
    let networkService: NetworkServiceProtocol!
    
    var comments: [Comment]?
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        getComments()
    }
    
    func getComments() {
        networkService.getComments { [weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async{
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    func tapOnTheCell(comment: Comment?) {
        router?.showDetail(comment: comment)
    }
}

//
//  DetailPresenter.swift
//  MVP (+DI+Unit)
//
//  Created by Лера Тарасенко on 30.01.2022.
//

import Foundation

protocol DetailPresenterProtocol: AnyObject{
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, comment: Comment?,
         router: RouterProtocol)
    func setComment()
    func popToRoot()
}

class DetailPresenter: DetailPresenterProtocol {
    weak var view: DetailViewProtocol?
    var networkService: NetworkServiceProtocol! //для будущей реализации
    var router: RouterProtocol?
    var comment: Comment?
    
    required init(view: DetailViewProtocol,
                  networkService: NetworkServiceProtocol,
                  comment: Comment?,
                  router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.comment = comment
        self.router = router
    }
    
    public func setComment() {
        self.view?.setComment(comment: comment)
    }
    
    func popToRoot(){
        router?.popToRoot()
    }
}

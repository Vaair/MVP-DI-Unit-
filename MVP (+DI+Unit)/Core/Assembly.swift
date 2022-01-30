//
//  Assembly.swift
//  MVP (+DI+Unit)
//
//  Created by Лера Тарасенко on 30.01.2022.
//

import UIKit

protocol AssemblyProtocol{
    func createMainModule(router: RouterProtocol) -> UIViewController
    func createDetailModule(comment: Comment?, router: RouterProtocol) -> UIViewController
}

class Assembly: AssemblyProtocol{
    func createMainModule(router: RouterProtocol) -> UIViewController {
        let view = ViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view,
                                      networkService: networkService,
                                      router: router) //DI (для тестов и не только)
        view.presenter = presenter
        return view
    }
    
    func createDetailModule(comment: Comment?, router: RouterProtocol) -> UIViewController {
        let view = DetailViewController()
        let networkService = NetworkService()
        let presenter = DetailPresenter(view: view,
                                        networkService: networkService,
                                        comment: comment,
                                        router: router)
        view.presenter = presenter
        return view
    }
}

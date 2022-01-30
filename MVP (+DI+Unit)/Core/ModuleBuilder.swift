//
//  ModuleBuilder.swift
//  MVP (+DI+Unit)
//
//  Created by Лера Тарасенко on 30.01.2022.
//

import UIKit

//Assembly

protocol Builder{
    static func createMainModule() -> UIViewController
    static func createDetailModule(comment: Comment?) -> UIViewController
}

class ModuleBuilder: Builder{
    static func createMainModule() -> UIViewController {
        let view = ViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService) //DI (для тестов и не только)
        view.presenter = presenter
        return view
    }
    
    static func createDetailModule(comment: Comment?) -> UIViewController {
        let view = DetailViewController()
        let networkService = NetworkService()
        let presenter = DetailPresenter(view: view, networkService: networkService, comment: comment)
        view.presenter = presenter
        return view
    }
}

//
//  Router.swift
//  MVP (+DI+Unit)
//
//  Created by Лера Тарасенко on 30.01.2022.
//

import UIKit
 
protocol RouterMainProtocol{
    var navigationController: UINavigationController {get set}
    var assembly: AssemblyProtocol {get set}
}

protocol RouterProtocol: RouterMainProtocol{
    func initialViewController()
    func showDetail(comment: Comment?)
    func popToRoot()
}

class Router: RouterProtocol{
    var navigationController: UINavigationController
    var assembly: AssemblyProtocol
    
    init(navigationController: UINavigationController, assembly: AssemblyProtocol){
        self.navigationController = navigationController
        self.assembly = assembly
    }
    
    func initialViewController() {
        let vc = assembly.createMainModule(router: self)
        navigationController.viewControllers = [vc]
    }
    
    func showDetail(comment: Comment?) {
        let vc = assembly.createDetailModule(comment: comment, router: self)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func popToRoot() {
        navigationController.popViewController(animated: true)
    }
}

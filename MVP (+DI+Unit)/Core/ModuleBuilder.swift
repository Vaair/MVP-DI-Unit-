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
}

class ModuleBuilder: Builder{
    static func createMainModule() -> UIViewController {
        let model = Person(firstName: "David", secondName: "Blain")
        let view = ViewController()
        let presenter = MainPresenter(view: view, person: model) //DI (для тестов)
        view.presenter = presenter
        return view
    }
}

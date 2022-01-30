//
//  Presenter.swift
//  MVP (+DI+Unit)
//
//  Created by Лера Тарасенко on 30.01.2022.
//

import Foundation

protocol MainPresenterProtocol{
    init(view: MainViewProtocol, person: Person) //для DI
    func showGreeting()
}

class MainPresenter: MainPresenterProtocol {
    let view: MainViewProtocol
    let person: Person
    
    required init(view: MainViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }
    
    func showGreeting() {
        let greeting = person.firstName + " " + person.secondName
        view.setGreeting(greeting: greeting)
    }
    
    
}

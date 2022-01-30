//
//  ViewController.swift
//  MVP (+DI+Unit)
//
//  Created by Лера Тарасенко on 30.01.2022.
//

import UIKit

protocol MainViewProtocol: AnyObject{
    func setGreeting(greeting: String)
}

class ViewController: UIViewController {
    
    let greetingLabel: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.backgroundColor = .gray
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let pressButton: UIButton = {
        let button = UIButton()
        button.sizeToFit()
        button.backgroundColor = .blue
        button.setTitle("Press", for: .normal)
        button.addTarget(self, action: #selector(didPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var presenter: MainPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        arrangeLabel()
        arrangeButton()
    }

    private func arrangeLabel(){
        view.addSubview(greetingLabel)
        NSLayoutConstraint.activate([
            greetingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            greetingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    private func arrangeButton(){
        view.addSubview(pressButton)
        NSLayoutConstraint.activate([
            pressButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pressButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100)])
    }
    
    @objc func didPressed(){
        presenter.showGreeting()
    }

}

extension ViewController: MainViewProtocol{
    func setGreeting(greeting: String) {
        greetingLabel.text = greeting
    }
    
    
}

//
//  DetailView.swift
//  MVP (+DI+Unit)
//
//  Created by Лера Тарасенко on 30.01.2022.
//

import UIKit

protocol DetailViewProtocol: AnyObject{
    func setComment(comment: Comment?)
}

class DetailViewController: UIViewController{
    var presenter: DetailPresenterProtocol!
    
    var textLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var popButton: UIButton = {
        let button = UIButton()
        button.setTitle("Pop", for: .normal)
        button.sizeToFit()
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(popAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        arrangeLabel()
        arrangeButton()
        presenter.setComment()
    }
    
    private func setupView(){
        view.backgroundColor = .white
    }
    
    private func arrangeLabel(){
        view.addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
            textLabel.heightAnchor.constraint(equalTo: view.heightAnchor)])
    }
    
    private func arrangeButton(){
        view.addSubview(popButton)
        NSLayoutConstraint.activate([
            popButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            popButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100)])
    }
    
    @objc func popAction(){
        presenter.popToRoot()
    }
}

extension DetailViewController: DetailViewProtocol{
    func setComment(comment: Comment?) {
        textLabel.text = comment?.body
    }
}

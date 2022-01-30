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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        arrangeLabel()
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
}

extension DetailViewController: DetailViewProtocol{
    func setComment(comment: Comment?) {
        textLabel.text = comment?.body
    }
}

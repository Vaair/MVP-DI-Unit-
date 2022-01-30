//
//  ViewController.swift
//  MVP (+DI+Unit)
//
//  Created by Лера Тарасенко on 30.01.2022.
//

import UIKit

protocol MainViewProtocol: AnyObject{
    func success()
    func failure(error: Error)
}

class ViewController: UIViewController {
    var presenter: MainPresenterProtocol!
    
    var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        setupDelegate()
        registerCell()
        
        arrangeTableView()
    }
    
    private func setupView(){
        view.backgroundColor = .white
    }

    private func setupDelegate(){
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func registerCell(){
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseId)
    }
   
    private func arrangeTableView(){
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor)])
    }
}

//MARK: - MainViewProtocol
extension ViewController: MainViewProtocol{
    func success() {
        tableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}

//MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.comments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseId, for: indexPath) as? TableViewCell else {return UITableViewCell()}
        let comment = presenter.comments?[indexPath.row]
        cell.titleLabel.text = comment?.body
        
        return cell
    }
    
}

//MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let comment = presenter.comments?[indexPath.row]
        let detailVC = ModuleBuilder.createDetailModule(comment: comment)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

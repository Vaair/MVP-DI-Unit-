//
//  NetworkService.swift
//  MVP (+DI+Unit)
//
//  Created by Лера Тарасенко on 30.01.2022.
//

import Foundation

protocol NetworkServiceProtocol{
    func getComments(completion: @escaping (Result<[Comment]?, Error>)->( ))
}

class NetworkService: NetworkServiceProtocol{
    func getComments(completion: @escaping (Result<[Comment]?, Error>) -> ()) {
        let urlString = "https://jsonplaceholder.typicode.com/comments"
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, responce, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else { return }
            
            do {
                let obj = try JSONDecoder().decode([Comment].self, from: data)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    
}

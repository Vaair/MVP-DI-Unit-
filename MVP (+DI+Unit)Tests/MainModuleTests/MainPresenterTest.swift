//
//  MainPresenterTest.swift
//  MVP (+DI+Unit)Tests
//
//  Created by Лера Тарасенко on 30.01.2022.
//

import XCTest
@testable import MVP___DI_Unit_

class MockView: MainViewProtocol{
    func success() {
        
    }
    
    func failure(error: Error) {
        
    }
    
   
}

class MockNetworService: NetworkServiceProtocol{
    var comments: [Comment]!
    
    init(){}
    
    convenience init(comments: [Comment]?){
        self.init()
        self.comments = comments
    }
    
    func getComments(completion: @escaping (Result<[Comment]?, Error>) -> ()) {
        if let comments = comments{
            completion(.success(comments))
        } else {
            let error = NSError(domain: "", code: 0, userInfo: nil)
            completion(.failure(error))
        }
    }
    
    
}

class MainPresenterTest: XCTestCase {
    
    var mockView: MockView!
    var networkService: NetworkServiceProtocol!
    var presenter: MainPresenter!
    var router: RouterProtocol!
    var comments = [Comment]()

    override func setUpWithError() throws {
        let nav = UINavigationController()
        let assembly = Assembly()
        router = Router(navigationController: nav, assembly: assembly)
    }

    override func tearDownWithError() throws {
        mockView = nil
        networkService = nil
        presenter = nil
    }

    func testGetSuccessComments(){
        let comment = Comment(postId: 1,
                              id: 2,
                              name: "Baz",
                              email: "Bar",
                              body: "Foo")
        comments.append(comment)
        
        mockView = MockView()
        networkService = MockNetworService(comments: comments)
        presenter = MainPresenter(view: mockView, networkService: networkService, router: router)
        
        var catchComments: [Comment]?
        
        networkService.getComments { result in
            switch result {
            case .success(let comments):
                catchComments = comments
            case .failure(let error):
                print(error)
            }
        }
        
        XCTAssertNotEqual(catchComments?.count, 0)
        XCTAssertEqual(catchComments?.count, comments.count)
    }
    
    func testGetFailureComments(){
        let comment = Comment(postId: 1,
                              id: 2,
                              name: "Baz",
                              email: "Bar",
                              body: "Foo")
        comments.append(comment)
        
        mockView = MockView()
        networkService = MockNetworService()
        presenter = MainPresenter(view: mockView, networkService: networkService, router: router)
        
        var catchError: Error?
        
        networkService.getComments { result in
            switch result {
            case .success(let comments):
                print(comments as Any)
                break
            case .failure(let error):
                catchError = error
            }
        }
        
        XCTAssertNotNil(catchError)
    }

}

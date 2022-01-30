//
//  RouterTest.swift
//  MVPTests
//
//  Created by Лера Тарасенко on 30.01.2022.
//

import XCTest
@testable import MVP___DI_Unit_

class MockNavigationController: UINavigationController{
    var presentesVC: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        self.presentesVC = viewController
    }
}

class RouterTest: XCTestCase {
    
    var router: RouterProtocol!
    var navigationController = MockNavigationController()
    let assembly = Assembly()

    override func setUpWithError() throws {
        router = Router(navigationController: navigationController, assembly: assembly)
    }

    override func tearDownWithError() throws {
        router = nil
    }
    
    func testRouter(){
        router.showDetail(comment: nil)
        let detailVC = navigationController.presentesVC
        XCTAssertTrue(detailVC is DetailViewController)
    }

}

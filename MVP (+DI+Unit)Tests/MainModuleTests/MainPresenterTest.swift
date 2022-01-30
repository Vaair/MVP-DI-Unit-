//
//  MainPresenterTest.swift
//  MVP (+DI+Unit)Tests
//
//  Created by Лера Тарасенко on 30.01.2022.
//

import XCTest
@testable import MVP___DI_Unit_

class MockView: MainViewProtocol{
    var titleTest: String?
    func setGreeting(greeting: String) {
        self.titleTest = greeting
    }
}

class MainPresenterTest: XCTestCase {
    
    var mockView: MockView!
    var person: Person!
    var presenter: MainPresenter!

    override func setUpWithError() throws {
        mockView = MockView()
        person = Person(firstName: "baz", secondName: "bar")
        presenter = MainPresenter(view: mockView, person: person)
    }

    override func tearDownWithError() throws {
        mockView = nil
        person = nil
        presenter = nil
    }

    func testModuleIsNotNil(){
        XCTAssertNotNil(mockView, "mockView is nil")
        XCTAssertNotNil(person, "person is nil")
        XCTAssertNotNil(presenter, "presenter is nil")
    }
    
    func testView(){
        presenter.showGreeting()
        XCTAssertEqual(mockView.titleTest, "baz bar", "mockView.titleTest is not equal \"baz bar\"")
    }
    
    func testModel(){
        XCTAssertEqual(person.firstName, "baz", "firstName")
        XCTAssertEqual(person.secondName, "bar", "lastName")
    }

}

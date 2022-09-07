//
//  EditInteractorTest.swift
//  RydeContactAppTests
//
//  Created by Vaisakh on 5/9/22.
//

import XCTest
@testable import RydeContactApp

class EditInteractorTest: XCTestCase {
    var mockPresenter: FakeEditInteractionToPresenter?
    var sut: EditViewInteractor?
    override func setUpWithError() throws {
        mockPresenter = FakeEditInteractionToPresenter()
        sut = EditViewInteractor()
        sut?.presenter = mockPresenter
        
        let networkHandler = NetworkHandler.sharedHandler
        let fileHandler = FileHandler.sharedHandler
        let url = URL(string: "https://reqres.in/api/users/700")
        NetworkURLSessionMock.testURLs = [url: fileHandler.getDataFromFile(name: "MockEditResponse")]
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [NetworkURLSessionMock.self]
        let session = URLSession(configuration: config)
        networkHandler.defaultSession = session
        sut?.networkHander = networkHandler
        
    }

    override func tearDownWithError() throws {
        mockPresenter = nil
        sut = nil
    }
    
    func testGetContactEdits() {
        sut?.getContactEdits(for: 7)
    }

    func testGetInvalidContactDetails() {
        sut?.getContactEdits(for: 700)
    }
    
    func testUpdateContact () {
        sut?.updateCandidateDetails(for: 700, firstName: "Test", lastName: "TestLast", mobile: "", email: "")
    }
}

// MARK: - Mock up Edit interactor to presenter protocol
class FakeEditInteractionToPresenter: EditInteractorToPresenterProtocol {
    func contactResultFailed(message: String) {
        XCTAssertNotNil(message, "Contact Edit error Message is Nil")
    }
    
    func contactResult(data: Contact, from isEditing: Bool) {
        XCTAssertNotNil(data, "Contact Edit Result is Nil")
    }
}

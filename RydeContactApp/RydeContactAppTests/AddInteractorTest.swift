//
//  AddInteractorTest.swift
//  RydeContactAppTests
//
//  Created by Vaisakh on 6/9/22.
//

import XCTest
@testable import RydeContactApp

class AddInteractorTest: XCTestCase {
    var mockPresenter: FakeAddInteractionToPresenter?
    var sut: AddViewInteractor?
    
    override func setUpWithError() throws {
        mockPresenter = FakeAddInteractionToPresenter()
        sut = AddViewInteractor()
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
    
    func testUpdateCandidateDetails() {
        sut?.updateCandidateDetails(firstName: "Test", lastName: "Test", mobile: "", email: "")
    }

    func testUpdateCandidateDetailsWithNil() {
        sut?.updateCandidateDetails(firstName: nil, lastName: nil, mobile: "", email: "")
    }
    
    func testUpdateCandidateDetailsWithEmpty() {
        sut?.updateCandidateDetails(firstName: "", lastName: "", mobile: "", email: "")
    }
}

// MARK: - Mock up Add interactor to presenter protocol
class FakeAddInteractionToPresenter: AddInteractorToPresenterProtocol {
    func contactResultFailed(message: String) {
        XCTAssertNotNil(message, "Contact add error Message is Nil")
    }
    
    func contactResult(data: Contact, from isAdding: Bool) {
        XCTAssertNotNil(data, "Contact Add result is Nil")
    }
    
    func contactValidationFailed(message:String) {
        XCTAssertNotNil(message, "Contact add error Message is Nil")
    }
    
}

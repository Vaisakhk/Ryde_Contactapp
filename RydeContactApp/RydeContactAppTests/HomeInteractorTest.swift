//
//  HomeInteractorTest.swift
//  RydeContactAppTests
//
//  Created by Vaisakh on 5/9/22.
//

import XCTest
@testable import RydeContactApp

class HomeInteractorTest: XCTestCase {
    var mockPresenter: FakeHomeInteractionToPresenter?
    var sut: HomeInteractor?
    
    override func setUpWithError() throws {
        mockPresenter = FakeHomeInteractionToPresenter()
        sut = HomeInteractor()
        sut?.presenter = mockPresenter
        
        let networkHandler = NetworkHandler.sharedHandler
        let fileHandler = FileHandler.sharedHandler
        let url = URL(string: "https://reqres.in/api/users?per_page=10&page=0")
        let invalidUrl = URL(string: "https://reqres.in/api/users?per_page=10&page=100")
        NetworkURLSessionMock.testURLs = [url: fileHandler.getDataFromFile(name: "Contact"), invalidUrl:fileHandler.getDataFromFile(name: "Contact_invalid")]
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

    func testGetContactData() {
        sut?.getContactData(for: 0)
    }
    
    func testGetContactInvalidData() {
        sut?.getContactData(for: 100)
    }
    
    func testGetSavedContactDetails() {
        sut?.getSavedContactDetails()
    }
}

// MARK: - Mock up Home interactor to presenter protocol
class FakeHomeInteractionToPresenter: HomeInteractorToPresenterProtocol {
    func contactResultData(data: [Contact], with totalPages: Int) {
        XCTAssertNotNil(data, "Contact Result is Nil")
    }
    
    func contactFetchFailedWithError(errorString: String) {
        XCTAssertNotNil(errorString, "errorString is Nil")
    }
    
}

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
    }

    override func tearDownWithError() throws {
        mockPresenter = nil
        sut = nil
    }

    func testGetContactData() {
        sut?.getContactData(for: 0)
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

//
//  DetailInteractorTest.swift
//  RydeContactAppTests
//
//  Created by Vaisakh on 5/9/22.
//

import XCTest
@testable import RydeContactApp

class DetailInteractorTest: XCTestCase {
    var mockPresenter: FakeDetailInteractionToPresenter?
    var sut: DetailViewInteractor?
    
    override func setUpWithError() throws {
        mockPresenter = FakeDetailInteractionToPresenter()
        sut = DetailViewInteractor()
        sut?.presenter = mockPresenter
    }

    override func tearDownWithError() throws {
        mockPresenter = nil
        sut = nil
    }
    
    func testGetContactDetails() {
        sut?.getContactDetails(for: 7)
    }

    func testGetInvalidContactDetails() {
        sut?.getContactDetails(for: 700)
    }
}

// MARK: - Mock up Detail interactor to presenter protocol
class FakeDetailInteractionToPresenter: DetailInteractorToPresenterProtocol {
    func contactResult(data: Contact) {
        XCTAssertNotNil(data, "Contact Result is Nil")
    }
}

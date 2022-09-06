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
    }

    override func tearDownWithError() throws {
        mockPresenter = nil
        sut = nil
    }
    
    func testUpdateCandidateDetails() {
        sut?.updateCandidateDetails(firstName: "Test", lastName: "Test", mobile: "", email: "")
    }

}

// MARK: - Mock up Add interactor to presenter protocol
class FakeAddInteractionToPresenter: AddInteractorToPresenterProtocol {
    func contactResult(data: Contact, from isAdding: Bool) {
        XCTAssertNotNil(data, "Contact Add result is Nil")
    }
    
    func contactValidationFailed(message:String) {
        XCTAssertNotNil(message, "Contact add error Message is Nil")
    }
    
}

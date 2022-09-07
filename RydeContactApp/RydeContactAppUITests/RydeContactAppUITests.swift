//
//  RydeContactAppUITests.swift
//  RydeContactAppUITests
//
//  Created by Vaisakh on 4/9/22.
//

import XCTest

class RydeContactAppUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDownWithError() throws {
        
    }
    
    /*
     * Home view UI Testing
     */
    func testHomeNavigationBar() {
        let contactNavigationBar = app.navigationBars["Contact"]
        XCTAssert(contactNavigationBar.exists, "Conact Navigation bar not exists" )
        let groupsButton = contactNavigationBar.buttons["Groups"]
        XCTAssert(groupsButton.exists, "Group button not exists" )
        XCTAssert(groupsButton.isEnabled, "User interaction not enabled for Group button" )
        groupsButton.tap()
        let plusButton = contactNavigationBar.buttons["Plus"]
        plusButton.tap()
        XCTAssert(plusButton.exists, "Plus button not exists" )
        XCTAssert(plusButton.isEnabled, "User interaction not enabled for Plus button" )
    }
    
    func testHomeTableView() {
        let tablewCell = app.tables.children(matching: .cell).element(boundBy: 0)
        XCTAssert(tablewCell.exists, "Conact TableView Cell not exists" )
        XCTAssert(tablewCell.isEnabled, "User interaction not enabled for Movie Collectionview Cell" )
    }
    
    /*
     * Add view UI Testing
     */
    func testAddViewNavigation() {
        let contactNavigationBar = app.navigationBars["Contact"]
        let groupsButton = contactNavigationBar.buttons["Groups"]
        groupsButton.tap()
        let plusButton = contactNavigationBar.buttons["Plus"]
        plusButton.tap()
        let addContactNavigationBar = app.navigationBars["Add Contact"]
        XCTAssert(addContactNavigationBar.exists, "Not navigated to Add Contact Screen" )
        let cancelButton = addContactNavigationBar.buttons["Cancel"]
        XCTAssert(cancelButton.exists, "Cancel button not exists" )
        XCTAssert(cancelButton.isEnabled, "User interaction not enabled for Cancel button" )
    
        let doneButton = addContactNavigationBar.buttons["Done"]
        XCTAssert(doneButton.exists, "Done button not exists" )
        XCTAssert(doneButton.isEnabled, "User interaction not enabled for Done button" )
        cancelButton.tap()
    }
    
    func testAddViewNavigationBar() {
        let contactNavigationBar = app.navigationBars["Contact"]
        let plusButton = contactNavigationBar.buttons["Plus"]
        plusButton.tap()
        let addContactNavigationBar = app.navigationBars["Add Contact"]
        
        let elementsQuery = app.scrollViews.otherElements
        let firstNameTextField = elementsQuery.textFields["First Name"]
        XCTAssert(firstNameTextField.exists, "First name not exists" )
        XCTAssert(firstNameTextField.isEnabled, "User interaction not enabled for First name" )
        firstNameTextField.tap()
        let lastNameTextField = elementsQuery.textFields["Last Name"]
        XCTAssert(lastNameTextField.exists, "Last name not exists" )
        XCTAssert(lastNameTextField.isEnabled, "User interaction not enabled for Last name" )
        addContactNavigationBar.buttons["Cancel"].tap()
    }
    
    /*
     * Detail view UI Testing
     */
    func testDetailViewNavigation() {
        let tableViewCell = app.tables.children(matching: .cell).element(boundBy: 0)
        XCTAssert(tableViewCell.exists, "Movie Collectionview Cell not exists" )
        XCTAssert(tableViewCell.isEnabled, "User interaction not enabled for contact tableview Cell" )
        tableViewCell.tap()
        let addContactNavigationBar = app.navigationBars["Detail"]
        XCTAssert(addContactNavigationBar.exists, "Not navigated to Detail View" )
    }
    
    func testDetailViewNavigationBarButton() {
        let tableViewCell = app.tables.children(matching: .cell).element(boundBy: 0)
        tableViewCell.tap()
        let addContactNavigationBar = app.navigationBars["Detail"]
        XCTAssert(addContactNavigationBar.exists, "Conact Detail Navigation bar not exists" )
        XCTAssert(addContactNavigationBar.isEnabled, "User interaction not enabled for Group button" )
        
        let addButton = addContactNavigationBar.buttons["Edit"]
        XCTAssert(addButton.exists, "Edit button not exists" )
        XCTAssert(addButton.isEnabled, "User interaction not enabled for Edit button" )
    
        let backButton = addContactNavigationBar.buttons["Contact"]
        XCTAssert(backButton.exists, "Back button not exists" )
        XCTAssert(backButton.isEnabled, "User interaction not enabled for Back button" )
        backButton.tap()
    }
    
    /*
     * Edit view UI Testing
     */
    func testEditContactViewNavigation() {
        let tableViewCell = app.tables.children(matching: .cell).element(boundBy: 0)
        XCTAssert(tableViewCell.exists, "Movie Collectionview Cell not exists" )
        XCTAssert(tableViewCell.isEnabled, "User interaction not enabled for contact tableview Cell" )
        tableViewCell.tap()
        let addContactNavigationBar = app.navigationBars["Detail"]
        XCTAssert(addContactNavigationBar.exists, "Not navigated to Detail View" )
        let addButton = addContactNavigationBar.buttons["Edit"]
        XCTAssert(addButton.exists, "Edit button not exists" )
        XCTAssert(addButton.isEnabled, "User interaction not enabled for Edit button" )
        addButton.tap()
        let editContactNavigationBar = app.navigationBars["Edit Contact"]
        XCTAssert(editContactNavigationBar.exists, "Not navigated to Edit Contact View" )
    }
    
    func testEditContactViewNavigationBarButton() {
        let tableViewCell = app.tables.children(matching: .cell).element(boundBy: 0)
        XCTAssert(tableViewCell.exists, "Movie Collectionview Cell not exists" )
        XCTAssert(tableViewCell.isEnabled, "User interaction not enabled for contact tableview Cell" )
        tableViewCell.tap()
        let addContactNavigationBar = app.navigationBars["Detail"]
        XCTAssert(addContactNavigationBar.exists, "Not navigated to Detail View" )
        let addButton = addContactNavigationBar.buttons["Edit"]
        XCTAssert(addButton.exists, "Edit button not exists" )
        XCTAssert(addButton.isEnabled, "User interaction not enabled for Edit button" )
        addButton.tap()
        let editContactNavigationBar = app.navigationBars["Edit Contact"]
        
        let cancelButton = editContactNavigationBar.buttons["Cancel"]
        XCTAssert(cancelButton.exists, "Cancel button not exists" )
        XCTAssert(cancelButton.isEnabled, "User interaction not enabled for Cancel button" )
    
        let doneButton = editContactNavigationBar.buttons["Done"]
        XCTAssert(doneButton.exists, "Done button not exists" )
        XCTAssert(doneButton.isEnabled, "User interaction not enabled for Done button" )
        cancelButton.tap()
    }
}

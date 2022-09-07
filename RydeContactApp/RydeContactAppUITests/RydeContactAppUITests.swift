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
        
//        let app = XCUIApplication()
//        let contactButton = app.navigationBars["Detail"].buttons["Contact"]
//        contactButton.tap()
//
//        let tablesQuery = app.tables
//        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Janet Weaver"]/*[[".cells.staticTexts[\"Janet Weaver\"]",".staticTexts[\"Janet Weaver\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        contactButton.tap()
//        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Eve Holt"]/*[[".cells.staticTexts[\"Eve Holt\"]",".staticTexts[\"Eve Holt\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        contactButton.tap()
//        tablesQuery.cells.containing(.staticText, identifier:"Charles Morris").element.tap()
//

//        let addContactNavigationBar = app.navigationBars["Add Contact"]
//        XCTAssert(addContactNavigationBar.exists, "Conact Detail Navigation bar not exists" )
//        XCTAssert(addContactNavigationBar.isEnabled, "User interaction not enabled for Group button" )
//        addContactNavigationBar.buttons["Done"].tap()
//        app.alerts[" Contact App "].scrollViews.otherElements.buttons["Ok"].tap()
//        addContactNavigationBar.buttons["Cancel"].tap()
    }
    
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
}

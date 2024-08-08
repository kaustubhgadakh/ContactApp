//
//  UITests.swift
//  ContactAppUITests
//
//  Created by Kaustubh Kishor Gadakh on 08/08/24.
//

import XCTest

final class UITests: XCTestCase {
    
    func testAddContactFlow(){
        let app = XCUIApplication()
        app.launch()
        func testAddContactFlow(){
            let app = XCUIApplication()
            app.launch()
            
            app.navigationBars["Contact"].buttons["plus"].tap()
            let firstNameField = app.textFields[""]
            firstNameField.tap()
            firstNameField.typeText("test")
            
            let lastNameField = app.textFields[""]
            lastNameField.tap()
            lastNameField.typeText("test")
            
            let mobileNumberField = app.textFields[""]
            mobileNumberField.tap()
            mobileNumberField.typeText("123-456-7890")
            
            let emailField = app.textFields[""]
            emailField.tap()
            emailField.typeText("test@gmail.com")
            
            app.buttons["Done"].tap()
            
            XCTAssertTrue(app.staticTexts["New Contact"].exists)
        }
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

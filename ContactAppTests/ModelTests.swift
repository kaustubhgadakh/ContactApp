//
//  ModelTests.swift
//  ContactAppTests
//
//  Created by Kaustubh Kishor Gadakh on 08/08/24.
//

import XCTest
@testable import ContactApp

final class ModelTests: XCTestCase {

    func testModelData(){
        let contact = Contact(firstName: "Test", lastName: "Test", mobileNumber: "123-456-7890", email: "test@gmail.com")
        XCTAssertEqual(contact.firstName, "Test")
        XCTAssertEqual(contact.lastName, "Test")
        XCTAssertEqual(contact.mobileNumber, "123-456-7890")
        XCTAssertEqual(contact.email, "test@gmail.com")
        XCTAssertFalse(contact.isFavorite)
    }

}

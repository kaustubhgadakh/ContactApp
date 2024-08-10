//
//  Contact.swift
//  ContactApp
//
//  Created by Kaustubh Kishor Gadakh on 07/08/24.
//

import Foundation
import SwiftUI

struct Contact: Identifiable{
    var id = UUID()
    var firstName: String
    var lastName: String
    var mobileNumber: String
    var email: String
    var isFavorite: Bool = false
    var image: UIImage?
}

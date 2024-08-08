//
//  ContactViewModel.swift
//  ContactApp
//
//  Created by Kaustubh Kishor Gadakh on 07/08/24.
//

import Foundation

class ContactViewModel: ObservableObject{
    @Published var contacts: [Contact] = []
    
    init(){
        dummyData()
    }
    
    func dummyData(){
        contacts = [
            Contact(firstName: "Kaustubh", lastName: "Gadakh", mobileNumber: "7249592512", email: "kaustubhgadakh@gmail.com", isFavorite: false),
            Contact(firstName: "Sunil", lastName: "Matkar", mobileNumber: "9834233273", email: "sunilmatkar2001@gmail.com", isFavorite: true),
            Contact(firstName: "Pratik", lastName: "Patil", mobileNumber: "7666098615", email: "pratikpatil@gmail.com", isFavorite: false),
            Contact(firstName: "Shwetark", lastName: "Kadam", mobileNumber: "8766419101", email: "shwetarkkadam2001@gmail.com", isFavorite: true),
            Contact(firstName: "Kaustubh", lastName: "Gadakh", mobileNumber: "7249592512", email: "kaustubhgadakh@gmail.com", isFavorite: false),
            Contact(firstName: "Sunil", lastName: "Matkar", mobileNumber: "9834233273", email: "sunilmatkar2001@gmail.com", isFavorite: true),
            Contact(firstName: "Pratik", lastName: "Patil", mobileNumber: "7666098615", email: "pratikpatil@gmail.com", isFavorite: false),
            Contact(firstName: "Shwetark", lastName: "Kadam", mobileNumber: "8766419101", email: "shwetarkkadam2001@gmail.com", isFavorite: true),
        ]
    }
}

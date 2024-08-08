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
            Contact(firstName: "Kaustubh", lastName: "Gadakh", mobileNumber: "7249592512", email: "kaustubhgadakh@gmail.com", isFavorite: false, image: "img1"),
            Contact(firstName: "Sunil", lastName: "Matkar", mobileNumber: "9834233273", email: "sunilmatkar2001@gmail.com", isFavorite: false, image: "img2"),
            Contact(firstName: "Pratik", lastName: "Patil", mobileNumber: "7666098615", email: "pratikpatil@gmail.com", isFavorite: true, image: "img6"),
            Contact(firstName: "Shwetark", lastName: "Kadam", mobileNumber: "8766419101", email: "shwetarkkadam2001@gmail.com", isFavorite: true, image: "img4"),
            Contact(firstName: "Bharath", lastName: "S", mobileNumber: "1234567890", email: "bharath2001@gmail.com", isFavorite: true, image: "img4"),
            Contact(firstName: "Vaibhav", lastName: "Chaudari", mobileNumber: "9834233273", email: "vaibhavchaudhari@gmail.com", isFavorite: true, image: "img5")
        ]
        
        contacts.sort{$0.firstName < $1.firstName}
    }
    
    func addContact(contact: Contact){
        contacts.append(contact)
    }
    
    func updateContact(contact: Contact){
        if let index = contacts.firstIndex(where: {$0.id == contact.id}){
            contacts[index] = contact
        }
    }
}

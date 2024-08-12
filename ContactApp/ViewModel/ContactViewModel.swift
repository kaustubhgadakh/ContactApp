//
//  ContactViewModel.swift
//  ContactApp
//
//  Created by Kaustubh Kishor Gadakh on 07/08/24.
//

import Foundation
import UIKit

class ContactViewModel: ObservableObject{
    @Published var contacts: [Contact] = []
    
    init(){
        dummyData()
    }
    
    func dummyData(){
        contacts = [
            Contact(firstName: "Kaustubh", lastName: "Gadakh", mobileNumber: "7249592512", email: "kaustubhgadakh@gmail.com", isFavorite: false, image: UIImage(resource: .img1)),
            Contact(firstName: "Sunil", lastName: "Matkar", mobileNumber: "9834233273", email: "sunilmatkar2001@gmail.com", isFavorite: false, image: UIImage(named: "img2")),
            Contact(firstName: "Pratik", lastName: "Patil", mobileNumber: "7666098615", email: "pratikpatil@gmail.com", isFavorite: true, image: UIImage(resource: .img6)),
            Contact(firstName: "Shwetark", lastName: "Kadam", mobileNumber: "8766419101", email: "shwetarkkadam2001@gmail.com", isFavorite: true, image: UIImage(resource: .img4)),
            Contact(firstName: "Bharath", lastName: "S", mobileNumber: "1234567890", email: "bharath2001@gmail.com", isFavorite: true, image: UIImage(resource: .img3)),
            Contact(firstName: "Vaibhav", lastName: "Chaudari", mobileNumber: "9834233273", email: "vaibhavchaudhari@gmail.com", isFavorite: true, image: UIImage(resource: .img5)),
            Contact(firstName: "Anirudha", lastName: "Kurhe", mobileNumber: "9172656770", email: "anirudhakurhe@gmail.com", isFavorite: false, image: UIImage(resource: .img2)),
            Contact(firstName: "Pappa", lastName: "👑", mobileNumber: "9890460177", email: "kishorgadakh@gmail.com", isFavorite: true, image: UIImage(resource: .ganeshImg))
        ]
        
        contacts.sort{$0.firstName < $1.firstName}
    }
    
    func addContact(contact: Contact){
        contacts.append(contact)
        contacts.sort{$0.firstName < $1.firstName}
    }
    
    func updateContact(contact: Contact){
        if let index = contacts.firstIndex(where: {$0.id == contact.id}){
            contacts[index] = contact
        }
    }
    
    func deleteContact(at offsets: IndexSet){
        contacts.remove(atOffsets: offsets)
    }
    
}

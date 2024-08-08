//
//  AddContactView.swift
//  ContactApp
//
//  Created by Kaustubh Kishor Gadakh on 08/08/24.
//

import SwiftUI

struct AddContactView: View {
    @ObservedObject var viewModel: ContactViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var mobileNumber: String = ""
    @State private var email: String = ""
    @State private var isFavorite: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color.gray.opacity(0.1)
                    .ignoresSafeArea()

                VStack{
                    LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0), Color("Icon").opacity(0.55)]), startPoint: .top, endPoint: .bottom)
                        
                        .overlay(alignment: .center) {
                            VStack{
                                Spacer()
                                Image("placeholder_photo")
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                    .background(
                                        Capsule()
                                            .stroke(Color.white, lineWidth: 2)
                                    )
                                    .overlay(
                                        Circle()
                                            .fill(Color.white)
                                            .frame(width: 50, height: 50)
                                            .overlay(
                                                Image("camera_button")
                                                    .font(.title)
                                                    .foregroundColor(.white)
                                            ), alignment: .bottomTrailing
                                    )
                                Spacer()
                            }
                            .padding(.bottom, 18)
                        }
                        .frame(height: 250)
                    
                    VStack(alignment: .leading) {
                        HStack(spacing: 32){
                            Text("First Name")
                                .font(.headline)
                                .foregroundStyle(.gray.opacity(0.5))
                                .frame(width: 90)
                                .multilineTextAlignment(.trailing)
                            
                            TextField("", text: $firstName)
                                .font(.headline)
                                .foregroundStyle(.gray)
                        }
                        .frame(height: 56)
                        .padding(.horizontal, 24)
                        Divider()
                        HStack(spacing: 32){
                            Text("Last Name")
                                .font(.headline)
                                .foregroundStyle(.gray.opacity(0.5))
                                .frame(width: 90)
                                .multilineTextAlignment(.trailing)
                            
                            TextField("", text: $lastName)
                                .font(.headline)
                                .foregroundStyle(.gray)
                        }
                        .frame(height: 56)
                        .padding(.horizontal, 24)
                        
                        Divider()
                        HStack(spacing: 32){
                            Text("      Mobile")
                                .font(.headline)
                                .foregroundStyle(.gray.opacity(0.5))
                                .frame(width: 90)
                                
                                
                            
                            TextField("", text: $mobileNumber)
                                .font(.headline)
                                .foregroundStyle(.gray)
                        }
                        .frame(height: 56)
                        .padding(.horizontal, 24)
                        Divider()
                        HStack(spacing: 32){
                            Text("      Email")
                                .font(.headline)
                                .foregroundStyle(.gray.opacity(0.5))
                                .frame(width: 90)
                                .multilineTextAlignment(.trailing)
                            
                            TextField("", text: $email)
                                .font(.headline)
                                .foregroundStyle(.gray)
                        }
                        .frame(height: 56)
                        .padding(.horizontal, 24)
                        Divider()
                        HStack(spacing: 32){
                            Toggle(isOn: $isFavorite) {
                                Text("   Favorite")
                                    .font(.headline)
                                    .foregroundStyle(.gray.opacity(0.5))
                                    .frame(width: 90)
                                    .multilineTextAlignment(.trailing)
                            }
                            
                        }
                        .frame(height: 56)
                        .padding(.horizontal, 24)
                    }
                    
                    Divider()
                    Spacer()
            
                }
            }
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Cancle")
                    .foregroundStyle(Color("Icon"))
            }), trailing: Button(action: {
                let newContact = Contact(firstName: firstName, lastName: lastName, mobileNumber: mobileNumber, email: email, isFavorite: isFavorite)
                viewModel.addContact(contact: newContact)
            }, label: {
                Text("Done")
                    .foregroundStyle(Color("Icon"))
            }))
        }
    }
}


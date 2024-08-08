//
//  ContactDetailView.swift
//  ContactApp
//
//  Created by Kaustubh Kishor Gadakh on 07/08/24.
//

import SwiftUI

struct ContactDetailView: View {
    @State private var editContact = false
    var contact: Contact
    @ObservedObject var viewModel: ContactViewModel
    var body: some View {
            ZStack{
                Color.gray.opacity(0.1)
                    .ignoresSafeArea()

                VStack{
                    LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0), Color("Icon").opacity(0.55)]), startPoint: .top, endPoint: .bottom)
                        
                        .overlay(alignment: .center) {
                            VStack{
                                Spacer()
                                if let image = contact.image{
                                    Image(uiImage: image)
                                        .resizable()
                                        .frame(width: 150, height: 150)
                                        .background(
                                            Capsule()
                                                .stroke(Color.white, lineWidth: 2)
                                        )
                                        
                                }else{
                                    Circle()
                                        .frame(width: 150, height: 150)
                                        .foregroundColor(.gray)
                                        .background(
                                            Capsule()
                                                .stroke(Color.white, lineWidth: 5.0)
                                        )
                                }
                                
                                Text("\(contact.firstName) \(contact.lastName)")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color("Font"))
                                    .padding(.top, 8)
                                
                                Spacer()
                                HStack(spacing: 36){
                                    VStack(alignment: .center){
                                        Image("message_button")
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                        Text("Message")
                                            .font(.system(size: 12))
                                    }
                                    VStack(alignment: .center){
                                        Image("call_button")
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                        Text("call")
                                            .font(.system(size: 12))
                                    }
                                    VStack(alignment: .center){
                                        Image("email_button")
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                        Text("email")
                                            .font(.system(size: 12))
                                    }
                                    VStack(alignment: .center){
                                        
                                        Image(contact.isFavorite ? "favourite_button_selected" : "favourite_button")
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                        Text("favourite")
                                            .font(.system(size: 12))
                                    }
                                }
                                .foregroundStyle(Color("Font"))
                                .padding(.horizontal, 40)
                                .padding(.bottom, 12)
                            }
                        }.frame(height: 335)
                    
                    VStack(alignment: .leading) {
                        HStack(spacing: 32){
                            Text("mobile")
                                .font(.headline)
                                .foregroundStyle(.gray.opacity(0.5))
                                .frame(width: 70)
                                .multilineTextAlignment(.trailing)
                            
                            Text("+ 91 \(contact.mobileNumber)")
                                .font(.headline)
                                .foregroundStyle(.gray)
                                .multilineTextAlignment(.leading)
                        }
                        .frame(height: 56)
                        .padding(.horizontal, 24)
                        Divider()
                        HStack(spacing: 32){
                            Text(" email")
                                .font(.headline)
                                .foregroundStyle(.gray.opacity(0.5))
                                .frame(width: 70)
                                .multilineTextAlignment(.trailing)
                            
                            Text(contact.email)
                                .font(.headline)
                                .foregroundStyle(.gray)
                                .multilineTextAlignment(.leading)
                        }
                        .frame(height: 56)
                        .padding(.horizontal, 24)
                    }
                    
                    
                    Divider()
                    Spacer()
            
                    
                }
                .navigationBarItems(trailing: Button(action: {
                    editContact.toggle()
                }, label: {
                    Text("Edit")
                        .foregroundStyle(Color("Icon"))
                })
                    .fullScreenCover(isPresented: $editContact, content: {
                        EditContactView(contact: contact, viewModel: viewModel)
                }))
                
                
            }
        
    }
}

//
//  EditContactView.swift
//  ContactApp
//
//  Created by Kaustubh Kishor Gadakh on 07/08/24.
//

import SwiftUI
import PhotosUI

struct EditContactView: View {
    @State var contact: Contact
    @ObservedObject var viewModel: ContactViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var addContactAlert: Bool = false
    @State private var img: UIImage?
    @State private var photosPickerItem: PhotosPickerItem?
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
                                PhotosPicker(selection: $photosPickerItem, matching: .images) {
                                    if let image = contact.image{
                                        Image(uiImage: image)
                                            .resizable()
                                            .frame(width: 150, height: 150)
                                            .clipShape(Circle())
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
                                    }else{
                                        Image("placeholder_photo")
                                            .resizable()
                                            .frame(width: 150, height: 150)
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
                                    }
                                }
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
                            
                            TextField("firstName", text: $contact.firstName)
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
                            
                            TextField("lastName", text: $contact.lastName)
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
                                
                                
                            
                            TextField("mobile", text: $contact.mobileNumber)
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
                            
                            TextField("email", text: $contact.email)
                                .font(.headline)
                                .foregroundStyle(.gray)
                        }
                        .frame(height: 56)
                        .padding(.horizontal, 24)
                        Divider()
                        HStack(spacing: 32){
                            Toggle(isOn: $contact.isFavorite) {
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
                .onChange(of: photosPickerItem) { _, _ in
                    Task{
                        if let photosPickerItem,
                           let data = try? await photosPickerItem.loadTransferable(type: Data.self){
                            if let image = UIImage(data: data){
                                img = image
                            }
                        }
                        
                        photosPickerItem = nil
                    }
                }
            }
            .navigationBarItems(leading: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Cancle")
                        .foregroundStyle(Color("Icon"))
                }), trailing: Button(action: {
                    addContactAlert.toggle()
                    viewModel.updateContact(contact: contact)
                }, label: {
                    Text("Done")
                        .foregroundStyle(Color("Icon"))
                }
                )
                .alert(isPresented: $addContactAlert, content: {
                    Alert(title: Text("Success"))
                })
            )
        }
    }
}


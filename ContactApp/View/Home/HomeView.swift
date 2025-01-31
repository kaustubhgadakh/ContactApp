//
//  HomeView.swift
//  ContactApp
//
//  Created by Kaustubh Kishor Gadakh on 07/08/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = ContactViewModel()
    @State private var addContact = false
    @State private var  showAlert = false

    
    var body: some View {
        NavigationView{
            ZStack {
                Color.gray.opacity(0.1)
                    .ignoresSafeArea(edges: .bottom)
                
                ScrollView {
                    HStack{
                        Text("A")
                            .foregroundStyle(.black)
                            .fontWeight(.bold)
                            .padding(.horizontal, 10)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding(10)
                    .background(Color("searchBackground"))
                    
                    ForEach(viewModel.contacts){contact in
                        NavigationLink(destination: ContactDetailView(contact: contact, viewModel: viewModel)){
                            HStack(spacing: 16){
                                if let image = contact.image{
                                    Image(uiImage: image)
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                }else{
                                    Image("placeholder_photo")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                }
                                
                                VStack(alignment: .leading){
                                    Text("\(contact.firstName) \(contact.lastName)")
                                        .fontWeight(.bold)
                                        .foregroundStyle(Color("Font"))
                                }
                                Spacer()
                                if contact.isFavorite{
                                    Image(systemName: "star.fill")
                                        .foregroundColor(Color("Icon"))
                                        .padding(.trailing, 32)
                                }
                            }
                            .padding(.leading ,16)
                            .padding(.vertical, 12)
                        }
                        Divider()
                    }
                    .navigationTitle("Contact")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(leading: Button(action: {
                        showAlert.toggle()
                    }, label: {
                            Text("Groups")
                                .foregroundStyle(Color("Icon"))
                                
                        }), trailing: Button(action: {
                            addContact.toggle()
                        }, label: {
                            Image(systemName: "plus")
                                .foregroundStyle(Color("Icon"))
                        })
                            .fullScreenCover(isPresented: $addContact, content: {
                                AddContactView(viewModel: viewModel)
                            })
                                .fullScreenCover(isPresented: $showAlert, content: {
                                    ContentUnavailable()
                                })
                                
                    )
                }
                .overlay(alignment: .trailing) {
                    AlphabetIndexView()
                }
                
            }
            
            Spacer()
        }
        .accentColor(Color("Icon"))
    }
}

#Preview {
    HomeView()
}



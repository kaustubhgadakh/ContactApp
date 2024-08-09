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
                            ContactListView(contact: contact)
                        }
                        Divider()
                    }
                    .navigationTitle("Contact")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(leading: Button(action: {}, label: {
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
                    )
                }
                .overlay(alignment: .trailing) {
                    AlphabetIndexView()
                }
                
            }
            
            Spacer()
        }
    }
}

#Preview {
    HomeView()
}



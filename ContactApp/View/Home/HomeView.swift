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
                    ForEach(viewModel.contacts){contact in
                        NavigationLink(destination: ContactDetailView()){
                            HStack(spacing: 16){
                                if let image = contact.image{
                                    Image(uiImage: image)
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                }else{
                                    Circle()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(.gray)
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
                            AddContactView()
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


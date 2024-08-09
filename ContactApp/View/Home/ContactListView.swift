//
//  ContactListView.swift
//  ContactApp
//
//  Created by Kaustubh Kishor Gadakh on 09/08/24.
//

import SwiftUI

struct ContactListView: View {
    @State var contact: Contact
    var body: some View {
        HStack(spacing: 16){
            if true{
                Image(contact.image!)
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
}


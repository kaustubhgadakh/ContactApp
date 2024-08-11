//
//  ContentUnavailable.swift
//  ContactApp
//
//  Created by Kaustubh Kishor Gadakh on 11/08/24.
//

import SwiftUI

struct ContentUnavailable: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            Color(uiColor: .secondarySystemBackground)
                .ignoresSafeArea()
            
            VStack {
                ContentUnavailableView("Page Not Found",
                                       systemImage: "icloud.slash",
                                       description: Text("404")
                )
            }
            
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "multiply")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .padding()
                    
            })
        }
    }
}

#Preview {
    ContentUnavailable()
}

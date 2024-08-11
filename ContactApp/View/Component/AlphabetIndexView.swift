//
//  AlphabetIndexView.swift
//  ContactApp
//
//  Created by Kaustubh Kishor Gadakh on 08/08/24.
//

import SwiftUI

struct AlphabetIndexView: View {
    let alphabet = "ABCDEFGHIJKIMNOPQRSTUVWXYZ#".map{String($0)}
    var body: some View {
        VStack(spacing: 2){
            ForEach(alphabet, id: \.self){letter in
                Text(letter)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
        }
        .padding(.trailing, 8)
    }
}

#Preview {
    AlphabetIndexView()
}

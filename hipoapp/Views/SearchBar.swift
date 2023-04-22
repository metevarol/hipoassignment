//
//  SearchBar.swift
//  hipoapp
//
//  Created by Mete Varol on 21.04.2023.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    
    @State private var isEditing = false
    
    var body: some View {
        VStack {
            TextField("Search...", text: $text)
                .frame(width: 285, height: 60)
                .padding(.leading, 15)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(40)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 15)
                        
                        if isEditing {
                            Button(action: {
                                withAnimation {
                                    self.text = ""
                                }
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
        }
        .onTapGesture {
            withAnimation {
                self.isEditing = true
            }
        }
    }
}

struct CustomSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}


